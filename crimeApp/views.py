from django.shortcuts import render
from .models import *
from django.contrib.auth import logout
from django.http import HttpResponse, HttpResponseRedirect
from django.core.files.storage import FileSystemStorage
import datetime
from django.db.models import Sum
from django.http import JsonResponse
from django.core.mail import send_mail
from django.conf import settings
from django.template.loader import render_to_string
from django.views.decorators.cache import cache_control
from django.utils.datastructures import MultiValueDictKeyError

# Common views
def index(request):
	return render(request,'index.html')

def about_uuus(request):
    return render(request,'about.html')

def contact_uuus(request):
    return render(request,'contact.html')
from django.shortcuts import render, redirect
from .models import Tbl_User, Tbl_Police, Tbl_Lawyer


def login(request):

    if request.method == "POST":

        email = request.POST.get("username")
        password = request.POST.get("password")

        # ================= ADMIN LOGIN =================
        admin = Tbl_User.objects.filter(
            User_Email=email,
            User_Password=password,
            User_Type="Admin"
        ).first()

        # ================= POLICE LOGIN =================
        police = Tbl_Police.objects.filter(
            Plc_Email=email,
            Plc_Password=password,
            Plc_Type="Police"
        ).first()

        # ================= USER LOGIN =================
        user = Tbl_User.objects.filter(
            User_Email=email,
            User_Password=password,
            User_Type="User"
        ).first()

        # ================= LAWYER LOGIN =================
        lawyer = Tbl_Lawyer.objects.filter(
            Lw_Email=email,
            Lw_Pswd=password,
            Lw_Status="Approved"
        ).first()

        # ================= ADMIN =================
        if admin:

            request.session['id'] = admin.id

            return render(
                request,
                'Admin/admin_home.html',
                {
                    'success': 'Successfully Logged In',
                    'name': admin.User_Name
                }
            )

        # ================= POLICE =================
        elif police:

            request.session['id'] = police.id

            return render(
                request,
                'Police/police_home.html',
                {
                    'success': 'Successfully Logged In',
                    'name': police.Plc_Name
                }
            )

        # ================= USER =================
        elif user:

            request.session['id'] = user.id

            return render(
                request,
                'User/user_home.html',
                {
                    'success': 'Successfully Logged In',
                    'name': user.User_Name
                }
            )

        # ================= LAWYER =================
        elif lawyer:

            request.session['id'] = lawyer.id

            return render(
                request,
                'Lawyer/lawyer_home.html',
                {
                    'success': 'Successfully Logged In',
                    'name': lawyer.Lw_Fname,
                    'name2': lawyer.Lw_Lname
                }
            )

        # ================= INVALID LOGIN =================
        else:

            return render(
                request,
                'login.html',
                {
                    'error': 'Invalid Login Credentials!'
                }
            )

    return render(request, 'login.html')

@cache_control(no_cache=True,must_revalidate=True,no_store=True)
def logout(request):
    if request.session.has_key('id'):
        del request.session['id']
        logout(request)
    return HttpResponseRedirect('/')


# ========================================================================================
#                                Admin Section             
# ===========================================================================================

                       
def admin_homme(request):
    ii=request.session['id']
    var=Tbl_User.objects.all().filter(id=ii)
    for x in var:
        name=x.User_Name
    return render(request,'Admin/admin_home.html',{'name':name})

def profile_admin(request):
    ii=request.session['id']
    var=Tbl_User.objects.all().filter(id=ii)
    return render(request,'Admin/profile_admin.html',{'db':var})

def edit_profile_admin(request):
    if request.method=="POST":
        ii=request.session['id']
        name=request.POST["name"]
        email=request.POST["email"]
        password=request.POST["password"]
        phone=request.POST["phone"] 
        a=Tbl_User.objects.all().filter(id=ii).update(User_Name=name,User_Email=email,User_Password=password,User_Phone=phone)
        return HttpResponseRedirect('/profile_admin/')   
    else:
        ii=request.session['id']
        var=Tbl_User.objects.all().filter(id=ii)
        return render(request,'Admin/update_admin_profile.html',{'db':var})


def add_cat(request):
    if request.method=="POST":
        cat=request.POST["cat"]
        var=Tbl_Catagory(Cat_Name=cat)
        var.save()
        return render(request,'Admin/view_catagory.html')
    else:
        return render(request,'Admin/add_catagory.html')


