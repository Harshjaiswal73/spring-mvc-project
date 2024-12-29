package kss.Eprogrammer.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kss.Eprogrammer.modules.Cryptography;
import kss.Eprogrammer.modules.DBManager;
import kss.Eprogrammer.modules.Maler;
import kss.Eprogrammer.modules.StudentMaster;

@Controller
public class HomeController {
    String result=null;
	@RequestMapping(value="/")
	public String test(Model md){
		// TO Display dynamic update
		DBManager dm=new DBManager();
		String cmd="select newsmsg from newsmaster order by newsid desc limit 3";
		ResultSet rs=dm.executeSelect(cmd);
		md.addAttribute("noti",rs);
		
		return "index";
	}
	@RequestMapping(value="/dev")
	public String opendeveloper()
	{
		return"developer";
	}
	@RequestMapping(value="/vision&mission")
	public String openVision()
	{
		return "vision&mission";
	}
	@RequestMapping(value="/cont")
	public String opencontactus()
	{
		return "contactus";
	}
	@RequestMapping(value="/log")
	public String openlogin()
	{
		return "Login";
	}
	@RequestMapping(value="/res")
	public String openres()
	{
		return "Registration";
	}
	@RequestMapping(value="/benifit")
	public String openbenifit()
	{
		return"Benifits";
	}
	
	@RequestMapping(value="/Stu")
	public String openStu()
	{
		return "Student";
	}
	@RequestMapping(value="/processLogin",method=RequestMethod.POST)
	public String checkLogin(@RequestParam String UserType,
			@RequestParam String UserId,@RequestParam String Pass,Model md,HttpSession ses)
	{
		Cryptography cg=new Cryptography();
		String epass=cg.encryptMyPassword(Pass);
		String cmd="Select *from loginmaster where email_id ='"+UserId+"'and Pass='"
		+epass+"'and utype='"+UserType+"'";
	    DBManager dm=new DBManager();
		ResultSet rs=dm.executeSelect(cmd);
		try {
			if(rs.next()==true)
			{
				// create session and transfer into specific Zone
				if(UserType.equals("STUDENT")==true)
				{
					// transfer into user Zone
					ses.setAttribute("uid",UserId);
					return "redirect:dashboard";
				}
				else
				{
					// Transfer into admin Zone
					ses.setAttribute("aid",UserId);
					return "redirect:admin/welcome";
				}
			}
			else
				result="Invalid UserId or Password";
				
		} catch (Exception e) {
			// TODO: handle exception
			result="Sorry! unable to process your request.";
			System.out.println("Error:"+result);
		}
		md.addAttribute("msg",result);
		return "Login";
	}
	
	// save registration form code
	@RequestMapping(value="/SaveRegsi",method=RequestMethod.POST)
	public String saveNewUser(@RequestParam("Stupic") CommonsMultipartFile Stupic,Model md,@RequestParam String pass,@RequestParam String Comfpass,@RequestParam String CaptchaCode,@ModelAttribute StudentMaster sm,HttpSession ses)
	{

		String code=ses.getAttribute("CaptchaCode").toString();
		if(CaptchaCode.equals(code)==true)
		{
			if(pass.equals(Comfpass)==true)
			{
				
				//uploading selected file
				long fsize=Stupic.getSize();
				if(fsize>0)
				{
				String fname=Stupic.getOriginalFilename();
				String ext=fname.substring(fname.indexOf('.')).toUpperCase();
				if(ext.equals(".JPG") || ext.equals(".JPEG") || ext.equals(".PNG"))
				{
					try
					{
						// save file in a folder
						String FolderPath=ses.getServletContext().getRealPath("/")+"resources/userpics";
						byte[]fileBytes=Stupic.getBytes();
						FileOutputStream fos=new FileOutputStream(FolderPath+"/"+fname);
						fos.write(fileBytes);
						fos.close();
						//setting file name in table
						sm.setPicFileName(code);
						//Start:DB Code
						String cmd="insert into studentmaster(email_id,name,gender,college,course,year,dob,pic_filename,mobileno,address) values('"+
						sm.getEmailId()+"','"+sm.getName()+"','"+sm.getGender()+"','"+sm.getClgName()+"','"+sm.getCourse()+"','"
						+sm.getCourseyear()+"','"+sm.getDOB()+"','"+fname+"','"+sm.getMobileNo()+"','"+sm.getAddress()+"')";
						DBManager dm=new DBManager();
						boolean res=dm.executeInsertUpdateOrDelete(cmd);
						if(res==true)
						{
						// Start: setting login details
						  Cryptography cg=new Cryptography();
						  String epass=cg.encryptMyPassword(pass);
						  cmd="Insert into loginmaster values('"+sm.getEmailId()+"','"+epass+"','STUDENT')";
						  res=dm.executeInsertUpdateOrDelete(cmd);
						// End: setting login details
						result=res==true?"Congratulations you are registered successfully.":
							"Sorry! unable to create your account.";
						//End:Db code
					   }
						
					   else
					     {
						result="sorry! Unable to create your account.";
					     }
					}
					catch(Exception e){
						result="sorry! unable to create your account.please try again.";
						System.out.println("Error:"+e.getMessage());
					}
				}
				else 
					result="Invalid file type.Please choose an image.";
			}
			else
				result="Password and Confirm password must be same.";
		}
		else
			result="Invalid Captcha code. Please Try again.";
		
		}
		md.addAttribute("msg",result);
		System.out.print(result);
		return "Student";
	}
	@RequestMapping(value="/SaveEnquiry")
	public String saveEnq(@RequestParam String Name,String EmailId,String MobileNo,@RequestParam String Query,Model md)
	{
		String MyCommand="insert into enquirymaster(name,emailid,mobileno,"+"message)values('"+Name+"','"+EmailId+"','"+MobileNo+"','"+Query+"')";
		DBManager dm = new DBManager();
		boolean res= dm.executeInsertUpdateOrDelete(MyCommand);
		result=res==true?"Your enquiry saved successfully":
			"sorry! unable to save your enquiry";
		md.addAttribute("msg",result);
		//Sending email alert
		String mailmsg="Hi"+Name+",\n\nThanks for your enquiry."+"our team will contact you shortly.\n\n\nFrom-\nTeam E-programmer";
		Maler ml =new Maler();
		ml.sendMyEmail(EmailId,"Thank you for Enquiry",mailmsg);
		return "redirect:/";
	}
}