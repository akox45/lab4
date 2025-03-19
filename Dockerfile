FROM python:3.11-slim

# Környezeti változók beállítása
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV DEBUG=False
ENV PORT=8000

# Munkamappa létrehozása
WORKDIR /app

# Függőségek telepítése
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Alkalmazás fájljainak másolása
COPY photoalbum/ .

# Statikus fájlok összegyűjtése
RUN python manage.py collectstatic --noinput

# Portok
EXPOSE 8000

# Startup script
CMD gunicorn photoalbum.wsgi:application --bind 0.0.0.0:8000