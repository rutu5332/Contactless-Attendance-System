import smtplib
import imghdr
from email.message import EmailMessage
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

Sender_Email = "contactless21@gmail.com"
Reciever_Email = "reciever's mail id"
Password = Passowrd

def sendMail():
    newMessage = EmailMessage()                         
    newMessage['Subject'] = "Entery Alert..!!" 
    newMessage['From'] = Sender_Email                   
    newMessage['To'] = Reciever_Email     
    newMessage.content_subtype="html"               
    newMessage.set_content('The person with the given image wants to enter and does not match with database. Check it ') 

    with open('C:\\eclipse-workspace\\SmartOffice\\src\\main\\webapp\\images\\guest.jpg', 'rb') as f:
        image_data = f.read()
        image_type = imghdr.what(f.name)
        image_name = f.name

    newMessage.add_attachment(image_data, maintype='image', subtype=image_type, filename=image_name)

    with smtplib.SMTP_SSL('smtp.gmail.com', 465) as smtp:    
        smtp.login(Sender_Email, Password)              
        smtp.send_message(newMessage)

def sendAbsentList(lst) :
    newMessage = MIMEMultipart("alternative")                        
    newMessage['Subject'] = "Today's Absent List" 
    newMessage['From'] = Sender_Email                   
    newMessage['To'] = Reciever_Email   
    #newMessage.content_subtype="html"                 
    text = """<b>Here is the list of absent Employees.</b> <br><br> <table border=1 cellspacing=0 cellpadding=4> 
    <tr> <th> no </th> <th> Id </th> <th> Name </th> <th> email</th> <th> Designation</th></tr>"""
    i=1
    for x in lst :
        text += "<tr><td>%d</td><td>%s</td><td>%s %s</td> <td>%s</td> <td>%s</td> </tr>"%(i,x[0],x[1],x[2],x[3],x[7])
        i += 1
    text += "</table>"
    part = MIMEText(text, "html")
    newMessage.attach(part)

    with smtplib.SMTP_SSL('smtp.gmail.com', 465) as smtp:    
        smtp.login(Sender_Email, Password)              
        smtp.send_message(newMessage)
    
