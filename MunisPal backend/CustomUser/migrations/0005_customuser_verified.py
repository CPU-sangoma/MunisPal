# Generated by Django 3.1.1 on 2020-09-12 15:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('CustomUser', '0004_auto_20200912_1628'),
    ]

    operations = [
        migrations.AddField(
            model_name='customuser',
            name='verified',
            field=models.BooleanField(default=False),
        ),
    ]
