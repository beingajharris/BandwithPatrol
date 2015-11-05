HOME=;
import os
import pickle
class FromTo:
	def __init__(self,frm,to,day):
		self.frm=frm;
		self.to=to;
		self.refresh_day=day;
def Settime():
	from_time=int(raw_input("Enter the starting hour of free usage(eg :130 for 1:30 am) : \n"))
	to_time=int(raw_input("Enter the ending hour of free usage(eg :130 for 1:30 am) : \n"))
	day=int(raw_input("Enter the day of month in which the values has to be refreshed : \n"))
	fp=open(HOME+"/.usage/Freetime","w");
	freetime=FromTo(from_time,to_time,day)
	os.system("bash Resetcron "+str(day));	
	pickle.dump(freetime,fp)
	fp.close()
Settime();