def add_police(request):
    if request.method=="POST":
        name=request.POST["name"]
        phone=request.POST["phone"]
        pincode=request.POST["pincode"]
        countrya=request.POST["countrya"] 
        email=request.POST["email"]
        password=request.POST["password"]
        district=request.POST["district"]


        var=Tbl_Police.objects.all().filter(Plc_Email=email)
        a=Tbl_Police(Plc_Name=name,Plc_District=district,Plc_State=countrya,Plc_Pin=pincode,
                Plc_Type="Police",Plc_Password=password,Plc_Number=phone,Plc_Email=email)
        a.save()
        subject = 'Justice World'   
        message=render_to_string('Admin/email_msg.html', {'user': email,'psw': password,})            
        email_from = settings.EMAIL_HOST_USER 
        recipient_list = [email, ] 
        send_mail( subject, message, email_from, recipient_list )
        text="""<script>alert('Successfully added');window.location='/view_police/';</script> """
        return HttpResponse(text)
    else:
        return render(request,'Admin/add_police.html')
  
   

def view_police(request):
    var=Tbl_Police.objects.all()
    return render(request,'Admin/view_police.html',{'var':var})



    return render(request,'Admin/view_complaints_admin.html',{'var':var})

def all_feeeedback(request):
    var=Tbl_Feedback.objects.all()
    return render(request,'Admin/view_feeeedback.html',{'var':var})
   

def view_cases(request):
    var=Tbl_Complaint.objects.all()
    data=Tbl_Complaint.objects.all().filter(status="Pending")
    data1=Tbl_Complaint.objects.all().filter(status="Investigation Started ")
    data2=Tbl_Complaint.objects.all().filter(status="Investigation Finished")
    data3=Tbl_Complaint.objects.all().filter(status="Report Submitted")



    return render(request,'Admin/view_complaints_admin.html',{'data3':data3,'data':data,'data1':data1,'data2':data2})






def remove_feedback(request):
    if request.session.has_key('id'):
    
        ii=request.GET['id']
        var=Tbl_Feedback.objects.all().filter(id=ii).delete()
        text="""<script>alert('Successfully Deleted');window.location='/all_feeeedback/';</script> """
        return HttpResponse(text)

def list_user(request):
    var=Tbl_User.objects.all().filter(User_Type="User")
    return render(request,'Admin/list_user.html',{'var':var})
@cache_control(no_cache=True,must_revalidate=True,no_store=True)
def delete_police(request):
    if request.session.has_key('id'):
    
        ii=request.GET['id']
        var=Tbl_Police.objects.all().filter(id=ii).delete()
        text="""<script>alert('Successfully Deleted');window.location='/view_police/';</script> """
        return HttpResponse(text)
@cache_control(no_cache=True,must_revalidate=True,no_store=True)
def delete_user(request):
    if request.session.has_key('id'):
    
        ii=request.GET['id']
        var=Tbl_User.objects.all().filter(id=ii).delete()
        text="""<script>alert('Successfully Deleted');window.location='/list_user/';</script> """
        return HttpResponse(text)
@cache_control(no_cache=True,must_revalidate=True,no_store=True)
def view_lawyer(request):
    if request.session.has_key('id'):

        var=Tbl_Lawyer.objects.all().filter(Lw_Status="Pending")
        var1=Tbl_Lawyer.objects.all().filter(Lw_Status="Approved")
        var2=Tbl_Lawyer.objects.all().filter(Lw_Status="Rejected")
        var_count=Tbl_Lawyer.objects.all().filter(Lw_Status="Pending").count()
        var1_count=Tbl_Lawyer.objects.all().filter(Lw_Status="Approved").count()
        var2_count=Tbl_Lawyer.objects.all().filter(Lw_Status="Rejected").count()
        return render(request,'Admin/view_lawyer.html',{'db':var,'db1':var1,'db2':var2,'var_count':var_count,'var1_count':var1_count,'var2_count':var2_count})   

