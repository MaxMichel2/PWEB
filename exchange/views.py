from django.shortcuts import render,redirect
from django.http import HttpResponse
from .forms import *
from exchange.models import *
from django.db.models import Avg

#pour l'authentification
from django_cas_ng.signals import cas_user_authenticated #signal
from django.contrib.auth.decorators import login_required,permission_required,user_passes_test
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import Permission

def base(request):
   return render(request, 'exchange/base.html')

#--------------------------------PAGE D'ACCUEIL-----------------------------------
# Actualisation de rankMetrique
def actualiserMetrique1():
   #moyenne des différent Rank pour chaque Department de Chaque Univ
   metrique_Depa = Department.objects.values_list('University').annotate(Avg('Rank'))
  
   #insère la valeur dans l'université
   for elem in metrique_Depa:
       instance = University.objects.get(ID=elem[0])
       instance.RankMetric = elem[1]
       instance.save()

# Actualisation de lifeMetric
def actualiserMetrique2():
   #moyenne des différent Rank pour chaque Department de Chaque Univ
   metrique2_Depa = Exchange.objects.values_list('University').annotate(Avg('CulturalLifeGrade'),Avg('NightLifeGrade'),Avg('Security'))#mettre le cout de la vie aussi
  
   #insère la valeur dans l'université
   for elem in metrique2_Depa:
       instance = University.objects.get(ID=elem[0])
       instance.LifeMetric = ((elem[1]+elem[2]+elem[3])/3)
       instance.save()


def accueil(request):
   #requete pour donner toutes les universitées
    Univ_list = University.objects.all()

    #actualise les métriques
    actualiserMetrique1()
    actualiserMetrique2()

    return render(request, 'exchange/accueil_pictogram.html', locals())


#-----------------------PAGE D'UNE UNIVERSITE (PAR ID)-----------------
def universite(request, idUni):
   #Requetes vers BD:
   univ = University.objects.get(pk=idUni)
   cont = UniversityContractsStudent.objects.filter(University=univ)
   langue = UniversityLanguages.objects.filter(University=univ)
   ex = Exchange.objects.filter(University=univ)
   S1 = ex.filter(Semester=1).order_by('EndDate').first() #renvoie le premier élément de "ex" pour Semestre 1
   S2 = ex.filter(Semester=2).order_by('EndDate').first() #renvoie le premier élément de "ex" pour Semestre 2
   
   #Pour avoir toutes les financialAid d'une échange "ex"
   fin = FinancialAid.objects.none()
   for e in ex:
      fin = fin | FinancialAid.objects.filter(Exchange=e)
   
   #la moyenne des différentes notes pour touts les object Exchange d'un Université
   avg = Exchange.objects.filter(University=univ).aggregate(r=Avg('Rent'),m=Avg('MonthlyExpenses'),n=Avg('NightLifeGrade'),c=Avg('CulturalLifeGrade'),s=Avg('Security'))#mettre le cout de la vie aussi

   return render(request, 'exchange/universite.html', locals())


#-----------------------PAGE RECHERCHE AVANCEE-----------------
def RechercheAvancee(request):
   #Initialisation d'un objets Université pour requête 
   qs = University.objects.none()

   #Initialisation des forms 
   form = RAContinentForm(request.POST or None) 
   formContract = ContractForm(request.POST or None)
   ordre = OrdreForm(request.POST or None)

   #liste de tout les objects Pays
   ttl = Country.objects.all()

   #Trier les objects Pays par Continent
   AS= Country.objects.filter(Continent='AS')
   AF= Country.objects.filter(Continent='AF')
   AdN= Country.objects.filter(Continent='AdN')
   AdS= Country.objects.filter(Continent='AdS')
   EU= Country.objects.filter(Continent='EU')
   OC= Country.objects.filter(Continent='OC')
   
   #Verifie que le submit est cohérent
   if form.is_valid() and formContract.is_valid() and ordre.is_valid() :
      #prend toutes les valuers
      Continent = form.cleaned_data['Continent']
      CountryName = request.POST.get('CountryName')
      ContractType = formContract.cleaned_data['ContractType']
      ordres = ordre.cleaned_data['Ordre']
      
      #dit qu'on peut afficher la lsite des Universités
      valide=True

      #En fonction des options choisies on fait une requete différente
      if(CountryName=="" and ContractType=="" and ordres=="CountryName" ):
         universitiesC = UniversityContractsStudent.objects.filter(University__City__Country__Continent=Continent).order_by('University__City__Country__CountryName')
      elif(CountryName=="" and ContractType==""):
         universitiesC = UniversityContractsStudent.objects.filter(University__City__Country__Continent=Continent).order_by('University__'+ordres)
      elif(CountryName!="" and ContractType=="" and ordres=="CountryName"):
         universitiesC = UniversityContractsStudent.objects.filter(University__City__Country__CountryName=CountryName).order_by('University__City__Country__CountryName')
      elif(CountryName!="" and ContractType==""):
         universitiesC = UniversityContractsStudent.objects.filter(University__City__Country__CountryName=CountryName).order_by('University__'+ordres)
      elif(CountryName!="" and ContractType!="" and ordres=="CountryName"):
         universitiesC = UniversityContractsStudent.objects.filter(ContractType=ContractType).filter(University__City__Country__CountryName=CountryName).order_by('University__City__Country__CountryName')
      elif(CountryName!="" and ContractType!=""):
         universitiesC = UniversityContractsStudent.objects.filter(ContractType=ContractType).filter(University__City__Country__CountryName=CountryName).order_by('University__'+ordres)
      elif(CountryName=="" and ContractType!="" and ordres=="CountryName"):
         universitiesC = UniversityContractsStudent.objects.filter(University__City__Country__Continent=Continent).filter(ContractType=ContractType).order_by('University__City__Country__CountryName')
      else:
         universitiesC = UniversityContractsStudent.objects.filter(University__City__Country__Continent=Continent).filter(ContractType=ContractType).order_by('University__'+ordres)
           

   return render(request, 'exchange/Recherche_Avancee.html', locals())



