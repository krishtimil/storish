from django.contrib import admin
from .models import Transaction
# Register your models here.

@admin.register(Transaction)
class AuthorAdmin(admin.ModelAdmin):
    list_display = ('user', 'timestamp', 'product', 'quantity', 'price')
    pass