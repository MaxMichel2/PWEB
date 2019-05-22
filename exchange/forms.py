from django import forms
from .models import *

#----------------------RAJOUT D'INFO------------------------
#RajouterInfo1 - Student
class StudentForm(forms.ModelForm):
    class Meta:
        model = Student
        fields = '__all__'
        labels = {
            'Name':('Prénom'),
            'Surname':('Nom de famille'),
            'INSADepartment':('Département INSA'),
            'Nationality':('Nationalité')
        }
       
        
        #widjets to change field  form
        # labels to change how it is veid
        #help_text 
        

#RajouterInfo2 - Language
class LangueForm(forms.ModelForm):
    class Meta:
        model = UniversityLanguages
        fields = ('Language','LanguageDiploma','LanguageLevel',)
   

#RajouterInfo3 - Exchange
class ExchForm(forms.ModelForm):
    class Meta:
        model = Exchange
        fields = ('Year','Semester','StartDate','EndDate','Rent','MonthlyExpenses','NightLifeGrade','CulturalLifeGrade','Security','VisaMonths', 'VisaWeeks', 'VisaDays','Comment')
        widgets = {
            'Comment':forms.Textarea(attrs={'cols': 80, 'rows': 10})
        }

    

#RajouterInfo3 - Exchange (case à cocher)
class ExchFormVisa(forms.ModelForm):
    class Meta:
        model = Exchange
        fields = ('Visa',)

#RajouterInfo4 - Aides Finances
class FinancialForm(forms.ModelForm):
    class Meta:
        model = FinancialAid
        fields = ('Name','Value','ReceivedEvery',)
        labels = {
            'Name':("Nom de la bourse"),
            'Value':("Valeur de la bourse (en €)"),
            'ReceivedEvery':("S'agit-il d'une valeur mensuelle, hebdomadaire ou journalière ?")
        }

#-----------------RECHERCHE AVANCEE-------------------
#Filtre : Continent
class RAContinentForm(forms.ModelForm):
    class Meta:
        model = Country
        fields = ('Continent',)
    

#Filtre : Contract
class ContractForm(forms.ModelForm):
    CONTRACTS = (
        ('','---------'),
        ('AR','Accord de Recherche'),
        ('AC','Accord Cadre'),
        ('DD','Double Diplome'),
        ('DDD','Double Diplome Doctorat'),
        ('DDMS','Double Diplome Master Specialise'),
        ('FITEC','FITEC'),
        ('M','Mobilite'),
        ('PDD','Procedure Double Diplome'),
        ('S','Specifique'),
        ('X', 'Inconnu')
    )
    ContractType = forms.ChoiceField(choices=CONTRACTS,required=False, label="Type de contrat avec l'INSA")
   
    class Meta:
        model = UniversityContracts
        fields = ['ContractType']
       

#Ordonage : 
class OrdreForm(forms.Form):
    ORDRES = (
        ('','------'),
        ('RankMetric','Ranking'),
        ('LifeMetric','Style de Vie'),
        ('CountryName','Pays'),
        ('CWURRank','Ranking Mondial'),
        ('Demand','Demande')
    )
    Ordre = forms.ChoiceField(choices=ORDRES)

#------------------PROF: MOFIFIE----------------
#RajouterInfo2 - Department
class DepartForm(forms.ModelForm):
    class Meta:
        model = Department
        fields = ('Name','Rank',)
        labels = {
            'Name':("Nom du département de l'université dans lequel l'échange a été effectué"),
            'Rank':('Note du département (/5)')
        }

#Modifie Infos Université
class UnivForm(forms.ModelForm):
    class Meta:
        model = University
        fields = ('Places','Demand',)
        labels = {
            'Places':('Nombre de places'),
            'Demand':('Nombre de demandes (en moyenne)')
        }

