from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework import permissions
from .models import Transaction
from .serializers import TransactionSerializer
import pandas as pd
import os
import pickle

class TransactionListApiView(APIView):
    # add permission to check if user is authenticated
    # permission_classes = [permissions.IsAuthenticated]

    # 1. List all
    def get(self, request, *args, **kwargs):
        '''
        List all the todo items for given requested user
        '''
        transactions = Transaction.objects.all()
        serializer = TransactionSerializer(transactions, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    # 2. Create
    def post(self, request, *args, **kwargs):
        '''
        Create the Todo with given todo data
        '''
        category = ["oil", "rice", "vegetable", "fruit"]

        data = {
            'user': request.data['user'],
            'product': request.data['product'],
            'quantity': request.data['quantity'],
            'price': request.data['price'],
            'category': request.data['category'],
        }
        if data['category'] in category:
            data['basic'] = True
        serializer = TransactionSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class RecommendView(APIView):


    def post(self, request, *args, **kwargs):
        '''
        Recommend the product
        '''
        def product_rec(dataframe, product, stop_num = 3):
            counter = 0
            rec_list = []
            for index, row in enumerate(dataframe["antecedents"]):        
                for item in list(row):
                    if item == product:
                        rec_list.append(list(dataframe["consequents"][index])[0])
                        counter += 1
                        if counter == stop_num:
                            break
            return rec_list
        product = request.data['product']
        # print(product)
        path= os.path.join(os.path.dirname(__file__), 'model.pkl')
        rules = pickle.load(open(path, 'rb'))
        rec = product_rec(rules, product)
        # print(product_rec(rules, "yogurt"))
        return Response(rec, status=status.HTTP_200_OK)