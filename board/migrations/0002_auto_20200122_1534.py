# Generated by Django 3.0.2 on 2020-01-22 15:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('board', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelTable(
            name='reaction',
            table='skolboard_reaction',
        ),
    ]