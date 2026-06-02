from django.db import models

# Create your models here.
# Create your models here.
class Tbl_User(models.Model):
	User_Name    				=models.CharField(max_length=300,default='')
	User_Password				=models.CharField(max_length=50,default='')
	User_Email					=models.CharField(max_length=300,default='')
	User_Address				=models.CharField(max_length=300,default='')
	User_District				=models.CharField(max_length=20,default='')
	User_Phone					=models.CharField(max_length=20,default='')
	User_Type					=models.CharField(max_length=20,default='')
	User_PIN					=models.CharField(max_length=20,default='')
	User_Proof					=models.CharField(max_length=20,default='')
	User_Proof_Number			=models.CharField(max_length=20,default='')
	User_State					=models.CharField(max_length=20,default='')
	User_District				=models.CharField(max_length=20,default='')
	User_Image                  =models.ImageField(upload_to = 'user/',default='')






class Tbl_Police(models.Model):
	Plc_Name    				=models.CharField(max_length=300,default='')
	Plc_District    			=models.CharField(max_length=300,default='')
	Plc_State    				=models.CharField(max_length=300,default='')
	Plc_Pin    					=models.CharField(max_length=300,default='')
	Plc_Number    				=models.CharField(max_length=300,default='')
	Plc_Email    				=models.CharField(max_length=300,default='')
	Plc_Password    			=models.CharField(max_length=300,default='')
	Plc_Type    				=models.CharField(max_length=300,default='')
	Plc_Image                  	=models.ImageField(upload_to = 'images/')

						

class Tbl_Catagory(models.Model):
	Cat_Name    				=models.CharField(max_length=300,default='')
	
class Tbl_Lawyer(models.Model):
	Lw_Fname    				=models.CharField(max_length=300,default='')
	Lw_Lname    				=models.CharField(max_length=300,default='')
	Lw_Image                  	=models.ImageField(upload_to = 'lawyer/')
	Lw_Phone    				=models.CharField(max_length=300,default='')
	Lw_Pin    					=models.CharField(max_length=300,default='')
	Lw_Email    				=models.CharField(max_length=300,default='')
	Lw_Pswd    					=models.CharField(max_length=300,default='')
	Lw_Address    				=models.CharField(max_length=300,default='')
	Lw_State    				=models.CharField(max_length=300,default='')
	Lw_District    				=models.CharField(max_length=300,default='')
	Lw_Proof    				=models.CharField(max_length=300,default='')
	Lw_ProofNo    				=models.CharField(max_length=300,default='')
	Lw_Status    				=models.CharField(max_length=300,default='')
	Lw_EnrollNo    				=models.CharField(max_length=300,default='')

	Lw_Fees    					=models.CharField(max_length=300,default='')
	Lw_Time    					=models.CharField(max_length=300,default='')
	Lw_Catgry    				=models.CharField(max_length=300,default='')





class Tbl_Complaint(models.Model):
	police_id					=models.ForeignKey(Tbl_Police,on_delete=models.CASCADE)
	user_id 					=models.ForeignKey(Tbl_User,on_delete=models.CASCADE)
	police_station_name			=models.CharField(max_length=300,default='')
	petitioner_name				=models.CharField(max_length=300,default='')
	petitioner_id				=models.CharField(max_length=300,default='')
	petitioner_id_no			=models.CharField(max_length=300,default='')
	petitioner_phone			=models.CharField(max_length=300,default='')
	petitioner_email			=models.CharField(max_length=300,default='')
	petitioner_address			=models.CharField(max_length=300,default='')
	date_of_issue				=models.CharField(max_length=300,default='')
	subject						=models.CharField(max_length=300,default='')
	description					=models.CharField(max_length=300,default='')
	pic_complaint               =models.ImageField(upload_to = 'complaint/')
	petitioner_state			=models.CharField(max_length=300,default='')
	petitioner_district			=models.CharField(max_length=300,default='')
	petitioner_pin				=models.CharField(max_length=300,default='')
	status						=models.CharField(max_length=300,default='')





class Tbl_Booking(models.Model):
	user_id				=models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True, null=True)
	lawyer_id			=models.ForeignKey(Tbl_Lawyer,on_delete=models.CASCADE, blank=True, null=True)
	date				=models.CharField(max_length=30,default='')
	time				=models.CharField(max_length=30,default='')
	status				=models.CharField(max_length=30,default='')
	link				=models.CharField(max_length=300,default='')
	apply_date			=models.CharField(max_length=30,default='')

	
class Tbl_Feedback(models.Model):
	user_id				=models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True, null=True)
	lawyer_id			=models.ForeignKey(Tbl_Lawyer,on_delete=models.CASCADE, blank=True, null=True)
	police_id			=models.ForeignKey(Tbl_Police,on_delete=models.CASCADE, blank=True, null=True)

	
	name			=models.CharField(max_length=30,default='')
	email			=models.CharField(max_length=30,default='')
	message			=models.CharField(max_length=30,default='')
	station_name	=models.CharField(max_length=30,default='')
	lawyer_name		=models.CharField(max_length=30,default='')
	user_name		=models.CharField(max_length=30,default='')



class Tbl_FIR(models.Model):
	user_id				=models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True, null=True)
	complaint_id		=models.ForeignKey(Tbl_Complaint,on_delete=models.CASCADE, blank=True, null=True)
	police_id			=models.ForeignKey(Tbl_Police,on_delete=models.CASCADE, blank=True, null=True)
	fir_number			=models.CharField(max_length=30,default='')
	fir_off_name		=models.CharField(max_length=30,default='')
	fir_date			=models.CharField(max_length=30,default='')
	fir_evidence		=models.CharField(max_length=300,default='')
	fir_findings		=models.CharField(max_length=300,default='')
	fir_pic              =models.ImageField(upload_to = 'FIR/')






	







	