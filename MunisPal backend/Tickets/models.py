from django.db import models
from django.conf import settings
# Create your models here.

class Ticket(models.Model):

    author = models.ForeignKey(settings.AUTH_USER_MODEL,null=False,blank=False,on_delete=models.CASCADE,related_name="user")
    category = models.TextField(blank=False,null=False,default="Other")
    description = models.TextField(blank=True,null=True)
    time = models.DateTimeField(auto_now=True)
    picture = models.ImageField(blank=True, null=True, upload_to="Tickets/TicketPictures")
    voice_note = models.FileField(blank=True,null=True,upload_to="Tickets/TicketVoiceNotes")
    video = models.FileField(blank=True,null=True,upload_to="Tickets/TicketVideos")
    latitude = models.DecimalField(blank=False,null=False,default=00.000,max_digits=20,decimal_places=4)
    longitude = models.DecimalField(blank=False,null=False,default=00.000,max_digits=20,decimal_places=4)
    province = models.TextField(blank=True,null=True)
    district_municipality = models.TextField(blank=True,null=True)
    local_municipality = models.TextField(blank=True,null=True)
    priority = models.IntegerField(null=False,blank=False,default=0)
    progress = models.TextField(blank=False,null=False,default="Not Started")
    at_home = models.BooleanField(blank=False,null=False,default=1)

class TicketLog(models.Model):

    author = models.ForeignKey(settings.AUTH_USER_MODEL,null=False,blank=False,on_delete=models.CASCADE,related_name="userlog")
    category = models.TextField(blank=False,null=False,default="Other")
    description = models.TextField(blank=True,null=True)
    time = models.DateTimeField(auto_now=True)
    picture = models.ImageField(blank=True, null=True, upload_to="Tickets/TicketPictures")
    voice_note = models.FileField(blank=True,null=True,upload_to="Tickets/TicketVoiceNotes")
    video = models.FileField(blank=True,null=True,upload_to="Tickets/TicketVideos")
    latitude = models.DecimalField(blank=False,null=False,default=00.000,max_digits=20,decimal_places=4)
    longitude = models.DecimalField(blank=False,null=False,default=00.000,max_digits=20,decimal_places=4)
    province = models.TextField(blank=True,null=True)
    local_municipality = models.TextField(blank=True,null=True)
    progress = models.TextField(blank=False,null=False,default="Not Started")


class Status(models.Model):

    ticket = models.OneToOneField(Ticket,on_delete=models.CASCADE,related_name="ticket")
    stage = models.IntegerField(null=True,blank=True,default=0)
    description = models.TextField(null=False,blank=False,default="Not recieved yet")
    weight = models.DecimalField(null=False,blank=False,default=00.00,max_digits=20,decimal_places=2)

class StatusLog(models.Model):

    ticket = models.ForeignKey(Ticket,on_delete=models.CASCADE,related_name="ticketlog")
    stage = models.IntegerField(null=True,blank=True,default=0)
    description = models.TextField(null=False,blank=False,default="Not recieved yet")
    weight = models.DecimalField(null=False,blank=False,default=00.00,max_digits=20,decimal_places=2)


class Announcement(models.Model):

    author = models.ForeignKey(settings.AUTH_USER_MODEL,related_name="announcer",on_delete=models.CASCADE)
    title = models.TextField(null=True,blank=True)
    message = models.TextField(null=True,blank=True)
    file = models.ImageField(upload_to="Announcement")
    local_municipality = models.TextField(null=True,blank=False)
    datetime = models.DateTimeField(auto_now=True)

class Priority(models.Model):

    priotised_by = models.ForeignKey(settings.AUTH_USER_MODEL,related_name="prioritisedby",on_delete=models.CASCADE)
    ticket = models.ForeignKey(Ticket,related_name="prioticket",on_delete=models.CASCADE)