@cache_control(no_cache=True,must_revalidate=True,no_store=True)
def approve_lawyer(request):
    if request.session.has_key('id'):

        ii=request.GET['id']
        var=Tbl_Lawyer.objects.all().filter(id=ii).update(Lw_Status="Approved")
        var1=Tbl_Lawyer.objects.all().filter(id=ii)
        for x in var1:
            email=x.Lw_Email
            psw=x.Lw_Pswd
        subject = 'Justice World'
        message = f'Hi , thank you for registering.you got approval from admin.and your password is :{psw}'
        email_from = settings.EMAIL_HOST_USER 
        recipient_list = [email, ] 
        print("mail sent")
        send_mail( subject, message, email_from, recipient_list )   
        return HttpResponseRedirect('/view_lawyer/')

@cache_control(no_cache=True,must_revalidate=True,no_store=True)
def reject_lawyer(request):
    if request.session.has_key('id'):

        ii=request.GET['id']
        var=Tbl_Lawyer.objects.all().filter(id=ii).update(Lw_Status="Rejected")
        var1=Tbl_Lawyer.objects.all().filter(id=ii)
        for x in var1:
            email=x.Lw_Email
            psw=x.Lw_Pswd
        subject = 'Justice World'
        message = f'Hi ,  you are rejected'
        email_from = settings.EMAIL_HOST_USER 
        recipient_list = [email, ] 
        send_mail( subject, message, email_from, recipient_list )
        return HttpResponseRedirect('/view_lawyer/')


def contact_us(request):
    if request.method=="POST":

        name=request.POST['w3lName']
        email=request.POST['w3lSender']
        message=request.POST['w3lMessage']

        a=Tbl_Feedback(name=name,email=email,message=message)
        a.save()
        text="""<script>alert('Successfully Added');window.location='/contact_uuus/';</script> """
        return HttpResponse(text)

    else:
        return render(request,'contact.html')


# =====================================================================================================
#                                      Police Section
# =====================================================================================================

def register(request):
    return render(request,'register.html')

def police_home(request):
    ii=request.session['id']
    var=Tbl_Police.objects.all().filter(id=ii)
    for x in var:
        name=x.Plc_Name
    return render(request,'Police/police_home.html',{'name':name})
def p_profile(request):
    ii=request.session['id']
    var=Tbl_Police.objects.all().filter(id=ii)
    return render(request,'Police/profile_police.html',{'db':var})

def edit_profile_police(request):
    if request.method=="POST":
        ii=request.session['id']
        email=request.POST["email"]
        password=request.POST["password"]
        phone=request.POST["phone"]
       
        a=Tbl_Police.objects.all().filter(id=ii).update(Plc_Email=email,Plc_Password=password,Plc_Number=phone)
        text="""<script>alert('Successfully Updated');window.location='/p_profile/';</script> """
        return HttpResponse(text)
    else:
        ii=request.session['id']
        var=Tbl_Police.objects.all().filter(id=ii)
        return render(request,'Police/update_police_profile.html',{'db':var})

def upload(request):
    if request.method=="POST":
        ii=request.session['id']
        fir_number=request.POST["fir_number"]
        officer_name=request.POST["officer_name"]
        date_of_fir=request.POST["date_of_fir"]
        station_name=request.POST["station_name"]
        evidence=request.POST["evidence"]
        findings=request.POST["findings"]
        Petitioner_data=request.POST["Petitioner_data"]
        fir=request.FILES['fir']  

        comp_id=request.POST["id_comp"]
        print(" com_id comp_id comp_id::::::::::::::::::::",comp_id)


        c_id=Tbl_Complaint.objects.get(id=comp_id)
        cc_id=Tbl_Complaint.objects.filter(id=comp_id)

        for x in cc_id:
            pet_id=x.user_id.id
        user_id=Tbl_User.objects.get(id=pet_id)

        p_id=Tbl_Police.objects.get(id=ii)
        a=Tbl_FIR(fir_number=fir_number,fir_off_name=officer_name,fir_date=date_of_fir,fir_evidence=evidence,fir_findings=findings,fir_pic=fir,
            user_id=user_id,complaint_id=c_id,police_id=p_id)
        a.save()
        ab=Tbl_Complaint.objects.all().filter(id=comp_id).update(status="Report Submitted")
        text="""<script>alert('Successfully added');window.location='/view_fir_police/';</script> """
        return HttpResponse(text)
    else:
        ii=request.session['id']
        com_id=request.GET['id']
        var=Tbl_Police.objects.all().filter(id=ii)
        var1=Tbl_Complaint.objects.all().filter(id=com_id)

        return render(request,'Police/upload.html',{'var':var,'com_id':com_id,'var1':var1})
