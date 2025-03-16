# Generated by Django 4.2.20 on 2025-03-16 17:17

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Photo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('upload_date', models.DateTimeField(default=django.utils.timezone.now)),
                ('image', models.ImageField(upload_to='photos/')),
            ],
            options={
                'ordering': ['name'],
            },
        ),
    ]
