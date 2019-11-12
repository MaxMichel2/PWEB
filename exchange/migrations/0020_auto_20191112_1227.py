# Generated by Django 2.2.1 on 2019-11-12 11:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exchange', '0019_universityplaces_exclusive'),
    ]

    operations = [
        migrations.AlterField(
            model_name='universitycontractsadmin',
            name='ContractType',
            field=models.CharField(choices=[('AR', 'Accord de Recherche'), ('AC', 'Accord Cadre'), ('DD', 'Double Diplôme'), ('DDD', 'Double Diplôme Doctorat'), ('DDMS', 'Double Diplôme Master Spécialisé'), ('FITEC', 'FITEC'), ('M', 'Mobilité'), ('PDD', 'Procedure Double Diplôme'), ('S', 'Spécifique'), ('X', 'Inconnu')], default='X', max_length=200),
        ),
        migrations.AlterField(
            model_name='universitycontractsstudent',
            name='ContractType',
            field=models.CharField(choices=[('DD', 'Double Diplôme'), ('M', 'Mobilité')], default='X', max_length=200),
        ),
    ]
