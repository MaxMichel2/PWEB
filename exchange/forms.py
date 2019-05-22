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
        fields = ('Year','Semester','StartDate','EndDate','Rent','MonthlyExpenses','NightLifeGrade','CulturalLifeGrade','Security','VisaMonths', 'VisaWeeks', 'VisaDays','Comment')
        labels = {
            'Year':('Promo dans laquelle vous étiez durant votre échange'),
            'Semester':("Semestre de l'échange"),
            'StartDate':("Date du début de l'échange"),
            'EndDate':("Date de fin de l'échange"),
            'Rent':("Quel était votre loyer ? (en €)"),
            'MonthlyExpenses':("Combien dépensiez-vous en moyenne par mois ? (en €)"),
            'NightLifeGrade':('Sur une échelle de 1 à 5 (5 étant la note la plus haute), quelle note donneriez-vous à la vie nocture (soirées, bars, etc) dans la ville de votre échange ?'),
            'CulturalLifeGrade':('Sur une échelle de 1 à 5 (5 étant la note la plus haute), quelle note donneriez-vous à la vie culturelle dans la ville de votre échange ?'),
            'Security':('Sur une échelle de 1 à 5 (5 étant la note la plus haute), quelle note donneriez-vous à la sécurité dans la ville de votre échange ?'),
            'Comment':("Avez-vous un commentaire à faire sur votre échange ?"),
            'VisaMonths':("Combien de temps a duré votre procédure de visa en mois?"),
            'VisaWeeks':("Combien de temps a duré votre procédure de visa en semaines?"),
            'VisaDays':("Combien de temps a duré votre procédure de visa en jours?"),
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
    ContractType = forms.ChoiceField(choices=CONTRACTS,required=False)
   
    class Meta:
        model = UniversityContracts
        fields = ['ContractType']
        labels = {
            'ContractType':("Type de contrat avec l'INSA")
        }
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
        labels = {
            'Places':('Nombre de places'),
            'Demand':('Nombre de demandes (en moyenne)')
        }

