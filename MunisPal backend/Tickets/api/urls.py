from django.urls import path
from . import views


app_name ="Tickets"

urlpatterns = [
    path("createticket",views.CreateTicket, name="createticket"),
    path("getmytickets",views.GetMyTickets,name="getmytickets"),
    path("mylocaltickets",views.LocalMunicipalityTickets,name="LocalmuniTickets"),
    path("othermunitickets/<muni>",views.OtherMunicipalTickets,name="othermunis"),
    path("announce",views.AnnounceNow,name="announce"),
    path("myannouncements",views.ListMyAnnoucements,name="myannouncements"),
    path("updateticketstatus/<slug>",views.ChangeTicketStatus,name="updateticket"),
    path("getticketstatus/<slug>",views.GetTicketStatus,name="getstatus"),
    path("deleteannouncement/<slug>",views.DeleteAnnouncement,name="Deleteannouncement"),
    path("updateannouncement/<slug>",views.UpdateAnnouncement,name="updateannouncemnet"),
    path("deletemyticket/<slug>",views.DeleteMyTicket,name="deleteticket"),
    path("priorotize/<slug>",views.Prioritize,name="priority"),
    path("completestatus/<slug>",views.TicketComplete,name="completestatus"),
    path("statusdetails/<slug>",views.OneTicketStatus,name="coursedetail"),
    path("getstatlogs",views.GetAllStatusLog,name="statlogs"),
    path("getallticlogs",views.GetAllTicketLog,name="ticketlogs"),
    path("getmuniticketlogs/<muni>",views.GetAllTicketLogByMuni,name="logsByMuni")

    ]