def view_fir_police(request):
    ii=request.session['id']
    var=Tbl_FIR.objects.all().filter(police_id=ii)
    return render(request,'Police/view_fir.html',{'var':var})


def view_pfeedback(request):
    ii=request.session['id']
    var=Tbl_Feedback.objects.all().filter(police_id=ii)
    return render(request,'Police/view.html',{'var':var})


def view_complaints(request):
    ii=request.session['id']
    var=Tbl_Complaint.objects.all().filter(police_id=ii,status="Pending")
    return render(request,'Police/view_complaints_police.html',{'db':var})


def start_investigation(request):
    if request.session.has_key('id'):

        ii=request.GET['id']
        var=Tbl_Complaint.objects.all().filter(id=ii).update(status="Investigation Started")
        return HttpResponseRedirect('/view_proccessing/')


def view_proccessing(request):
    ii=request.session['id']
    var=Tbl_Complaint.objects.all().filter(police_id=ii,status="Investigation Started")
    return render(request,'Police/view_processing.html',{'db':var})
def finish_investigation(request):
    if request.session.has_key('id'):

        ii=request.GET['id']
        var=Tbl_Complaint.objects.all().filter(id=ii).update(status="Investigation Finished")
        return HttpResponseRedirect('/view_finished/')

        # return render(request,'Police/view_finished.html',{'db':var})

def view_finished(request):
    ii=request.session['id']
    var=Tbl_Complaint.objects.all().filter(police_id=ii,status="Investigation Finished")
    return render(request,'Police/view_finished.html',{'db':var})



# =====================================================================================================
#                                     Lawyer Section
# =====================================================================================================


def lawyer_register(request):
    if request.method=="POST":
        fname=request.POST["fname"]
        lname=request.POST["lname"]
        phone=request.POST["phone"]
        pincode=request.POST["pincode"] 
        email=request.POST["email"]
        password=request.POST["password"]
        address=request.POST["address"]
        countrya=request.POST["countrya"]
        district=request.POST["district"]
        Enrollment_number=request.POST["Enrollment_number"]
        idproof_type=request.POST["idproof_type"]
        proofnumber=request.POST["proofnumber"]
        image=request.FILES["image"]
        a=Tbl_Lawyer(Lw_Lname=lname,Lw_Fname=fname,Lw_Status="Pending",
              Lw_Phone= phone,Lw_Pin=pincode, Lw_Email=email,Lw_Pswd=password,
              Lw_Address=address,Lw_State=countrya,Lw_District=district,Lw_Proof=idproof_type,
              Lw_ProofNo=proofnumber,Lw_EnrollNo=Enrollment_number,Lw_Image=image)
        a.save()
        text="""<script>alert('Registered Succesfully');window.location='/lawyer_register/';</script> """
        return HttpResponse(text)
    else:
        return render(request,'lawyer_registration.html')


def profile_lawyer(request):
    ii=request.session['id']
    var=Tbl_Lawyer.objects.all().filter(id=ii)
    return render(request,'Lawyer/profile_lawyer.html',{'db':var})

                      


def edit_profile_lawyer(request):
    if request.method=="POST":
        ii=request.session['id']
        name=request.POST["name"]
        email=request.POST["email"]
        address=request.POST["address"]
        User_State=request.POST["User_State"]
        User_District=request.POST["User_District"]
        pincode=request.POST["pincode"]
        password=request.POST["password"]
        phone=request.POST["phone"]
        fees=request.POST["fees"]
        # time=request.POST["time"]
        catagory=request.POST["catagory"]

        a=Tbl_Lawyer.objects.all().filter(id=ii).update(Lw_Fname=name,Lw_Email=email,Lw_Address=address,
            Lw_State=User_State,Lw_District=User_District,Lw_Pin=pincode,
            Lw_Pswd=password,Lw_Phone=phone,Lw_Fees=fees,Lw_Catgry=catagory)
        text="""<script>alert('Successfully Updated');window.location='/profile_lawyer/';</script> """
        return HttpResponse(text)
    else:
        ii=request.session['id']
        var=Tbl_Lawyer.objects.all().filter(id=ii)
        return render(request,'Lawyer/update_lawyer_profile.html',{'db':var})

