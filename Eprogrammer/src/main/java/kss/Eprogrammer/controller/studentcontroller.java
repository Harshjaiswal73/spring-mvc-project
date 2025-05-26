package kss.Eprogrammer.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.mysql.cj.protocol.Resultset;

import kss.Eprogrammer.modules.Cryptography;
import kss.Eprogrammer.modules.DBManager;
import kss.Eprogrammer.modules.StudentMaster;

@Controller
public class studentcontroller 
{
	DBManager dm=new DBManager();
	String CommandText=null;
	String Result="",uid=null;
	String [] getCurrentUserDetails()
	{
		String uid;
		// Reading userid of current user from session.....
		ServletRequestAttributes attr= (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpSession ses=attr.getRequest().getSession();
		uid=ses.getAttribute("uid").toString();
		CommandText="Select name,pic_filename from studentmaster where email_id='"+uid+"'";
		ResultSet rs=dm.executeSelect(CommandText);
		String [] arr=new String[2];
		try {
			rs.next();
			arr[0]=rs.getString("name");
			arr[1]=rs.getString("pic_filename");
			System.out.println(arr[0]);
			System.out.println(arr[1]);
			
			} catch (Exception e) {
			// TODO: handle exception
				System.out.println("Error:"+e.getMessage());
		}
		
		return arr;
	}
    @RequestMapping(value="/dashboard")
    public String opendashboard(Model md,HttpSession ses)
    {
    	//add below 3 lines in all service request methods
    	if(ses.getAttribute("uid")==null)
    		return "redirect:/log";
    	String [] arr=getCurrentUserDetails();
    	md.addAttribute("uname",arr[0]);
    	md.addAttribute("picname",arr[1]);
    	System.out.print("username : "+arr[0]+" picname : "+arr[1] );
    	return "studentZone/dashboard";
    }
    @RequestMapping(value="/feedback")
    public String openfeedback(Model md,HttpSession ses)
    {
    	//add below 3 lines in all service request methods
    	if(ses.getAttribute("uid")==null)
    		return "redirect:/log";
    	String [] arr=getCurrentUserDetails();
    	md.addAttribute("uname",arr[0]);
    	md.addAttribute("picname",arr[1]);
    	return "studentZone/feedback";
    }
    
    @RequestMapping(value="/changepass")
    public String openChangepass(HttpSession ses,Model md)
    {
    	//add below 3 lines in all service request methods
    	if(ses.getAttribute("uid")==null)
    		return "redirect:/log";
    	String [] arr=getCurrentUserDetails();
    	md.addAttribute("uname",arr[0]);
    	md.addAttribute("picname",arr[1]);
        System.out.print(arr[0]);
    	return "studentZone/changepassword";
    }
    
    @RequestMapping(value="/UpdatePass",method=RequestMethod.POST)
    public String updateNewPass(@RequestParam String Curpass,@RequestParam String Newpass,
    		@RequestParam String Confpass,HttpSession ses,Model md)
    {
    	//add below 3 lines in all service request methods
    	if(ses.getAttribute("uid")==null)
    		return "redirect:/log";
    	String [] arr=getCurrentUserDetails();
    	md.addAttribute("uname",arr[0]);
    	md.addAttribute("picname",arr[1]);

        if(Newpass.equals(Confpass)==true)
        {
    	   Cryptography cg=new Cryptography();
    	   String epass=cg.encryptMyPassword(Curpass);
    	   // reading id of current user from session
    	    uid=ses.getAttribute("uid").toString();
    	    CommandText="Select *from loginmaster Where email_id='"+uid+"'and Pass='"+epass+"'";
    	   // System.out.print(CommandText);
         try {
        	 ResultSet rs=dm.executeSelect(CommandText);
        	 if(rs.next()==true)
        	 {
        		 epass=cg.encryptMyPassword(Newpass);
        		 CommandText="Update loginmaster set Pass='"+epass+"'Where email_id='"+uid+"'";
        		 boolean r = dm.executeInsertUpdateOrDelete(CommandText);
        		 if(r==true)
        			 Result="Your password updated successfull.";
        		 else
        			 Result="Sorry! unable to update your password.";
        	 }
        		 else {
        			 Result="Invalid current password.Please try again.";
        	 }
		} 
         catch (Exception e) {
			System.out.println("Error:"+e.getMessage());
			Result="Sorry! unable to update your password.";
		}
        }
        else
        	Result="New password and confirm password must be same.";
        md.addAttribute("msg",Result);
    	return "studentZone/changepassword";
    }
    @RequestMapping(value="/profile")
    public String openprofile(HttpSession ses,Model md)
    {
    	//add below 3 lines in all service request methods
    	if(ses.getAttribute("uid")==null)
    		return "redirect:/log";
    	String [] arr=getCurrentUserDetails();
    	md.addAttribute("uname",arr[0]);
    	md.addAttribute("picname",arr[1]);
    	ResultSet rs=showProfile(ses);
    	md.addAttribute("udata",rs);
    	return "studentZone/profile";
    }
    @RequestMapping(value="/saveprof",method=RequestMethod.POST)
    public String saveprofile(HttpSession ses
    		,Model md,@ModelAttribute StudentMaster sm,@RequestParam CommonsMultipartFile userpics)
    {
    	//add below 3 lines in all service request methods
    	if(ses.getAttribute("uid")==null)
    		
    		
    		return "redirect:/log";
    	// to upload pic
    	try {
    		long fsize=userpics.getSize();
			if(fsize>0)
			{
			String fname=userpics.getOriginalFilename();
			String ext=fname.substring(fname.indexOf('.')).toUpperCase();
			if(ext.equals(".JPG") || ext.equals(".JPEG") || ext.equals(".PNG"))
			{
				//Save file in the folder
				// save file in a folder
				String FolderPath=ses.getServletContext().getRealPath("/")+"resources/userpics";
				byte[]fileBytes=userpics.getBytes();
				FileOutputStream fos=new FileOutputStream(FolderPath+"/"+fname);
				fos.write(fileBytes);
				fos.close();
				//setting file name in table
				sm.setPicFileName(fname);
			}
			else
			{
				Result="please choose a valid image file for your picture.";
			}
			}
		} 
			catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error:"+e.getMessage());
			Result="Sorry! unable to update your profile.";
		}
		try {
			// update in database
			uid=ses.getAttribute("uid").toString();
			if(sm.getPicFileName()==null)
				CommandText="Update studentmaster set name='"
			+sm.getName()+"',gender='"+sm.getGender()
			+"',course='"+sm.getCourse()+"',year='"+sm.getCourseyear()
			+"',dob='"+sm.getDOB()+"',mobileno='"+sm.getMobileNo()+"',address='"+sm.getAddress()+"'where email_id='"+uid+"'";
			else
				CommandText="update studentmaster set name='"+sm.getName()+"',gender='"+sm.getGender()
				+"',course='"+sm.getCourse()+"',year='"+sm.getCourseyear()
				+"',dob='"+sm.getDOB()+"',mobileno='"+sm.getMobileNo()+"',address='"+sm.getAddress()+"',pic_filename='"+sm.getPicFileName()+"' where email_id='"+uid+"'";
			boolean b=dm.executeInsertUpdateOrDelete(CommandText);
			System.out.println(CommandText);
			Result=b==true?"Your profile update succesfully.":"sorry! unable to update your profile.";
			
		} 
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error:"+e.getMessage());
			Result="Sorry! unable to update your profile.";
		}
		String [] arr=getCurrentUserDetails();
    	md.addAttribute("uname",arr[0]);
    	md.addAttribute("picname",arr[1]);
		md.addAttribute("msg",Result);
		ResultSet rs = showProfile(ses);
		md.addAttribute("udata",rs);
    	return "studentZone/profile";
    }
    ResultSet showProfile(HttpSession s)
    {
    	CommandText="Select * from studentmaster where email_id='"+s.getAttribute("uid")+"'";
    	ResultSet rs = dm.executeSelect(CommandText);
    	return  rs;
    }
    @RequestMapping(value="/upload")
    public String openupload(HttpSession ses,Model md)
    {
    	//add below 3 lines in all service request methods
    	if(ses.getAttribute("uid")==null)
    		return "redirect:/log";
    	String [] arr=getCurrentUserDetails();
    	md.addAttribute("uname",arr[0]);
    	md.addAttribute("picname",arr[1]);
    	return "studentZone/upload";
    }
    @RequestMapping(value="/uploadfile",method=RequestMethod.POST)
    public String openuploadfile(HttpSession ses,Model md,
    		@RequestParam CommonsMultipartFile upload,
    		@RequestParam String Title,@RequestParam String description)
    {
    	//add below 3 lines in all service request methods
    	if(ses.getAttribute("uid")==null)
    		return "redirect:/log";
    	String submittedBy=ses.getAttribute("uid").toString();
    	String [] arr=getCurrentUserDetails();
    	md.addAttribute("uname",arr[0]);
    	md.addAttribute("picname",arr[1]);
    	// for uploading
    		long fsize=upload.getSize();
    		if(fsize>0)
    		{
    			String fname=upload.getOriginalFilename();
    			{
    				try {
    			   byte [] fileBytes=upload.getBytes();
    			   String FolderPath=ses.getServletContext().getRealPath("/")+"resources/submission";
    			   FileOutputStream fos=new FileOutputStream(FolderPath+"/"+fname);
    			   fos.write(fileBytes);
    			   fos.close();
    			   // DB insertion
    			   Result="Sorry! unable to process your request.";
    			   CommandText = "insert into submissionmaster(title,descrption,submittedby,filename) values('"+Title+"', '"+description+"', '"+submittedBy+"', '"+fname+"')";
    					boolean b = dm.executeInsertUpdateOrDelete(CommandText);
    					System.out.print("\n"+CommandText);
    					Result = b==true ? "Upload successful" : "Sorry! unable to upload picture..";
    				}
    				catch (Exception e) 
				    {
						// TODO: handle exception
    					System.out.println("Error:"+e.getMessage());
    					Result="Sorry! due to some technical error,we are unable to process your reques.";
    				}
    			}
    		}
    		else
    			Result="sorry! unable to process your request.";
    		md.addAttribute("msg",Result);
    	return "studentZone/upload";
    }
    @RequestMapping(value="/logout")
    public String logout(HttpSession ses)
    {
    	ses.removeAttribute("uid");
    	ses.invalidate();
    	return"redirect:/log";
    }
    @RequestMapping(value="/viewassign")
    public String viewassign(Model md,HttpSession ses)
    {
    	if(ses.getAttribute("uid")==null)
    		return "redirect:/log";
    	String []arr=getCurrentUserDetails();
    	md.addAttribute("uname",arr[0]);
    	md.addAttribute("picname",arr[1]);
    	CommandText="Select *from uploadassignment order by uploadid desc";
    	ResultSet rss=dm.executeSelect(CommandText);
    	md.addAttribute("assign",rss);
    	return "studentZone/ViewAssign";
    }
    @RequestMapping(value="/saveFeedback",method=RequestMethod.POST)
    public String savefeed(@RequestParam String title,@RequestParam String fmsg,Model md,HttpSession ses)
    {
    	//add below 4 lines in all 
    	if(ses.getAttribute("uid")==null)
    		return"redirect:/login";
    	String arr[]=getCurrentUserDetails();
    	md.addAttribute("uname",arr[0]);
    	md.addAttribute("picname",arr[1]);
    	String userid=ses.getAttribute("uid").toString();
    	CommandText="insert into feedbackmaster(Topic,Message,user_id) values('"+title+"','"+fmsg+"','"+userid+"')";
    	boolean res=dm.executeInsertUpdateOrDelete(CommandText);
    	Result=res==true?"Thanks for your valuable feedback.":"sorry! unable to save your feedback.";
    	md.addAttribute("msg",Result);
    	return"studentZone/feedback";
    }
    
    @RequestMapping(value="/admin/download")
   	public ResponseEntity<FileSystemResource> down(String filename,HttpSession ses)
   	{
   		String FolderPath=ses.getServletContext().getRealPath("/")+"resources/submission";
   		String FileFullPath=FolderPath+"/"+filename;
   		File myfile=new File(FileFullPath);
   		HttpHeaders hh=new HttpHeaders();
   		hh.setContentLength(myfile.length());
   		hh.setContentType(MediaType.MULTIPART_FORM_DATA);
   		hh.setContentDispositionFormData("task", filename);
   		FileSystemResource frs=new FileSystemResource(myfile);
   		ResponseEntity<FileSystemResource>re=new ResponseEntity<FileSystemResource>(frs,hh,HttpStatus.OK);
   		return re;
   	}
    
    
}
