from django.db import models
from datetime import timedelta

# Create your models here.

class Country(models.Model):
	CONTINENTS = (
		('AS', 'Asie'),
		('AF', 'Afrique'),
		('AdN', 'Amerique du Nord'),
		('AdS', 'Amerique du Sud'),
		('EU', 'Europe'),
		('OC', 'Oceanie'),
	)
	ID = models.AutoField(primary_key=True)
	CountryName = models.CharField(max_length=100)
	ECTSConversion = models.FloatField(default=-1) # 1 crédit du pays concerné vaut x crédits ECTS
	Continent = models.CharField(max_length=30, choices=CONTINENTS)

	def __str__(self):
		return str(self.ID)

class City(models.Model):
	ID = models.AutoField(primary_key=True)
	CityName = models.CharField(max_length=100)
	Country = models.ForeignKey('Country', on_delete=models.CASCADE)

	def __str__(self):
		return self.CityName

class University(models.Model):
	ID = models.AutoField(primary_key=True)
	Name = models.CharField(max_length=1000)
	RankMetric = models.DecimalField(max_digits=3, decimal_places=2, default=-1)
	LifeMetric = models.DecimalField(max_digits=3, decimal_places=2, default=-1)
	Lat = models.DecimalField(max_digits=11, decimal_places=6, null=True, blank=True) # Utilisation de la base pour afficher
	Long = models.DecimalField(max_digits=11, decimal_places=6, null=True, blank=True) # les POI sur la carte interactive ??? Good/Bad ???
	City = models.ForeignKey('City', on_delete=models.CASCADE)
	WebLink = models.URLField(default="https://pas.renseigne")
	Places = models.IntegerField(default=-1)
	Demand = models.IntegerField(default=-1)
	SplitableYear = models.BooleanField(default=False)
	Project = models.BooleanField(default=False)
	CWURRank = models.IntegerField(null=True, blank=True)

	def __str__(self):
		return self.Name

class UniversityContracts(models.Model):
	CONTRACTS = (
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
	ID = models.AutoField(primary_key=True)
	ContractType = models.CharField(max_length=200, choices=CONTRACTS, default="X")
	University = models.ForeignKey('University', on_delete=models.CASCADE)

	def __str__(self):
		return self.ContractType

class UniversityLanguages(models.Model):
	LEVEL = (
		('A0','A0'),
		('A1','A1'),
		('A2','A2'),
		('B1','B1'),
		('B2','B2'),
		('C1','C1'),
		('C2','C2'),
		('X','Non Specifie'),
	)
	ID = models.AutoField(primary_key=True)
	Language = models.CharField(max_length=50, default="Inconnu")
	LanguageDiploma = models.CharField(max_length=200, null=True, blank=True)
	LanguageLevel = models.CharField(max_length=10, choices=LEVEL, null=True, blank=True, default="X")
	University = models.ForeignKey('University', on_delete=models.CASCADE)

	def __str__(self):
		return self.Language

class Department(models.Model):
	ID = models.AutoField(primary_key=True)
	Name = models.CharField(max_length=100, default="Inconnu")
	University = models.ForeignKey('University', on_delete=models.CASCADE)
	Rank = models.IntegerField(default=-1, help_text="Utilisez une valeur entre 1 et 5, 1 étant la plus basse et 5 la plus haute.")

	def __str__(self):
		return self.Name

class Student(models.Model):
	DEPARTMENT = (
		('BS','BS'),
		('GCU','GCU'),
		('GM','GM'),
		('GE','GE'),
		('TC','TC'),
		('IF','IF'),
		('SGM','SGM'),
		('GEN','GEN'),
		('GI','GI'),
	)
	ID = models.AutoField(primary_key=True)
	Email = models.EmailField(default="prenom.nom@insa-lyon.fr", help_text="Utilisez votre adresse INSA : prenom.nom@insa-lyon.fr")
	Name = models.CharField(max_length=100)
	Surname = models.CharField(max_length=100)
	INSADepartment = models.CharField(max_length=10, choices=DEPARTMENT)
	Nationality = models.CharField(max_length=100, null=True, blank=True)

	def __str__(self):
		return self.Email

class FinancialAid(models.Model):
	RECEIVED_EVERY = (
		("J", "Jours"),
		("S", "Semaines"),
		("M", "Mois"),
	)
	ID = models.AutoField(primary_key=True)
	Name = models.CharField(max_length=100, null=True, blank=True, help_text="Le nom de la bourse.")
	Value = models.IntegerField(null=True, blank=True, help_text="En euros (€).", default=-1)
	ReceivedEvery = models.CharField(max_length=15, null=True, blank=True, choices=RECEIVED_EVERY)
	Exchange = models.ForeignKey('Exchange', on_delete=models.CASCADE)

	def __str__(self):
		return self.Name

class Exchange(models.Model):
	YEAR_CHOICE = (
		(4, 4),
		(5, 5),
	)

	SEMESTER_CHOICE = (
		(1, 1),
		(2, 2),
	)
	ID = models.AutoField(primary_key=True)
	Year = models.IntegerField(default=-1, choices=YEAR_CHOICE)
	StartDate = models.DateField()
	EndDate = models.DateField()
	Semester = models.IntegerField(default=-1, choices=SEMESTER_CHOICE)
	Visa = models.BooleanField(default=False)
	Comment = models.CharField(max_length=1000, null=True, blank=True)
	VisaMonths = models.IntegerField(null=True, blank=True, default=-1)
	VisaWeeks = models.IntegerField(null=True, blank=True, default=-1)
	VisaDays = models.IntegerField(null=True, blank=True, default=-1)
	Rent = models.IntegerField(null=True, blank=True, default=-1)
	MonthlyExpenses = models.IntegerField(null=True, blank=True, default=-1)
	NightLifeGrade = models.IntegerField(null=True, blank=True, default=-1)
	CulturalLifeGrade = models.IntegerField(null=True, blank=True, default=-1)
	Security = models.IntegerField(null=True, blank=True, default=-1)
	Student = models.ForeignKey('Student', on_delete=models.CASCADE)
	University = models.ForeignKey('University', on_delete=models.CASCADE)

	def __str__(self):
		return self.Comment