def add_consulting_data(request):
    if request.method=="POST":
        ii=request.session['id']
        Lw_Fees=request.POST["Lw_Fees"]
        # Lw_Time=request.POST["Lw_Time"]
        Lw_Catgry=request.POST["Lw_Catgry"]

        var=Tbl_Lawyer.objects.all().filter(id=ii).update(Lw_Fees=Lw_Fees,Lw_Catgry=Lw_Catgry)
        text="""<script>alert('Successfully Added');window.location='/profile_lawyer/';</script> """
        return HttpResponse(text)
    else:
        return render(request,'Lawyer/consulting.html')

def list_request(request):
    ii=request.session['id']
    lawyer_data=Tbl_Booking.objects.all().filter(lawyer_id=ii,status="Requested")
    lawyer_data1=Tbl_Booking.objects.all().filter(lawyer_id=ii,status="Approved")
    lawyer_data2=Tbl_Booking.objects.all().filter(lawyer_id=ii,status="Rejected")


    return render(request,'Lawyer/list_request.html',{'lawyer_data':lawyer_data,'lawyer_data1':lawyer_data1,'lawyer_data2':lawyer_data2})

def approve_request(request):
    if request.session.has_key('id'):

        ii=request.GET['id']
        var=Tbl_Booking.objects.all().filter(id=ii).update(status="Approved")
        # var1=Tbl_Lawyer.objects.all().filter(id=ii)
        # for x in var1:
        #     email=x.Lw_Email
        #     psw=x.Lw_Pswd
        # subject = 'Justice World'
        # message = f'Hi , thank you for your booking.Your booking details are '
        # email_from = settings.EMAIL_HOST_USER 
        # recipient_list = [email, ] 
        # send_mail( subject, message, email_from, recipient_list )   
        return HttpResponseRedirect('/list_request/')

@cache_control(no_cache=True,must_revalidate=True,no_store=True)
def reject_request(request):
    if request.session.has_key('id'):
        ii=request.GET['id']
        var=Tbl_Booking.objects.all().filter(id=ii).update(status="Rejected")
        # var1=Tbl_Lawyer.objects.all().filter(id=ii)
        # for x in var1:
        #     email=x.Lw_Email
        #     psw=x.Lw_Pswd
        # subject = 'Justice World'
        # message = f'Hi ,  you are rejected'
        # email_from = settings.EMAIL_HOST_USER 
        # recipient_list = [email, ] 
        # send_mail( subject, message, email_from, recipient_list )
        return HttpResponseRedirect('/list_request/')

def view_lfeedback(request):
    ii=request.session['id']
    var=Tbl_Feedback.objects.all().filter(lawyer_id=ii)
    return render(request,'Lawyer/view.html',{'var':var})






@cache_control(no_cache=True,must_revalidate=True,no_store=True)
def add_link(request):
    if request.session.has_key('id'):
        if request.method=="POST":

    
            idd = request.POST["idd"]
            linkk=request.POST["link"]
            fromform=Tbl_Booking.objects.all().filter(id=idd).update(link=linkk)

            return HttpResponseRedirect('/list_request/')
        else:
            idd=request.GET["id"]
            return render(request,'Lawyer/add_link.html',{'idd':idd})

def lawyer_homme(request):
    ii=request.session['id']
    var=Tbl_Lawyer.objects.all().filter(id=ii)
    for x in var:
        name=x.Lw_Fname
        name2=x.Lw_Lname

    return render(request,'Lawyer/lawyer_home.html',{'name':name,'name2':name2})
# ===================================================================================================
#                                             user section
# =======================================================================================================


def user_home(request):
    ii=request.session['id']
    var=Tbl_User.objects.all().filter(id=ii)
    for x in var:
        name=x.User_Name
    return render(request,'User/user_home.html',{'name':name})
        
