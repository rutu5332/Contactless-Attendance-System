import cv2 as cv
import numpy as np
import face_recognition as fr
import os
from datetime import datetime
import mysql.connector
from mysql.connector import Error

path = 'C:\\eclipse-workspace\\SmartOffice\\src\\main\\webapp\\images'
images =[]
classNames = []
myList = os.listdir(path)
print(myList)

try:
    connection = mysql.connector.connect(host='localhost',
                                         database='SmartOffice',
                                         user='root',
                                         password='root')
    if connection.is_connected():
        db_Info = connection.get_server_info()
        print("Connected to MySQL Server version ", db_Info)
except Error as e:
    print("Error while connecting to MySQL : ", e)


for cl in myList:
    cur = cv.imread(f'{path}/{cl}')
    images.append(cur)
    classNames.append( cl.split("-")[0])

print(classNames)

#enter to database
def markExit(id):
    
    now = datetime.now()
    tim = now.strftime('%H:%M:%S')
    update = """update attendance set outTime = '%s' where uid = %s""" % (tim,id)
    cur=connection.cursor()
    cur.execute(update)
    connection.commit()

#Encode the emages to get encodings
def findEncodings(images):
    encList=[]
    for img in images:
        img = cv.cvtColor(img , cv.COLOR_BGR2RGB)  
        encodeimg = fr.face_encodings(img)[0]  
        encList.append(encodeimg)
    return encList

encodedList = findEncodings(images)
print("Encoded")

#webcam
cap = cv.VideoCapture(0)  

#traverse each frame of webcam
while True:
    success , img =cap.read()
    imgs= cv.resize(img,(0,0) ,None,0.25,0.25)
    imgs = cv.cvtColor(imgs , cv.COLOR_BGR2RGB) 

    faces = fr.face_locations(imgs) #get all faces
    encodeCur = fr.face_encodings(imgs,faces) #get encodings of all faces

    #grabs one fave loc from faces list and grab encode from encdecur list
    for enc, loc in zip(encodeCur,faces):
        matches =    fr.compare_faces(encodedList , enc)
        dis = fr.face_distance(encodedList , enc)
        matchIndex = np.argmin(dis)

        if matches[matchIndex]:
            uid = classNames[matchIndex]
            y1,x2,y2,x1 = loc
            y1,x2,y2,x1=y1*4,x2*4,y2*4,x1*4
            cv.rectangle(img ,(x1,y1),(x2,y2) , (0,255,0),2)
            #cv.rectangle(img,(x1,y2-35) , (x2,y2) ,(0,255,0) , cv.FILLED)
            #cv.putText(img,uid,(x1+6,y2-6), cv.FONT_HERSHEY_COMPLEX ,1,(255,255,255) , 2)
            markExit(uid)

    cv.imshow('Webcam',img)
    cv.waitKey(1)