# Generated by Django 3.0.2 on 2020-01-22 21:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('board', '0007_auto_20200122_2139'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profilelink',
            name='description',
            field=models.CharField(blank=True, max_length=256, null=True),
        ),
        migrations.AlterField(
            model_name='reaction',
            name='description',
            field=models.TextField(blank=True, default=None, null=True),
        ),
    ]
