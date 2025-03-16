from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic import ListView, DetailView, CreateView, DeleteView
from django.urls import reverse_lazy
from .models import Photo
from .forms import PhotoForm

class PhotoListView(ListView):
    model = Photo
    template_name = 'album/photo_list.html'
    context_object_name = 'photos'
    
    def get_ordering(self):
        return self.request.GET.get('order_by', 'name')

class PhotoDetailView(DetailView):
    model = Photo
    template_name = 'album/photo_detail.html'
    context_object_name = 'photo'

class PhotoCreateView(CreateView):
    model = Photo
    form_class = PhotoForm
    template_name = 'album/photo_form.html'
    success_url = reverse_lazy('photo_list')

class PhotoDeleteView(DeleteView):
    model = Photo
    template_name = 'album/photo_confirm_delete.html'
    success_url = reverse_lazy('photo_list')