#---------RAJOUTER INFO--------------------------------
#selection continent
def rajouter(request):        
    return render(request, 'exchange/rajouter.html', locals())

#selection pays
def pays(request,cont):
   #donne lsite des objects pays selon le Continent du paramètre de l'URL
    pays_var = Country.objects.filter(Continent=cont)
    return render(request, 'exchange/pays.html',locals())

#selection ville
def villes(request,pays):
   #donne l'object pays grace à l'URL
    p = Country.objects.get(pk=pays)

    #donne les villes pour ce pays là
    ville = City.objects.filter(Country=p)

    return render(request, 'exchange/villes.html',locals())

#selection univ
def univs(request,ville):
   #Obtien l'objet City grave à l'URL
    v = City.objects.get(pk=ville)

    #donne toutes les universités de cette ville là
    Uni = University.objects.filter(City=v)

    return render(request, 'exchange/univs.html',locals())

#rajouter info étape 1:Student
def rajoutInfo(request,univ):
   #prend l'object Université par l'URL
    Uni = University.objects.get(pk=univ)
    univID = Uni.ID

   #Initialise, verifie et prend les info du formulaire pour Student
    form = StudentForm(request.POST or None)
    if form.is_valid():
        Email = form.cleaned_data['Email']
        Name = form.cleaned_data['Name']
        Surname = form.cleaned_data['Surname']
        INSADepartment = form.cleaned_data['INSADepartment']
        Nationality = form.cleaned_data['Nationality']

        #Enregistre cet étudiant dans la BD
        student = Student(Email=Email,Name=Name,Surname=Surname,INSADepartment=INSADepartment,Nationality=Nationality)
        student.save()
        #ou direct form.save()

        #on passera l'ID de l'étudiant dans l'URL
        studentID = student.ID
        
        #redirige vers prochaine page
        return redirect('/exchange/modifDepStud/'+str(univID)+'/'+str(studentID))

    return render(request, 'exchange/rajoutInfo.html', locals())

#rajouter info étape 2:Department et UnivLanguage
def rajoutInfo2(request,univ,stud):
   #Recupère Université et Student du l'URL
   Uni = University.objects.get(pk=univ)
   Stud = Student.objects.get(pk=stud)
   studentID = Stud.ID
   univID = Uni.ID

   #Forms pour Department et UniversityLanguage
   form2= LangueForm(request.POST or None)

   #test
   qs = Department.objects.filter(University=Uni)
   formTest = TestForm2(qs)   
   print(request.POST)
   if form2.is_valid():
      #Test
      idDep = request.POST.get('NameDep')
      note = request.POST.get('Note')
      print(idDep)
      if(idDep!=""):
         Dep = Department.objects.get(pk=idDep)
         Dep.Rank = note
         Dep.save()

      #form 2 Language
      Language = form2.cleaned_data['Language']
      LanguageDiploma = form2.cleaned_data['LanguageDiploma']
      LanguageLevel = form2.cleaned_data['LanguageLevel']

      langue = UniversityLanguages(Language=Language, LanguageDiploma= LanguageDiploma, LanguageLevel=LanguageLevel,University=Uni)
      langue.save()

      #redirige vers next form
      return redirect('/exchange/modifExch/'+str(univID)+'/'+str(studentID))

   return render(request, 'exchange/rajoutInfoDepStud.html', locals())

