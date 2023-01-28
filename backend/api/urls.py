from django.urls import path, include
from .views import (
    TransactionListApiView,
)

urlpatterns = [
    path('api/', TransactionListApiView.as_view()),
]
