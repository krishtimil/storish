from django.urls import path, include
from .views import (
    TransactionListApiView, RecommendView
)

urlpatterns = [
    path('api/', TransactionListApiView.as_view()),
    path('recommend/', RecommendView.as_view())
]