#rajouter info étape 3:Exchange
def rajoutInfo3(request,univ,stud):
   #recupère info de URL
   Uni = University.objects.get(pk=univ)
   Stud = Student.objects.get(pk=stud)
   univID = Uni.ID

   #Formulaire pour Exchange
   form = ExchForm(request.POST or None)
   formVisa = ExchFormVisa(request.POST or None)#poue la case à cohcer c'est un cas à part

   if form.is_valid() and formVisa.is_valid():
      Year = form.cleaned_data['Year']
      StartDate = form.cleaned_data['StartDate']
      EndDate = form.cleaned_data['EndDate']
      Semester = form.cleaned_data['Semester']
      Comment = form.cleaned_data['Comment']
      VisaDays = form.cleaned_data['VisaDays']
      VisaWeeks = form.cleaned_data['VisaWeeks']
      VisaMonths = form.cleaned_data['VisaMonths']
      Rent = form.cleaned_data['Rent']
      MonthlyExpenses = form.cleaned_data['MonthlyExpenses']
      NightLifeGrade = form.cleaned_data['NightLifeGrade']
      CulturalLifeGrade = form.cleaned_data['CulturalLifeGrade']
      Security = form.cleaned_data['Security']
      Visa = formVisa.cleaned_data['Visa']#case à cocher

      #Rajouter dans BD
      exch = Exchange(Year=Year,StartDate=StartDate,EndDate=EndDate,Semester=Semester,Visa=Visa,Comment=Comment,VisaMonths=VisaMonths,VisaDays=VisaDays,VisaWeeks=VisaWeeks,Rent=Rent,MonthlyExpenses=MonthlyExpenses,NightLifeGrade=NightLifeGrade,CulturalLifeGrade=CulturalLifeGrade,Security=Security,Student=Stud,University=Uni)
      exch.save()

      #pour passage de paramètre dans URL
      exchID=exch.ID

      #redirige vers next form
      return redirect('/exchange/modifFinancial/'+str(univID)+'/'+str(exchID))

   return render(request, 'exchange/rajoutInfoExch.html', locals())

#rajouter info étape 4: Aides Finances
def rajoutInfo4(request,univ,exch):
   #recupère données de URL
   Uni = University.objects.get(pk=univ)
   Exch = Exchange.objects.get(pk=exch)
   ExchID = Exch.ID

   #form pour les Aides Finacières
   form = FinancialForm(request.POST or None)
   if form.is_valid():
      Name = form.cleaned_data['Name']
      Value = form.cleaned_data['Value']
      ReceivedEvery = form.cleaned_data['ReceivedEvery']

      #enregistre dans base de donnée
      fin = FinancialAid(Name=Name,Value=Value,ReceivedEvery=ReceivedEvery,Exchange=Exch,)
      fin.save()

      #aller vers page d'accueil
      return redirect('/exchange/accueil')

   return render(request, 'exchange/rajoutInfoFin.html', locals())


#----------------AUTHENTIFICATION---------
#Connexion
@login_required(login_url='/accounts/login/')#redirige vers CAS
def connexion(request):
    print(request.session['attributes'])#affiche attributs de l'utilisateur
    user = request.user#prend le user

    #rajoute permission pour noter info officielles 
    permission = Permission.objects.get(codename='noter_depart')
    user.user_permissions.add(permission)
    #ici faire user.atribuChePa == blabla
    
    #reviesn à la page d'accueil
    return redirect('/exchange/accueil')

#Renvoie faux si utilisateur est connecté 
def check(user):
    return not(user.is_authenticated)

#DECONEXION ou sinon CAS_IGNORE_REFERER à true
@user_passes_test(check , login_url='/accounts/logout/')#redirige vers deconnexion CAS
def deconnexion(request):
    logout(request)
    #HttpResponse(reverse('cas_ng_logout'))
    #reverse(connexion)
    #redirige vers accueil
    return redirect('/exchange/accueil')


#----------------------PROF : MODIFIE--------------------
#pour la page d'ajout de département
@permission_required('exchange.noter_depart')
def ajoutOf(request,univ):
   #Initialisation des forms
   form = DepartForm(request.POST or None)
   formUni = UnivForm(request.POST or None)

   #Reuperation de l'Universite ensuite des département de l'Université
   Uni = University.objects.get(pk=univ)
   departs = Department.objects.filter(University = Uni)

   #recupère les données du Form de Départment
   if form.is_valid():
      Name = form.cleaned_data['Name']
      Rank = form.cleaned_data['Rank']

      #Creer un nouveau département dans BD
      depart = Department(Name=Name,University=Uni,Rank=Rank)
      depart.save()
   
   #recupere les donnes du form Université
   if formUni.is_valid():
      Places = formUni.cleaned_data['Places']
      Demand = formUni.cleaned_data['Demand']

      #modifie les valeurs de l'université
      Uni.Places = Places
      Uni.Demand = Demand
      Uni.save()

   return render(request, 'exchange/ajoutOf.html',locals())

#pour la page de modification d'un département
@permission_required('exchange.noter_depart')
def modifOf(request,dep):
   #recupère le départ de l'URL
   form = DepartForm(request.POST or None)
   depart = Department.objects.get(pk = dep)

   #recupère info du fom de Départment
   if form.is_valid():
      Name = form.cleaned_data['Name']
      Rank = form.cleaned_data['Rank']

      #modifie les valeurs
      depart.Name = Name
      depart.Rank = Rank
      depart.save()

      #redirige vers la première page d'ajout officiellle
      return redirect('/exchange/addDep/'+str(depart.University.ID))

   return render(request, 'exchange/ModifOf.html',locals())



#--------------Rapport---------------
def rapport(request):
    return render(request, 'exchange/rapport.html', {})