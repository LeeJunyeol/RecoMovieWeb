# -*- coding: utf-8 -*-
from org.jython.bigdata.interfaces import ImgUrlSearchType
import urllib
import json

class ImgUrlSearch(ImgUrlSearchType, object):
    def __init__(self):
        print 'Initializing'
        pass

    def imgUrlLoader(self,krTitle,year):
        try:
            # 다음 API에서 영화 검색 후 ImgURl 리턴
            addr="https://apis.daum.net/contents/movie?apikey=32033550f69a5523f8cee60ee45aa6e2&q="+str(unicode(krTitle))+"&output=json"
            resp = urllib.urlopen(addr)
            movieinfo=json.load(resp)
            resp.close()
            lenItem = len(movieinfo['channel']['item'])
            targetIndex = 0;
            for n in range(0,lenItem):
                if(movieinfo['channel']['item'][n]['year'][0]['content']==year):
                    targetIndex=n
            imgUrl = movieinfo['channel']['item'][targetIndex]['thumbnail'][0]['content']
            return imgUrl
        except:
            # 검색 결과 없을 때
            return 'img/movie/no_img.jpg'
