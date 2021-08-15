import cv2 as cv
import numpy as np
import face_recognition as fr
import os
from datetime import datetime
import mysql.connector
from mysql.connector import Error
from Mailer import *

path = 'C:\\eclipse-workspace\\SmartOffice\\src\\main\\webapp\\images'
images =[]
classNames = []
present= []
myList = os.listdir(path)
myList.remove("guest.jpg")
#print(myList)

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

#print(classNames)

def getMonth(m):
    if m == 1:
        return "Jan"
    elif m ==2:
        return "Feb"
    elif m==3:
        return "Mar"
    elif m ==4:
        return "Apr"
    elif m==5:
        return "May"
    elif m==6:
        return "Jun"
    elif m==7:
        return "Jul"
    elif m==8:
        return "Aug"
    elif m==9:
        return "Sep"
    elif m==10:
        return "Oct"
    elif m==11:
        return "Nov"
    elif m==12:
        return "Dec"



#enter to database
def markAttendance(id):
    if id in present:
        print("Marked\n")
    else:
        now = datetime.now()
        curDay = now.strftime("%d")
        yr =now.strftime("%Y")
        mnth = getMonth(now.month)
        if curDay == "1":
            sel ="select * from user"
            cur=connection.cursor()
            cur.execute(sel)
            res=cur.fetchall()
            ins = """insert into monthrecords(month,year,presence,Emp_No) values ('%s' ,%s,0,%d) """ % (mnth,yr,len(res))
            cur=connection.cursor()
            cur.execute(ins)
            connection.commit()

        if len(present) == 0:
            update = "update monthRecords set working_days = working_days + 1 where month like '%s' and year = %s"%(mnth,yr)
            cur=connection.cursor()
            cur.execute(update)
            connection.commit()
        
        present.append(id)
        dt = now.strftime("%Y-%m-%d")
        tim = now.strftime('%H:%M:%S')
        insert = """insert into attendance(uid,attdate,inTime) values (%s,'%s','%s')""" % (id,dt,tim)
        #print(insert)
        cur=connection.cursor()
        cur.execute(insert)
        connection.commit()
        update = "update monthRecords set presence = presence + 1 where month like '%s' and year = %s"%(mnth,yr)
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
unmatched=""
flg=1
while True:
    success , img =cap.read()
    imgs= cv.resize(img,(0,0) ,None,0.25,0.25)
    imgs = cv.cvtColor(imgs , cv.COLOR_BGR2RGB) 

    faces = fr.face_locations(imgs) #get all faces
    encodeCur = fr.face_encodings(imgs,faces) #get encodings of all faces

    #send absent list to admin 
    nowTime = datetime.now()
    curtime = nowTime.strftime('%H:%M')
    c="02:00"  #time to send the mail
    if curtime == c and flg:
        dt = nowTime.strftime("%Y-%m-%d")
        select = "select * from user where id not in(select uid from attendance where attdate = '%s')" %(dt)
        cur=connection.cursor()
        cur.execute(select)
        res = cur.fetchall()
        connection.commit()
        flg=0
        print("Sent list of absent employees to Admin.")
        sendAbsentList(res)
    
    #grabs one face loc from faces list and grab encode from encodelist list
    for enc, loc in zip(encodeCur,faces):
        matches = fr.compare_faces(encodedList , enc)
        dis = fr.face_distance(encodedList , enc)
        matchIndex = np.argmin(dis)
        #print(matches , dis)
        if matches[matchIndex]:
            uid = classNames[matchIndex]
            y1,x2,y2,x1 = loc
            y1,x2,y2,x1=y1*4,x2*4,y2*4,x1*4
            cv.rectangle(img ,(x1,y1),(x2,y2) , (0,255,0),2)
            cv.rectangle(img,(x1,y2-35) , (x2,y2) ,(0,255,0) , cv.FILLED)
            cv.putText(img,uid,(x1+6,y2-6), cv.FONT_HERSHEY_COMPLEX ,1,(255,255,255) , 2)
            markAttendance(uid)
        else:
            if unmatched != enc:
                unmatched = enc
                y1,x2,y2,x1 = loc
                y1,x2,y2,x1=y1*4,x2*4,y2*4,x1*4
                cv.imwrite(path+"\\guest.jpg" ,img)
                cv.rectangle(img ,(x1,y1),(x2,y2) , (0,0,255),2)
                sendMail()
            

    cv.imshow('Webcam',img)
    cv.waitKey(1)