def user_register(request):
    if request.method=="POST":
        User_Name=request.POST["User_Name"]
        User_Password=request.POST["User_Password"]
        User_Email=request.POST["User_Email"]
        User_Address=request.POST["User_Address"] 
        User_District=request.POST["User_District"]
        User_PIN=request.POST["User_PIN"]

        User_Phone=request.POST["User_Phone"]
        User_Proof=request.POST["User_Proof"]
        User_Proof_Number=request.POST["User_Proof_Number"]
        User_State=request.POST["User_State"]

        image=request.FILES["User_Image"]


        var=Tbl_User.objects.all().filter(User_Email=User_Email)
        a=Tbl_User(User_Name=User_Name,User_Password=User_Password,
              User_Email=User_Email, User_Address=User_Address, User_District=User_District,
              User_Phone=User_Phone,User_PIN=User_PIN,User_Proof=User_Proof,User_Proof_Number=User_Proof_Number,
              User_Image=image,User_State=User_State,User_Type="User")
        a.save()
        text="""<script>alert('Registered Succesfully');window.location='/user_register/';</script> """
        return HttpResponse(text)
    else:
        return render(request,'user_registration.html')
                       
    
def profile_user(request):
    ii=request.session['id']
    var=Tbl_User.objects.all().filter(id=ii)
    return render(request,'User/profile_user.html',{'db':var})

def edit_profile_user(request):
    if request.method=="POST":
        ii=request.session['id']
        name=request.POST["name"]
        email=request.POST["email"]
        address=request.POST["address"]
        User_State=request.POST["User_State"]
        User_District=request.POST["User_District"]
        pincode=request.POST["pincode"]
        password=request.POST["password"]
        phone=request.POST["phone"] 
        a=Tbl_User.objects.all().filter(id=ii).update(User_Name=name,User_Email=email,User_Address=address,
            User_State=User_State,User_District=User_District,User_PIN=pincode,
            User_Password=password,User_Phone=phone)
        text="""<script>alert('Successfully Updated');window.location='/profile_user/';</script> """
        return HttpResponse(text)
    else:
        ii=request.session['id']
        var=Tbl_User.objects.all().filter(id=ii)
        return render(request,'User/update_user_profile.html',{'db':var})



@cache_control(no_cache=True,must_revalidate=True,no_store=True)
def list_lawyer(request):
    if request.session.has_key('id'):
        var1=Tbl_Lawyer.objects.all().filter(Lw_Status="Approved")
        print("44444444444444",var1)
        return render(request,'User/view_lawyer.html',{'db1':var1})   



from django.shortcuts import render
from django.http import HttpResponse
from .models import *
from datetime import date


def add_complaint(request):

    if request.method == "POST":

        ii = request.session['id']

        police_station_name = request.POST["police_station_name"]

        police_data = Tbl_Police.objects.filter(
            Plc_Name=police_station_name
        ).first()

        petitioner_name = request.POST["petitioner_name"]
        petitioner_id = request.POST["petitioner_id"]
        petitioner_id_no = request.POST["petitioner_id_no"]
        petitioner_phone = request.POST["petitioner_phone"]
        petitioner_email = request.POST["petitioner_email"]
        petitioner_address = request.POST["petitioner_address"]

        subject = request.POST["subject"]
        description = request.POST["description"]

        pic_complaint = request.FILES["pic_complaint"]

        petitioner_district = request.POST["petitioner_district"]
        petitioner_state = request.POST["petitioner_state"]
        petitioner_pin = request.POST["petitioner_pin"]

        today = date.today()

        user_id = Tbl_User.objects.get(id=ii)

        p_idd = Tbl_Police.objects.get(id=police_data.id)

        complaint = Tbl_Complaint(

            police_id=p_idd,

            user_id=user_id,

            police_station_name=police_station_name,

            petitioner_name=petitioner_name,

            petitioner_id=petitioner_id,

            petitioner_id_no=petitioner_id_no,

            petitioner_phone=petitioner_phone,

            petitioner_email=petitioner_email,

            petitioner_address=petitioner_address,

            date_of_issue=today,

            subject=subject,

            description=description,

            pic_complaint=pic_complaint,

            petitioner_state=petitioner_state,

            petitioner_district=petitioner_district,

            petitioner_pin=petitioner_pin,

            status="Pending"

        )

        complaint.save()

        text = """
        <script>
            alert('Successfully Added');
            window.location='/view_complaint/';
        </script>
        """

        return HttpResponse(text)

    else:

        var = Tbl_Police.objects.all()

        return render(
            request,
            'User/add_complaint.html',
            {'var': var}
        )

