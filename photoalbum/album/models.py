from django.db import models
from django.utils import timezone

class Photo(models.Model):
    name = models.CharField(max_length=255)  # A minimum 40 karaktert később validáljuk
    upload_date = models.DateTimeField(default=timezone.now)
    image = models.ImageField(upload_to='photos/')
    
    class Meta:
        ordering = ['name']  # Alapértelmezett rendezés név szerint
    
    def __str__(self):
        return self.name