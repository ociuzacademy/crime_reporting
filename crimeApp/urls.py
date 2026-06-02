from django.contrib import admin
from django.urls import path
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from crimeApp import views
from django.contrib import admin
from django.urls import path,include


urlpatterns = [

    #common
    path('',views.index),
    path('login/',views.login),
    path('logout/',views.logout),
    path('about_uuus/',views.about_uuus),

    #admin
    path('admin_homme/',views.admin_homme),
    path('add_police/',views.add_police),
    path('view_police/',views.view_police),
    path('add_cat/',views.add_cat),
    path('view_lawyer/',views.view_lawyer),
    path('reject_lawyer/',views.reject_lawyer),
    path('approve_lawyer/',views.approve_lawyer),
    path('list_user/',views.list_user),
    path('delete_user/',views.delete_user),
    path('profile_admin/',views.profile_admin),
    path('edit_profile_admin/',views.edit_profile_admin),
    path('delete_police/',views.delete_police),
    path('view_cases/',views.view_cases),
    path('all_feeeedback/',views.all_feeeedback),
    path('contact_uuus/',views.contact_uuus),
    path('contact_us/',views.contact_us),
    path('remove_feedback/',views.remove_feedback),
    





    #user
    path('user_register/',views.user_register),
    path('profile_user/',views.profile_user),
    path('edit_profile_user/',views.edit_profile_user),
    path('list_lawyer/',views.list_lawyer),
    path('add_complaint/',views.add_complaint),
    path('view_complaint/',views.view_complaint),
    path('view_station/',views.view_station),
    path('feedback/',views.feedback),
    path('book_lawyer/',views.book_lawyer),
    path('view_booking_details/',views.view_booking_details),
    path('feedback_lawyer/',views.feedback_lawyer),
    path('feedback_police/',views.feedback_police),
    path('user_home/',views.user_home),
    path('view_fir/',views.view_fir),
    
    
    
    #police section
    path('register/',views.register),
    path('police_home/',views.police_home),
    path('p_profile/',views.p_profile),
    path('edit_profile_police/',views.edit_profile_police),
    path('view_pfeedback/',views.view_pfeedback),
    path('view_complaints/',views.view_complaints),
    path('start_investigation/',views.start_investigation),
    path('view_proccessing/',views.view_proccessing),
    path('finish_investigation/',views.finish_investigation),
    path('view_finished/',views.view_finished),
    path('upload/',views.upload),
    path('view_fir_police/',views.view_fir_police),














    #Lawyer Section
    path('lawyer_register/',views.lawyer_register),
    path('profile_lawyer/',views.profile_lawyer),
    path('edit_profile_lawyer/',views.edit_profile_lawyer),
    path('add_consulting_data/',views.add_consulting_data),
    path('list_request/',views.list_request),
    path('approve_request/',views.approve_request),
    path('reject_request/',views.reject_request),
    path('add_link/',views.add_link),
    path('view_lfeedback/',views.view_lfeedback),
    path('lawyer_homme/',views.lawyer_homme),


]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL,document_root=settings.STATIC_ROOT)
