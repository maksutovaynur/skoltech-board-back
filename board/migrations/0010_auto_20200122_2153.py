# Generated by Django 3.0.2 on 2020-01-22 21:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('board', '0009_tag_level'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tag',
            name='level',
            field=models.IntegerField(choices=[(1, 'VERB'), (2, 'OBJECT'), (3, 'CONDITION')]),
        ),
    ]
