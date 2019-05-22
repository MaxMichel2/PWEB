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
        labels = {
            'Language':('Langue des cours'),
            'LanguageDiploma':('Quel certification linguistique avez-vous du passer ?'),
            'LanguageLevel':('Quel niveau avez-vous du certifier ?')
        }
   

#RajouterInfo3 - Exchange
class ExchForm(forms.ModelForm):
    class Meta:
        model = Exchange
        fields = ('Year','StartDate','EndDate','Semester','Comment','Rent','MonthlyExpenses','NightLifeGrade','CulturalLifeGrade','Security','VisaMonths', 'VisaWeeks', 'VisaDays')

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

#-----------------RECHERCHE AVANCEE-------------------
#Filtre : Continent
class RAContinentForm(forms.ModelForm):
    class Meta:
        model = Country
        fields = ('Continent',)

    """ def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['CountryName'].queryset = Country.objects.none()
 """
"""class TestForm2(forms.Form):
    CountryName = forms.ModelChoiceField(queryset=Country.objects.none(),required=False)
    
    def __init__(self,qs, *args, **kwargs): 
        super(TestForm2, self).__init__(*args, **kwargs) 
        self.fields['CountryName'].queryset = qs"""

    

#Filtre : Contract
class ContractForm(forms.ModelForm):
    CONTRACTS = (
        ('','(pas trier par contract)'),
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
    ContractType = forms.ChoiceField(choices=CONTRACTS,required=False)
   
    class Meta:
        model = UniversityContracts
        fields = ['ContractType']
"""           
     def __init__(self, *args, **kwargs):
        super(ContractForm, self).__init__(*args, **kwargs)
        self.fields['ContractType'].required = False """

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

