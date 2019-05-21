# Generated by Django 2.2.1 on 2019-05-21 16:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exchange', '0008_auto_20190517_1937'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='exchange',
            name='TimeVisa',
        ),
        migrations.AddField(
            model_name='exchange',
            name='VisaDays',
            field=models.IntegerField(blank=True, default=-1, null=True),
        ),
        migrations.AddField(
            model_name='exchange',
            name='VisaMonths',
            field=models.IntegerField(blank=True, default=-1, null=True),
        ),
        migrations.AddField(
            model_name='exchange',
            name='VisaWeeks',
            field=models.IntegerField(blank=True, default=-1, null=True),
        ),
    ]
