# Generated by Django 3.1.1 on 2020-09-12 14:28

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('CustomUser', '0003_auto_20200912_1448'),
    ]

    operations = [
        migrations.RenameField(
            model_name='customuser',
            old_name='destrict',
            new_name='local_municipality',
        ),
    ]
