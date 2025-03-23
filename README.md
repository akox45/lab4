# Fényképalbum PaaS Környezetben

Ez a projekt egy Django alapú fényképalbum alkalmazás, amely PaaS (Platform as a Service) környezetben fut a Railway platformon.

## Tartalomjegyzék

- [Funkciók](#funkciók)
- [Technológiák](#technológiák)
- [Projekt Struktúra](#projekt-struktúra)
- [Telepítés és Használat](#telepítés-és-használat)
  - [Lokális Fejlesztés](#lokális-fejlesztés)
  - [Railway Deployment](#railway-deployment)
- [Fejlesztési Fázisok](#fejlesztési-fázisok)
- [Konfiguráció](#konfiguráció)


## Funkciók

- Fényképek feltöltése és törlése
- Minden képhez név (max. 40 karakter) és dátum tárolása
- Képek listázása név vagy dátum szerint rendezve
- Képek megtekintése részletes nézetben
- Felhasználókezelés (regisztráció, bejelentkezés, kilépés)
- Csak bejelentkezett felhasználók tölthetnek fel/törölhetnek képeket

## Technológiák

- **Backend:** Django 4.2
- **Frontend:** Bootstrap 5
- **Adatbázis:** SQLite (fejlesztés), PostgreSQL (production)
- **Statikus fájlok:** WhiteNoise
- **Webszerver:** Gunicorn
- **PaaS:** Railway
- **Verziókezelés:** Git, GitHub

## Projekt Struktúra

```
lab4/
├── railway.json                # Railway konfiguráció
├── requirements.txt            # Python függőségek
├── photoalbum/
│   ├── manage.py               # Django CLI
│   ├── photoalbum/             # Django projekt beállítások
│   │   ├── __init__.py
│   │   ├── asgi.py
│   │   ├── settings.py
│   │   ├── urls.py
│   │   └── wsgi.py
│   ├── accounts/               # Felhasználókezelés
│   │   ├── forms.py
│   │   ├── models.py
│   │   ├── views.py
│   │   └── ...
│   ├── albums/                 # Képalbum alkalmazás
│   │   ├── forms.py
│   │   ├── models.py
│   │   ├── views.py
│   │   └── ...
│   ├── static/                 # Statikus fájlok
│   │   ├── css/
│   │   └── js/
│   └── templates/              # HTML sablonok
│       ├── base.html
│       ├── accounts/
│       └── albums/
```

## Telepítés és Használat

### Lokális Fejlesztés

1. Klónozd a repository-t:
   ```bash
   git clone https://github.com/felhasznalonev/photoalbum.git
   cd photoalbum
   ```

2. Hozz létre egy virtuális környezetet:
   ```bash
   python -m venv venv
   source venv/bin/activate  # Linux/macOS
   venv\Scripts\activate     # Windows
   ```

3. Telepítsd a függőségeket:
   ```bash
   pip install -r requirements.txt
   ```

4. Menj a Django projekt mappájába:
   ```bash
   cd photoalbum
   ```

5. Hozd létre és alkalmazd a migrációkat:
   ```bash
   python manage.py makemigrations
   python manage.py migrate
   ```

6. Indítsd el a fejlesztői szervert:
   ```bash
   python manage.py runserver
   ```

7. Nyisd meg a böngészőben: http://127.0.0.1:8000/

### Railway Deployment

1. Forkold vagy klónozd a repository-t a GitHub fiókodba
2. Regisztrálj a [Railway](https://railway.app/) oldalon
3. Hozz létre egy új projektet a Railway dashboardon
4. Válaszd a "Deploy from GitHub" opciót
5. Válaszd ki a repository-t
6. A Railway automatikusan deployolja az alkalmazást a `railway.json` konfigurációs fájl alapján
7. Opcionálisan configurálj egy egyedi domaint a "Settings" > "Domains" menüben

## Fejlesztési Fázisok

### 1. Fázis - PaaS Alapkörnyezet

Ebben a fázisban egy alapvető Django fényképalbum alkalmazást implementáltunk Railway PaaS környezetben. A fő fókusz a használhatóságon és a PaaS környezet megismerésén volt.

Főbb jellemzők:
- Django alapú webapplikáció
- Railway PaaS integrálás
- Felhasználókezelés
- Kép fel- és letöltés

### 2. Fázis - Többrétegű Architektúra (tervezett)

A következő fázisban a többrétegű architektúrára és a skálázhatóságra fókuszálunk.

Tervezett funkciók:
- PostgreSQL külső adatbázis használata
- Több példányra való skálázás

## Konfiguráció

### Railway

A Railway deploy konfigurációja a `railway.json` fájlban található:

```json
{
    "$schema": "https://railway.app/railway.schema.json",
    "build": {
        "builder": "NIXPACKS"
    },
    "deploy": {
        "startCommand": "cd photoalbum && python manage.py migrate && python manage.py collectstatic --noinput && gunicorn photoalbum.wsgi --bind 0.0.0.0:$PORT"
    }
}
```

### Django Beállítások

A főbb Django beállítások a `photoalbum/photoalbum/settings.py` fájlban találhatók. Érdemes figyelni a következőkre:

- `DEBUG`: Fejlesztési környezetben True, production környezetben False
- `ALLOWED_HOSTS`: A Railway domain-t tartalmazza
- `DATABASE`: SQLite (fejlesztés) vagy PostgreSQL (production)
- `STATIC_ROOT`: A statikus fájlok gyűjtőhelye deployment előtt


