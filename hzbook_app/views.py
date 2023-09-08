from django.shortcuts import render
from django.http import HttpResponse
import pymongo
import ssl
import os

from dotenv import load_dotenv
import os

load_dotenv()

host = os.environ.get('DB_HOST')
username = os.environ.get('DB_USER')
password = os.environ.get('DB_PASS')

#connection_string = f'mongodb://jrcsuser:password@mongodb-service.default.svc.cluster.local'
connection_string = f'mongodb://{username}:{password}@{host}'

client = pymongo.MongoClient(connection_string)
db = client['hzbook']
Books = db['books']

# Create your views here.
def index(request):
    books = list(Books.find_one({}))
    return render(request, 'index.html', context={ 'books': books })

def save(request):
    if request.method == 'POST':
        if request.POST is not None:
            Books.insert({
                "title": request.POST['title'],
                'author': request.POST['author'],
                'description': request.POST['description']
            })
        return render(request, 'index.html')
    
    return render(request, 'new.html')
    
def edit(request):
    return render(request, 'edit.html')

def remove(request):
    return render(request, 'remove.html')