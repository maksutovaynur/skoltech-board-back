# Generated by Django 3.0.2 on 2020-01-22 21:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('board', '0008_auto_20200122_2145'),
    ]

    operations = [
        migrations.AddField(
            model_name='tag',
            name='level',
            field=models.IntegerField(default=1),
            preserve_default=False,
        ),
    ]