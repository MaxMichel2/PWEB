from django.shortcuts import render,redirect
from django.http import HttpResponse
from .forms import *
from exchange.models import *
from django.db.models import Avg

# Actualisation de rankMetrique
def actualiserMetrique1():
   metrique_Depa = Department.objects.values_list('University').annotate(Avg('Rank'))
  
   for elem in metrique_Depa:
       instance = University.objects.get(ID=elem[0])
       instance.RankMetric = elem[1]
       instance.save()

# Actualisation de lifeMetric
def actualiserMetrique2():
   metrique2_Depa = Exchange.objects.values_list('University').annotate(Avg('CulturalLifeGrade'),Avg('NightLifeGrade'),Avg('Security'))#mettre le cout de la vie aussi
   for elem in metrique2_Depa:
       instance = University.objects.get(ID=elem[0])
       instance.LifeMetric = ((elem[1]+elem[2]+elem[3])/3)
       instance.save()
"""
def test(request): 
   form = TestForm(request.POST or None)
   #form2 = TestForm2(Country.objects.none())
   form2 = TestForm2(request.POST or None)
   formContract = ContractForm(request.POST or None)
   #selections = SelectForm(request.POST or None)
   #if form.is_valid() and form2.is_valid() and formContract.is_valid() and ordre.is_valid():
      #print("guguuu")
   if form.is_valid() and formContract.is_valid() :
      Continent = form.cleaned_data['Continent']
      #qs =Country.objects.filter(Continent=Continent).order_by('CountryName')
      #form2 = TestForm2(qs)
      print(form2.is_valid())
      ordre = OrdreForm(request.POST or None)
      
      if ordre.is_valid():
         orde = ordre.cleaned_data['Ordre']
         print("dedededeeeeede")
      
    if form.is_valid() and selections.is_valid():
      valide = True
      Continent = form.cleaned_data['Continent']
      qs =Country.objects.filter(Continent=Continent).values_list('CountryName')
      form2 = TestForm2(qs) #dire que ce n'est pas obligatoire
      formContract = ContractForm(request.POST or None)
      ordre = OrdreForm(request.POST or None)

      if formContract.is_valid() and ordre.is_valid():
         print("gugu yeyeee") 

   return render(request, 'exchange/test.html', locals())"""


#-----------------------PAGE D'ACCUEIL-----------------
def accueil(request):
    Univ_list = University.objects.all()
    actualiserMetrique1()
    actualiserMetrique2()
    return render(request, 'exchange/accueil.html', locals())

def listeUnis(request):
    return render(request, 'exchange/listeUnis.html', {})

#-----------------------PAGE D'UNE UNIVERSITE (PAR ID)-----------------
def universite(request, idUni):
    univ = University.objects.get(pk=idUni)
    cont = UniversityContracts.objects.get(University=univ)#peut renvoyer plusieurs
    langue = UniversityLanguages.objects.filter(University=univ)
    ex = Exchange.objects.filter(University=univ)
    return render(request, 'exchange/universite.html', locals())

