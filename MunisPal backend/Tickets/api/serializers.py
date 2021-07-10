from rest_framework import serializers
from Tickets.models import Ticket, Status, StatusLog, TicketLog, Announcement


class TicketSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ticket
        fields = ['id','author','category','description', 'time', 'picture', 'voice_note', 'video', 'latitude', 'longitude',
                  'province', 'local_municipality', 'priority', 'progress','at_home']
        read_only_fields = ('author',)
        depth = 1

class TicketlogSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ticket
        fields = ['id','author','category','description', 'time', 'picture', 'voice_note', 'video', 'latitude', 'longitude',
                  'province', 'district_municipality', 'local_municipality', 'priority', 'progress','at_home']
        read_only_fields = ('author',)
        depth = 1

class StatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = Status
        fields = ['id','ticket','stage','description','weight']
        read_only_fields = ('author',)
        depth =1

class StatusLogSerializer(serializers.ModelSerializer):
    class Meta:
        model = Status
        fields = ['id','ticket','stage','description','weight']
        read_only_fields = ('author',)
        depth =1

class AnnouncementSerializer(serializers.ModelSerializer):

    class Meta:
        model = Announcement
        fields = ['id','author','title','message','file','datetime','local_municipality']
        read_only_fields =('author',)
        depth =1

