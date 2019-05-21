from django.contrib import admin
from django.urls import path, include
from . import views

urlpatterns = [
   
    path('recherche_avance', views.RechercheAvancee, name='RechercheAvancee'),
    path('t', views.test, name='t'),
    path('accueil', views.accueil),
    path('universite/<int:idUni>', views.universite),
    path('rajouter', views.rajouter, name='rajouter'),
    path('continent/<str:cont>', views.pays, name='pays'),
    path('pay/<int:pay>', views.villes, name='villes'),
    path('ville/<int:ville>', views.univs, name='univs'),
    path('modifier/<int:univ>', views.rajoutInfo, name='rajoutInfo'),
    path('modifDepStud/<int:univ>/<int:stud>', views.rajoutInfo2, name='rajoutInfo2'),
    path('modifExch/<int:univ>/<int:stud>', views.rajoutInfo3, name='rajoutInfo3'),
    path('modifFinancial/<int:univ>/<int:exch>', views.rajoutInfo4, name='rajoutInfo4'),
    path('listeUnis', views.listeUnis),
]
"""
path('ajoutInfo1', views.ajoutInfo1, name='ajouteInfo1'),
path('ajoutInfo2', views.ajoutInfo2, name='ajouteInfo2'),
path('ajoutInfo3', views.ajoutInfo3, name='ajouteInfo3'),
path('ajoutInfo4', views.ajoutInfo4, name='ajouteinfo4'),
"""