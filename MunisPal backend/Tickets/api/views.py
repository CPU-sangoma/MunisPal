from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny, IsAuthenticated
from Tickets.models import Announcement,TicketLog,Ticket,Status,StatusLog,Priority
from CustomUser.models import CustomUser
from .serializers import StatusSerializer,TicketSerializer,StatusLogSerializer,TicketlogSerializer,AnnouncementSerializer


@api_view(['POST', ])
@permission_classes((IsAuthenticated,))
def CreateTicket(request):

    user = request.user
    data = {}

    if user.user_type == "Resident":

        ticket = Ticket(author=user)
        tstatus = Status(ticket=ticket)
        statuslog = StatusLog(ticket=ticket)
        tickseri = TicketSerializer(ticket,data=request.data)
        ticketlog = TicketLog(author=user)
        ticketlogseri = TicketlogSerializer(ticketlog,data=request.data)


        if tickseri.is_valid() and ticketlogseri.is_valid():
            tickseri.save()
            ticketlogseri.save()
            tstatus.save()
            statuslog.save()

            data['operation'] = "success"
            return Response(data=data,status=status.HTTP_201_CREATED)
        else:
            data['operation'] = "failed"
            return Response(data=data,status=status.HTTP_400_BAD_REQUEST)
    else:
        data['operation'] = "failed,admin users cant perform this task"
        return Response(data=data, status=status.HTTP_400_BAD_REQUEST)



@api_view(['GET',])
@permission_classes((IsAuthenticated,))
def GetMyTickets(request):

    user = request.user
    ticket = Ticket.objects.filter(author=user)
    ticketseri = TicketSerializer(ticket,many=True)

    return Response(data=ticketseri.data,status=status.HTTP_200_OK)

@api_view(['GET',])
@permission_classes((IsAuthenticated,))
def LocalMunicipalityTickets(request):

    user = request.user
    ticket = Ticket.objects.filter(local_municipality=user.local_municipality)
    tickseri = TicketSerializer(ticket,many=True)

    return Response(data=tickseri.data,status=status.HTTP_200_OK)

@api_view(['GET',])
@permission_classes((IsAuthenticated,))
def OtherMunicipalTickets(request,muni):

    user = request.user
    ticket = Ticket.objects.filter(local_municipality=muni)
    tickseri = TicketSerializer(ticket,many=True)

    return Response(data=tickseri.data,status=status.HTTP_200_OK)


@api_view(['POST',])
@permission_classes((IsAuthenticated,))
def AnnounceNow(request):

    user = request.user
    data = {}

    if user.user_type == "Admin":
        announce = Announcement(author= user,local_municipality=user.local_municipality)
        announceseri = AnnouncementSerializer(announce,data=request.data)

        if announceseri.is_valid():
            announceseri.save()
            data['operation'] = "success"
            return Response(data=data,status=status.HTTP_201_CREATED)
        else:
            data['operation'] = "failed"
            return Response(data=data, status=status.HTTP_400_BAD_REQUEST)
    else:
        data['operation'] = "unauthorized, you are not admin"
        return Response(data=data, status=status.HTTP_401_UNAUTHORIZED)

@api_view(['GET',])
@permission_classes((IsAuthenticated,))
def ListMyAnnoucements(request):

    user = request.user

    announce = Announcement.objects.filter(local_municipality=user.local_municipality)
    announcesiri = AnnouncementSerializer(announce,many=True)

    return Response(data=announcesiri.data,status=status.HTTP_200_OK)

@api_view(['DELETE',])
@permission_classes((IsAuthenticated,))
def DeleteAnnouncement(request,slug):

    user = request.user
    announce = Announcement.objects.get(id=slug)
    data ={}
    if user.user_type == "Admin" and announce.author == user:
        announce.delete()
        data['operation'] = "Deleted"
        return Response(data=data,status=status.HTTP_200_OK)
    else:
        data['operation'] = "failed, not the author who made the announcement"
        return Response(data=data, status=status.HTTP_401_UNAUTHORIZED)

@api_view(['PATCH',])
@permission_classes((IsAuthenticated,))
def UpdateAnnouncement(request,slug):

    user = request.user
    announce = Announcement.objects.get(id=slug)
    announceseri = AnnouncementSerializer(announce,data=request.data)
    data = {}
    if user.user_type == "Admin" and announce.author == user:

        if announceseri.is_valid(raise_exception=True):
            announceseri.save()
            data['operation'] = "Updated"
            return Response(data=data, status=status.HTTP_200_OK)
        else:
            print(announceseri.error)
            data['operation'] = "failed"
            return Response(data=data, status=status.HTTP_400_BAD_REQUEST)

    else:
        data['operation'] = "failed, not the author of the announcement"
        return Response(data=data, status=status.HTTP_401_UNAUTHORIZED)



