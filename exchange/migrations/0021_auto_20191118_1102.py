# Generated by Django 2.2.1 on 2019-11-18 10:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exchange', '0020_auto_20191112_1227'),
    ]

    operations = [
        migrations.AlterField(
            model_name='financialaid',
            name='ReceivedEvery',
            field=models.CharField(blank=True, choices=[('S', 'Semaines'), ('M', 'Mois')], max_length=15, null=True),
        ),
    ]
