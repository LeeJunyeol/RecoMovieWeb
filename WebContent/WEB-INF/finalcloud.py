# -*- coding: utf-8 -*-

import json, urllib
#from idlelib.IOBinding import encoding
import re
import sys
reload(sys)
#sys.setdefaultencoding("UTF-8")

from konlpy.tag import Hannanum
from collections import Counter
import random
import webbrowser
from konlpy.tag import Hannanum
from lxml import html
import pytagcloud # requires Korean font support
from instagram.client import InstagramAPI

r = lambda: random.randint(0,255)
color = lambda: (r(), r(), r())

def get_tags(text, ntags=50, multiplier=3):
    h = Hannanum()
    nouns = h.nouns(text)
    count = Counter(nouns)
    return [{ 'color': color(), 'tag': n, 'size': c*multiplier }
                for n, c in count.most_common(ntags)]

def draw_cloud(tags, filename, fontname='Noto Sans CJK', size=(800, 600)):
    pytagcloud.create_tag_image(tags, filename, fontname=fontname, size=size)



moviename = sys.argv[1]

########다음 api######다음 api######다음 api######다음 api######다음 api######다음 api######다음 api######다음 api#####

apikey="3407c269d35ddb3b47c1d066cbaf6e1c"
SEARCH_BASE="https://apis.daum.net/search/board"  #?apikey={apikey}&q=레버넌트&output=json&pageno=3

def search(query, pageno, **args):
    args.update({
            'apikey' : apikey,
            'q' : query,
            'output' : 'json',
            'pageno' : pageno
    })
     
    url= SEARCH_BASE + '?' + urllib.urlencode(args)
    result= json.load(urllib.urlopen(url))
    return result['channel']

#tf = open("review11111111.txt", 'w+') 
finaldata=u" "
#누적 저장할 data(unicode) 형식
for i in range(1,11):
    info = search(moviename,i)

    for item in info['item']: 
        res= item['description']+'\n'  #find('movieId=')
        dd=re.sub('&lt;|b&gt;|&gt;|\&#39;|/','',res)
        #tf.write(dd)
        finaldata = finaldata+dd
    
#tf.close()
###########################################################################

######인스타그램 api###인스타그램 api###인스타그램 api###인스타그램 api###인스타그램 api###인스타그램 api###인스타그램 api###인스타그램 api#

client_id='71b5f772fc5a467fbb4e6066ecbe9536'

access_token = "1451885321.71b5f77.ddac6f3e719c4afb8375ab1dda874fd9"
client_secret = "8fbf9fa995804da09d587ec0a3819e01"

api = InstagramAPI(access_token=access_token, client_secret=client_secret)
result = api.tag_recent_media(100, 10, moviename)

url = result[1]
html = urllib.urlopen(url)  ##데이터를 받을 수 있는 url을 urllib모듈을 통해서 오픈시키고 넣음
htmlread = html.read().decode('utf-8')      ## 읽어서 htmlread에 넣음


jjson = json.loads(htmlread)
data = jjson['data']


try:
    #saveFile = open('result.txt', 'a')
    
    for i in range(0,len(data)):
        
            
        a = data[i]
        tag = a['tags']
        
        for i in range(0,len(tag)):
            #saveFile.write(str(tag[i].encode('utf-8'))+" ")
            finaldata=finaldata+tag[i]+u" "
        
    #saveFile.write("\n")   
    #saveFile.close()   
    print('첫페이지 끝')
    for j in range(0, 1): #몇번째 페이지까지 데이터 가져올지
        
        pagination = jjson['pagination']   ##다음 페이지의 url 자료들을 불어들이기 위함
        next_url = pagination['next_url']
        print ("NEXT PAGE URL : " + next_url)

        html = urllib.urlopen(next_url)  ##데이터를 받을 수 있는 url을 urllib모듈을 통해서 오픈시키고 넣음
        htmlread = html.read().decode('utf-8')        ## 읽어서 htmlread에 넣음

        jjson = json.loads(htmlread)   ## 데이터를 json 형식으로 chanho에 넣음

        data = jjson['data']           ## 그 중 키가 data에 해당하는 값들을 불러 들여옴
        
        #saveFile = open('result.txt', 'a')
        for h in range(0,len(data)):
                
            
            a = data[h]
            tag = a['tags']
            
            for i in range(0,len(tag)):
                #saveFile.write(str(tag[i].encode('utf-8'))+" ")
                finaldata=finaldata+tag[i]+u" "
        
            
        #saveFile.write("\n")
        #saveFile.close()
        print(str(j+2)+'페이지 끝')
        
except KeyError:
    print ('다음 페이지가 없습니다.')



###########################################################################

tags = get_tags(finaldata)

draw_cloud(tags[2:], '/home/junyeol/ProjectWork/MovieRecommendProjectJDBC/WebContent/cloudimg/'+moviename+'.jpg')



