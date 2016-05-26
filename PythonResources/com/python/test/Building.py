#-*-coding:utf-8-*-
from bs4 import BeautifulSoup
import urllib.request
from org.jython.book.interfaces import BuildingType

#def imgUrlLoader(s):
#    resp = urllib.request.urlopen("https://apis.daum.net/contents/movie?apikey=32033550f69a5523f8cee60ee45aa6e2&q="+s+"&output=json")
#    print(list(resp))

class Building(BuildingType):

    def __init__(self):
        self.name = None
        self.address = None
        self.id = -1

    def getBuildingName(self):
        return self.name

    def setBuildingName(self, name):
        self.name = name;

    def getBuildingAddress(self):
        return self.address

    def setBuildingAddress(self, address):
        self.address = address

    def getBuildingId(self):
        return self.id

    def setBuildingId(self, id):
        self.id = id