#-----------------------PAGE RECHERCHE AVANCEE-----------------
def RechercheAvancee(request): 
   qs = University.objects.none()
   form = RAContinentForm(request.POST or None)
   formContract = ContractForm(request.POST or None)
   ordre = OrdreForm(request.POST or None)
   ttl = Country.objects.all()
   AS= Country.objects.filter(Continent='AS')
   AF= Country.objects.filter(Continent='AF')
   AdN= Country.objects.filter(Continent='AdN')
   AdS= Country.objects.filter(Continent='AdS')
   EU= Country.objects.filter(Continent='EU')
   OC= Country.objects.filter(Continent='OC')
   print(request.POST.get('CountryName'))
   if form.is_valid() and formContract.is_valid() and ordre.is_valid() :
      Continent = form.cleaned_data['Continent']
      CountryName = request.POST.get('CountryName')
      ContractType = formContract.cleaned_data['ContractType']
      ordres = ordre.cleaned_data['Ordre']
      print(type(ContractType))
      valide=True
      #a tester encore
      if(CountryName=="" and ContractType=="" and ordres=="CountryName" ):
         print("pas de tri,coutry")
         #universities = University.objects.filter(City__Country__Continent=Continent).order_by('City__Country__CountryName')
         universitiesC = UniversityContracts.objects.filter(University__City__Country__Continent=Continent).order_by('University__City__Country__CountryName')
      elif(CountryName=="" and ContractType==""):
         print("pas de tri, autre ordre")
         #universities = University.objects.filter(City__Country__Continent=Continent).order_by(ordres)
         universitiesC = UniversityContracts.objects.filter(University__City__Country__Continent=Continent).order_by('University__'+ordres)
      elif(CountryName!="" and ContractType=="" and ordres=="CountryName"):
         print("tri par pays,country")
         #universities = University.objects.filter(City__Country__CountryName=CountryName).order_by('City__Country__CountryName')
         universitiesC = UniversityContracts.objects.filter(University__City__Country__CountryName=CountryName).order_by('University__City__Country__CountryName')
      elif(CountryName!="" and ContractType==""):
         print("tri par pays, autre ordre")
         #universities = University.objects.filter(City__Country__CountryName=CountryName).order_by(ordres)
         universitiesC = UniversityContracts.objects.filter(University__City__Country__CountryName=CountryName).order_by('University__'+ordres)
      elif(CountryName!="" and ContractType!="" and ordres=="CountryName"):
         print("par pays et contract, country")
         universitiesC = UniversityContracts.objects.filter(ContractType=ContractType).filter(University__City__Country__CountryName=CountryName).order_by('University__City__Country__CountryName')
      elif(CountryName!="" and ContractType!=""):
         print("par pays et contract, auter ordre")
         universitiesC = UniversityContracts.objects.filter(ContractType=ContractType).filter(University__City__Country__CountryName=CountryName).order_by('University__'+ordres)
      elif(CountryName=="" and ContractType!="" and ordres=="CountryName"):
         print("par contract, country")
         universitiesC = UniversityContracts.objects.filter(University__City__Country__Continent=Continent).filter(ContractType=ContractType).order_by('University__City__Country__CountryName')
      else:
         print("par contract,autre ordre")
         universitiesC = UniversityContracts.objects.filter(University__City__Country__Continent=Continent).filter(ContractType=ContractType).order_by('University__'+ordres)
      for c in universitiesC:
         print(c.University.Name)

      """
       l = UniversityLanguages.objects.all()
       l2 = l.exclude(Language='Inconnu')
      
      universities = UniversityContracts.objects.all().filter(University__City__Country__CountryName=CountryName).order_by('University__City__Country__CountryName')
      for c in universities:
         print(c.City.Country.CountryName)"""
      """#----------avec contract
      contract = UniversityContracts.objects.filter(ContractType=ContractType)
      for c in contract:
         print(c.University.Name)
      #---------avec pays sans contract ordoné par pays----------
      universities = University.objects.filter(City__Country__CountryName=Continent).order_by('City__Country__CountryName')
      for u in universities:
         print(u.City.Country.CountryName)

      #------sans pays sans contract ordoné par pays----------
      universities = University.objects.filter(City__Country__Continent=Continent).order_by('City__Country__CountryName')
      #for u in universities:
         #print(u.City.Country.CountryName)

      #------sans pays sans contract ordoné par autres----------
      universities = University.objects.filter(City__Country__Continent=Continent).order_by(ordre)
      #for u in universities:
         #print(u.City.Country.CountryName)"""      

   return render(request, 'exchange/Recherche_Avancee.html', locals())

#---------RAJOUTER INFO--------------------------------
#selection continent
def rajouter(request):        
    return render(request, 'exchange/rajouter.html', locals())

#selection pays
def pays(request,cont):
    pay = Country.objects.filter(Continent=cont)
    return render(request, 'exchange/pays.html',locals())

#selection ville
def villes(request,pay):
    p = Country.objects.get(pk=pay)
    ville = City.objects.filter(Country=p)
    return render(request, 'exchange/villes.html',locals())

#selection univ
def univs(request,ville):
    v = City.objects.get(pk=ville)
    Uni = University.objects.filter(City=v)
    return render(request, 'exchange/univs.html',locals())

