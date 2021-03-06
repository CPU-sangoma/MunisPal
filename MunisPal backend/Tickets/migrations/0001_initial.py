# Generated by Django 3.1.1 on 2020-09-14 01:18

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='TicketLog',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category', models.TextField(default='Other')),
                ('description', models.TextField(blank=True, null=True)),
                ('time', models.DateTimeField(auto_now=True)),
                ('picture', models.ImageField(blank=True, null=True, upload_to='Tickets/TicketPictures')),
                ('voice_note', models.FileField(blank=True, null=True, upload_to='Tickets/TicketVoiceNotes')),
                ('video', models.FileField(blank=True, null=True, upload_to='Tickets/TicketVideos')),
                ('latitude', models.DecimalField(decimal_places=4, default=0.0, max_digits=20)),
                ('longitude', models.DecimalField(decimal_places=4, default=0.0, max_digits=20)),
                ('province', models.TextField(blank=True, null=True)),
                ('local_municipality', models.TextField(blank=True, null=True)),
                ('progress', models.TextField(default='Not Started')),
                ('author', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='userlog', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Ticket',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category', models.TextField(default='Other')),
                ('description', models.TextField(blank=True, null=True)),
                ('time', models.DateTimeField(auto_now=True)),
                ('picture', models.ImageField(blank=True, null=True, upload_to='Tickets/TicketPictures')),
                ('voice_note', models.FileField(blank=True, null=True, upload_to='Tickets/TicketVoiceNotes')),
                ('video', models.FileField(blank=True, null=True, upload_to='Tickets/TicketVideos')),
                ('latitude', models.DecimalField(decimal_places=4, default=0.0, max_digits=20)),
                ('longitude', models.DecimalField(decimal_places=4, default=0.0, max_digits=20)),
                ('province', models.TextField(blank=True, null=True)),
                ('district_municipality', models.TextField(blank=True, null=True)),
                ('local_municipality', models.TextField(blank=True, null=True)),
                ('priority', models.IntegerField(default=0)),
                ('progress', models.TextField(default='Not Started')),
                ('at_home', models.BooleanField(default=1)),
                ('author', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='user', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='StatusLog',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('stage', models.IntegerField(blank=True, default=0, null=True)),
                ('description', models.TextField(default='Not recieved yet')),
                ('weight', models.DecimalField(decimal_places=2, default=0.0, max_digits=20)),
                ('ticket', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='ticketlog', to='Tickets.ticket')),
            ],
        ),
        migrations.CreateModel(
            name='Status',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('stage', models.IntegerField(blank=True, default=0, null=True)),
                ('description', models.TextField(default='Not recieved yet')),
                ('weight', models.DecimalField(decimal_places=2, default=0.0, max_digits=20)),
                ('ticket', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='ticket', to='Tickets.ticket')),
            ],
        ),
        migrations.CreateModel(
            name='Priority',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('priotised_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='prioritisedby', to=settings.AUTH_USER_MODEL)),
                ('ticket', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='prioticket', to='Tickets.ticket')),
            ],
        ),
        migrations.CreateModel(
            name='Announcement',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.TextField(blank=True, null=True)),
                ('message', models.TextField(blank=True, null=True)),
                ('file', models.ImageField(upload_to='Announcement')),
                ('local_municipality', models.TextField(null=True)),
                ('datetime', models.DateTimeField(auto_now=True)),
                ('author', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='announcer', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
