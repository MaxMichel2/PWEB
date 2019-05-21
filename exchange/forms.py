from django import forms
from .models import *

#----------------------RAJOUT D'INFO------------------------
#RajouterInfo1 - Student
class StudentForm(forms.ModelForm):
    class Meta:
        model = Student
        fields = '__all__'
        #widjets to change field  form
        # labels to change how it is veid
        #help_text 

#RajouterInfo2 - Department
class DepartForm(forms.ModelForm):
    class Meta:
        model = Department
        fields = ('Name','Rank',)

#RajouterInfo2 - Language
class LangueForm(forms.ModelForm):
    class Meta:
        model = UniversityLanguages
        fields = ('Language','LanguageDiploma','LanguageLevel',)

#RajouterInfo3 - Exchange
class ExchForm(forms.ModelForm):
    class Meta:
        model = Exchange
        fields = ('Year','StartDate','EndDate','Semester','Comment','TimeVisa','Rent','MonthlyExpenses','NightLifeGrade','CulturalLifeGrade','Security',)

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



#-----------------TESTS ET DEBEUG------------------
"""class SelectForm(forms.Form):
    Tirer_par_pays = forms.BooleanField()
    Trier_par_contract = forms.BooleanField()

class ArticleForm(forms.ModelForm):
    class Meta:
        model = Country
        fields = ('Continent',)

class ArticleForm2(forms.Form):
    item_field = forms.ModelChoiceField(queryset=Country.objects.none())
    
    def __init__(self, qs, *args, **kwargs): 
        # call the standard init first 
        super(ArticleForm2, self).__init__(*args, **kwargs) 
        # now customise your field 
        self.fields['item_field'].queryset = qs 
    
class ArticleForm3(forms.Form):
    Ville = forms.ModelChoiceField(queryset=City.objects.none())
    
    def __init__(self, qs, *args, **kwargs): 
        # call the standard init first 
        super(ArticleForm3, self).__init__(*args, **kwargs) 
        # now customise your field 
        self.fields['ville'].queryset = qs 



class ContactForm(forms.Form):

    
    nom = forms.CharField(max_length=20)
    prenom = forms.CharField(max_length=20)
    email = forms.EmailField(label="E-mail")
    continent = forms.CharField(max_length=20)
    pays = forms.CharField(max_length=20)
    ville = forms.CharField(max_length=20)
    université = forms.CharField(max_length=20)
    département= forms.CharField(max_length=20, label = "Département de l'université dans lequel vous avez fait votre échange")
    langue = forms.CharField(max_length=20, label = "Langue des cours")
    dateDebut = forms.DateField(widget =forms.SelectDateWidget)
    dateFin = forms.DateField(widget =forms.SelectDateWidget)
    annee = forms.ChoiceField(choices=["4TC", "5TC"]) 


#class ArticleForm(forms.ModelForm):
#    class Meta:
#        model = University
#        fields = '__all__'

class TestForm2(forms.Form):
    CountryName = forms.ModelChoiceField(queryset=Country.objects.all().values_list('CountryName').order_by('Continent'),required=False,empty_label="(pas trier par pays)")"""