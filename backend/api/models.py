from django.db import models
from django.contrib.auth.models import User
# Create your models here.


class Transaction(models.Model):
    user = models.IntegerField()
    timestamp = models.DateTimeField(auto_now_add=True)
    product = models.CharField(max_length=100)
    quantity = models.IntegerField()
    price = models.IntegerField()
    category = models.CharField(max_length=100)
    basic = models.BooleanField(default=False)

    def __str__(self):
        return self.product

