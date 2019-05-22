from django.contrib import admin
from django.urls import path, include
from . import views

urlpatterns = [
   
    path('recherche_avance', views.RechercheAvancee, name='RechercheAvancee'),
    path('addDep/<int:univ>', views.test, name='t'),
    path('modifDep/<int:dep>', views.test2, name='t2'),
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
    path('connexion', views.connexion, name='connexion'),
    path('deconnexion', views.deconnexion, name='deconnexion'),
]