@api_view(['PATCH',])
@permission_classes((IsAuthenticated,))
def ChangeTicketStatus(request,slug):

    user = request.user
    data = {}

    if user.user_type == "Admin":
        ticket = Ticket.objects.get(id=slug)
        tstatus = Status.objects.get(ticket=slug)
        statusseri = StatusSerializer(tstatus,data=request.data)
        statuslog = StatusLog(ticket=ticket)
        statuslogseri = StatusLogSerializer(statuslog,data=request.data)

        if statusseri.is_valid() and statuslogseri.is_valid():
            ticket.progress = "In Progress"
            ticket.save()
            statusseri.save()
            statuslogseri.save()
            data['operation'] = "success"
            return Response(data=data,status=status.HTTP_200_OK)
        else:
            data['operation'] = "failed"
            return Response(data=data, status=status.HTTP_400_BAD_REQUEST)
    else:
        data['operation'] = "unauthorized, you are not admin"
        return Response(data=data, status=status.HTTP_401_UNAUTHORIZED)


@api_view(['GET',])
@permission_classes((IsAuthenticated,))
def GetTicketStatus(request,slug):

    user = request.user
    ticket = Ticket.objects.get(id=slug)
    tstatus = Status.objects.get(ticket=ticket)
    statusseri = StatusSerializer(tstatus)

    return Response(data=statusseri.data,status=status.HTTP_200_OK)

@api_view(['POST',])
@permission_classes((IsAuthenticated,))
def DeleteMyTicket(request,slug):

    user = request.user
    ticket = Ticket.objects.get(id=slug)
    data ={}

    if ticket.author == user:
        ticket.delete()
        data['operation'] = "successfully deleted"
        return Response(data=data,status=status.HTTP_200_OK)
    else:
        data['operation'] = "Can\'t delete ticket, not the author"
        return Response(data=data, status=status.HTTP_401_UNAUTHORIZED)

@api_view(['POST',])
@permission_classes((IsAuthenticated,))
def Prioritize(request,slug):

    user = request.user
    data = {}
    ticket = Ticket.objects.get(id=slug)

    pro = Priority.objects.filter(ticket=ticket,priotised_by=user)
    if user.user_type == "Resident":
        if pro.count() > 0:
            ticket.priority = ticket.priority - 1
            ticket.save()
            pro.delete()
            data['operation'] = "unprioritized"
            return Response(data=data,status=status.HTTP_200_OK)
        else:
            proC = Priority(ticket=ticket,priotised_by=user)
            proC.save()
            ticket.priority = ticket.priority + 1
            ticket.save()
            data['operation'] = "successfully priorotized"
            return Response(data=data,status=status.HTTP_200_OK)

    else:
        data['operation'] = "admin users can\'t perform this task"
        return Response(data=data,status=status.HTTP_401_UNAUTHORIZED)

@api_view(['POST',])
@permission_classes((IsAuthenticated,))
def TicketComplete(request,slug):

    user = request.user
    tstatus = Status.objects.get(id=slug)
    data = {}


    if tstatus.description != "Complete":
        newTicket = tstatus.ticket
        newTicket.progress = "100% Done"
        tstatus.description = "Complete"
        tstatus.save()
        newTicket.save()
        data['operation'] = "This ticket is now 100% done,status is complete"
        return Response(data=data,status=status.HTTP_200_OK)
    else:
        data['operation'] = "Ticket is already 100% complete"
        return Response(data=data,status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET',])
@permission_classes((IsAuthenticated,))
def OneTicketStatus(request,slug):

    user = request.user
    ticket = Ticket.objects.get(id=slug)
    tstatus = Status.objects.get(ticket=ticket)
    statusseri = StatusSerializer(tstatus)

    return Response(data=statusseri.data)


@api_view(['GET',])
@permission_classes((IsAuthenticated,))
def GetAllStatusLog(request):

    user = request.user

    statuslog = StatusLog.objects.all()
    statuslogseri = StatusLogSerializer(statuslog,many=True)
    return Response(data=statuslogseri.data,status=status.HTTP_200_OK)

@api_view(['GET',])
@permission_classes((IsAuthenticated,))
def GetAllTicketLog(request):

    user = request.user

    ticketlog = TicketLog.objects.all()
    ticketlogseri = TicketlogSerializer(ticketlog,many=True)
    return Response(data=ticketlogseri.data, status=status.HTTP_200_OK)


@api_view(['GET',])
@permission_classes((IsAuthenticated,))
def GetAllTicketLogByMuni(request,muni):

    user = request.user

    ticketlog = TicketLog.objects.filter(local_municipality=muni)
    ticketlogseri = TicketlogSerializer(ticketlog,many=True)
    return Response(data=ticketlogseri.data, status=status.HTTP_200_OK)




















