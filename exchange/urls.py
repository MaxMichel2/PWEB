from django.contrib import admin
from django.urls import path, include
from . import views

urlpatterns = [
   
    path('recherche_avancee', views.RechercheAvancee, name='RechercheAvancee'),
    path('addDep/<int:univ>', views.ajoutOf, name='t'),
    path('modifDep/<int:dep>', views.modifOf, name='t2'),
    path('home', views.home),
    path('universite/<int:idUni>', views.universite),
    path('rajouter', views.rajouter, name='rajouter'),
    path('continent/<str:cont>', views.pays, name='pays'),
    path('pays/<int:pays>', views.villes, name='villes'),
    path('ville/<int:ville>', views.univs, name='univs'),
    path('modifier/<int:univ>', views.rajoutInfo, name='rajoutInfo'), #universite/<int:univ>/informations-personnelles
    path('modifDepStud/<int:univ>/<int:stud>', views.rajoutInfo2, name='rajoutInfo2'), #universite/<int:univ>/<int:stud>/departement
    path('modifExch/<int:univ>/<int:stud>', views.rajoutInfo3, name='rajoutInfo3'), #universite/<int:univ>/<int:stud>/echange
    path('modifFinancial/<int:univ>/<int:exch>', views.rajoutInfo4, name='rajoutInfo4'), #universite/<int:univ>/<int:exch>/bourses
    path('login', views.connexion, name='connexion'),
    path('logout', views.deconnexion, name='deconnexion'),
    path('rapport', views.rapport),
    path('base', views.base),
    path('espaceetudiant', views.espace)
]