#rajouter info étape 1:Student
def rajoutInfo(request,univ):
    Uni = University.objects.get(pk=univ)
    univID = Uni.ID

    form = StudentForm(request.POST or None)
    if form.is_valid():
        Email = form.cleaned_data['Email']
        Name = form.cleaned_data['Name']
        Surname = form.cleaned_data['Surname']
        INSADepartment = form.cleaned_data['INSADepartment']
        Nationality = form.cleaned_data['Nationality']

        student = Student(Email=Email,Name=Name,Surname=Surname,INSADepartment=INSADepartment,Nationality=Nationality)
        student.save()

        #ou direct form.save()

        studentID = student.ID

        return redirect('/exchange/modifDepStud/'+str(univID)+'/'+str(studentID))

    return render(request, 'exchange/rajoutInfo.html', locals())

#rajouter info étape 2:Department et UnivLanguage
def rajoutInfo2(request,univ,stud):
   Uni = University.objects.get(pk=univ)
   Stud = Student.objects.get(pk=stud)
   studentID = Stud.ID
   univID = Uni.ID

   form = DepartForm(request.POST or None)
   form2= LangueForm(request.POST or None)

   if form.is_valid() and form2.is_valid():
      #form 1 depart
      Name = form.cleaned_data['Name']
      Rank = form.cleaned_data['Rank']

      depart = Department(Name=Name,University=Uni,Rank=Rank)
      #depart.save()

      #form 2 depart
      Language = form2.cleaned_data['Language']
      LanguageDiploma = form2.cleaned_data['LanguageDiploma']
      LanguageLevel = form2.cleaned_data['LanguageLevel']

      langue = UniversityLanguages(Language=Language, LanguageDiploma= LanguageDiploma, LanguageLevel=LanguageLevel,University=Uni)
      #langue.save()


      return redirect('/exchange/modifExch/'+str(univID)+'/'+str(studentID))

   return render(request, 'exchange/rajoutInfoDepStud.html', locals())

#rajouter info étape 3:Exchange
def rajoutInfo3(request,univ,stud):
   Uni = University.objects.get(pk=univ)
   Stud = Student.objects.get(pk=stud)
   univID = Uni.ID

   form = ExchForm(request.POST or None)
   formVisa = ExchFormVisa(request.POST or None)
   if form.is_valid() and formVisa.is_valid():
      Year = form.cleaned_data['Year']
      StartDate = form.cleaned_data['StartDate']
      EndDate = form.cleaned_data['EndDate']
      Semester = form.cleaned_data['Semester']
      Comment = form.cleaned_data['Comment']
      TimeVisa = form.cleaned_data['TimeVisa']
      Rent = form.cleaned_data['Rent']
      MonthlyExpenses = form.cleaned_data['MonthlyExpenses']
      NightLifeGrade = form.cleaned_data['NightLifeGrade']
      CulturalLifeGrade = form.cleaned_data['CulturalLifeGrade']
      Security = form.cleaned_data['Security']

      Visa = formVisa.cleaned_data['Visa']
      exch = Exchange(Year=Year,StartDate=StartDate,EndDate=EndDate,Semester=Semester,Visa=Visa,Comment=Comment,TimeVisa=TimeVisa,Rent=Rent,MonthlyExpenses=MonthlyExpenses,NightLifeGrade=NightLifeGrade,CulturalLifeGrade=CulturalLifeGrade,Security=Security,Student=Stud,University=Uni)
      exch.save()
      exchID=exch.ID
      #ou direct form.save()

      return redirect('/exchange/modifFinancial/'+str(univID)+'/'+str(exchID))

   return render(request, 'exchange/rajoutInfoExch.html', locals())

#rajouter info étape 4: Aides Finances
def rajoutInfo4(request,univ,exch):
   Uni = University.objects.get(pk=univ)
   Exch = Exchange.objects.get(pk=exch)
   ExchID = Exch.ID

   form = FinancialForm(request.POST or None)
   if form.is_valid():
      Name = form.cleaned_data['Name']
      Value = form.cleaned_data['Value']
      ReceivedEvery = form.cleaned_data['ReceivedEvery']

      fin = FinancialAid(Name=Name,Value=Value,ReceivedEvery=ReceivedEvery,Exchange=Exch,)
      fin.save()
      #ou direct form.save()

      #aller vers page qui verifie l'info
      return redirect('/exchange/accueil')

   return render(request, 'exchange/rajoutInfoFin.html', locals())

def test(request):
   return render(request,'exchange/recherche_avance.html')

