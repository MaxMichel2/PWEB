# Generated by Django 2.2.7 on 2019-11-09 09:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exchange', '0015_auto_20190529_1539'),
    ]

    operations = [
        migrations.AddField(
            model_name='university',
            name='Duration',
            field=models.CharField(choices=[('S', 'Semestre'), ('A', 'Année'), ('X', 'Inconnu')], default='X', max_length=200),
        ),
    ]