def view_fir(request):
    ii=request.session['id']
    var=Tbl_FIR.objects.all().filter(user_id=ii)
    return render(request,'User/view_fir.html',{'var':var})

def view_complaint(request):
    ii=request.session['id']
    data=Tbl_Complaint.objects.all().filter(user_id=ii,status="Pending")
    data1=Tbl_Complaint.objects.all().filter(user_id=ii,status="Investigation Started ")
    data2=Tbl_Complaint.objects.all().filter(user_id=ii,status="Investigation Finished")
    data3=Tbl_Complaint.objects.all().filter(user_id=ii,status="Report Submitted")



    return render(request,'User/view_complaint.html',{'data3':data3,'data':data,'data1':data1,'data2':data2})

def view_station(request):
    data=Tbl_Police.objects.all()
    return render(request,'User/view_police.html',{'data':data})




def book_lawyer(request):
    if request.method=="POST":
        ii=request.session['id']
        lawyer_id=request.POST['lawyer_id']
        user_id=Tbl_User.objects.get(id=ii)
        law_id=Tbl_Lawyer.objects.get(id=lawyer_id)

       
        time=request.POST["time"]
        booking_date=request.POST["date"]

        from datetime import date
        today = date.today()
        print("Today date is: ", today)

        a=Tbl_Booking(user_id=user_id,lawyer_id=law_id,date=booking_date,time=time,apply_date=today,status="Requested")
        a.save()
        text="""<script>alert('Successfully Booked');window.location='/view_booking_details/';</script> """
        return HttpResponse(text)
    else:
        law_idd=request.GET['id']
        return render(request,'User/book_lawyer.html',{'law_idd':law_idd})



def view_booking_details(request):
    ii=request.session['id']
    var=Tbl_Booking.objects.all().filter(user_id=ii,status="Requested")
    var1=Tbl_Booking.objects.all().filter(user_id=ii,status="Approved")
    var2=Tbl_Booking.objects.all().filter(user_id=ii,status="Rejected")


    return render(request,'User/view_booking.html',{'var':var,'var1':var1,'var2':var2})


def feedback(request):
    return render(request,'User/feedback.html')
   
def feedback_police(request):
    if request.method=="POST":

        ii=request.session['id']
        name=request.POST['name']
        email=request.POST['email']
        message=request.POST['message']
        station_name=request.POST['station_name']
        user_id=Tbl_User.objects.get(id=ii)
        da=Tbl_Police.objects.all().filter(Plc_Name=station_name)
        for x in da:
            p_id=x.id
        police_id=Tbl_Police.objects.get(id=p_id)
        a=Tbl_Feedback(name=name,email=email,message=message,station_name=station_name,user_id=user_id,police_id=police_id)
        a.save()
        text="""<script>alert('Successfully Added');window.location='/feedback/';</script> """
        return HttpResponse(text)

    else:
        ii=request.session['id']
        var1=Tbl_User.objects.all().filter(id=ii)
        var=Tbl_Police.objects.all()
        return render(request,'User/feedback_police.html',{'var':var,'var1':var1})




def feedback_lawyer(request):
    if request.method=="POST":

        ii=request.session['id']
        name=request.POST['name']
        email=request.POST['email']
        message=request.POST['message']
        lawyer_name=request.POST['lawyer_name']
        user_id=Tbl_User.objects.get(id=ii)
        da=Tbl_Lawyer.objects.all().filter(Lw_Fname=lawyer_name)
        for x in da:
            p_id=x.id
        police_id=Tbl_Lawyer.objects.get(id=p_id)

        a=Tbl_Feedback(name=name,email=email,message=message,lawyer_name=lawyer_name,user_id=user_id,lawyer_id=police_id)
        a.save()
        text="""<script>alert('Successfully Added');window.location='/feedback/';</script> """
        return HttpResponse(text)

    else:
        ii=request.session['id']
        var1=Tbl_User.objects.all().filter(id=ii)
        var=Tbl_Lawyer.objects.all().filter(Lw_Status="Approved")
        return render(request,'User/feedback_lawyer.html',{'var':var,'var1':var1})

