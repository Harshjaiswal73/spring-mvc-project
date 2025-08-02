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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.mysql.cj.xdevapi.Result;

import kss.Eprogrammer.modules.DBManager;
import kss.Eprogrammer.modules.Maler;

@Controller
public class Admincontroller {
  String Message="",CommandText="";
  DBManager dm=new DBManager();
  @RequestMapping(value="/admin/welcome")
  public String openindex()
  {
	  return"adminzone/welcome";
  }
  @RequestMapping(value="/admin/email")
  public String openemail()
  {
	  return "adminzone/sendemail";
  }
  @RequestMapping(value="/admin/send",method=RequestMethod.POST)
  public String sending(@RequestParam String sendto,@RequestParam String subject,
		  @RequestParam String message,Model md)
  {
	  Maler m =new Maler();
	  boolean res=m.sendMyEmail(sendto,subject,message);
	  Message =res==true?"Email send successfully.":"Sorry!unable to send";
	  md.addAttribute("msg",Message);
	  String mailmsg="Hi "+sendto+",\n\nThanks for your enquiry."+""
	  		+ "our team will contact you shortly.\n\n\nFrom-\nTeam E-programmer";
	  		Maler ml=new Maler();
	  		ml.sendMyEmail(sendto,"thank you for Enquiry",message);
	  return "adminzone/sendemail";
  }
  @RequestMapping(value="admin/notification")
  public String opennotification(Model md,HttpSession ses)
  {
	  if(ses.getAttribute("aid")==null)
		  return "redirect:login";
	  DBManager db=new DBManager();
	  CommandText="select *from  newsmaster";
	  ResultSet rs=db.executeSelect(CommandText);
	  md.addAttribute("data",rs);
	  return"adminzone/notification";
  }
  @RequestMapping(value="admin/addnotification",method=RequestMethod.POST)
  public String saveNews(@RequestParam String massage,Model md)
  {
	  CommandText="insert into newsmaster(newsmsg)values('"+massage+"')";
	  boolean b=dm.executeInsertUpdateOrDelete(CommandText);
	  Message=b==true?"Notification saved successfully.":
		  "Sorry!unable to save notification.";
	  md.addAttribute("msg",Message);
	  CommandText="select *from  newsmaster";
	  ResultSet rs=dm.executeSelect(CommandText);
	  md.addAttribute("data",rs);   
	  return"adminzone/notification";
  }
  @RequestMapping(value="/admin/deletenoti")
  public String deletenoti(@RequestParam int ni,Model md)
  {
	  DBManager db=new DBManager();
	  CommandText="delete from newsmaster where newsid='"+ni+"'";
	  boolean res=db.executeInsertUpdateOrDelete(CommandText);
	  Message=res==true?"Notification deleted successfully.":"Sorry! unable to delete your notification.";
	  md.addAttribute("msg",Message);
	  CommandText="select *from  newsmaster";
	  ResultSet rs=db.executeSelect(CommandText);
	  md.addAttribute("data",rs);
	  return"adminzone/notification";
  }
  @RequestMapping(value="/admin/logout")
  public String logout(HttpSession ses)
  {
	  ses.removeAttribute("aid"); // removing data from session
	  ses.invalidate(); //destroying session object
	  return"redirect:/log";
  }
  @RequestMapping(value ="/admin/enqmgmt")
  public String manageEnq(Model md)
  {
	  CommandText="Select *from enquirymaster order by enquiryid desc";
	  ResultSet rs=dm.executeSelect(CommandText);
	  md.addAttribute("enq",rs);
	  return "adminzone/manageenq";
  }
  @RequestMapping(value ="/admin/stumgmt")
  public String manageStu(Model md)
  {
	  CommandText="Select *from studentmaster order by registered_on desc";
	  ResultSet rs=dm.executeSelect(CommandText);
	  md.addAttribute("stu",rs);
	  return "adminzone/managestu";
  }
  @RequestMapping(value ="/admin/downtask")
  public String downloadtask(Model md)
  {
	  CommandText="Select *from submissionmaster  order by submissionid desc";
	  ResultSet rs=dm.executeSelect(CommandText);
	  md.addAttribute("task",rs);
	  return "adminzone/downloadtask";
  }
  @RequestMapping(value ="/admin/manageassign")
  public String manageassign(Model md)
  {
	  CommandText="Select *from uploadassignment order by uploadid desc";
  	  ResultSet rss=dm.executeSelect(CommandText);
  	  md.addAttribute("assign",rss);
	  return "adminzone/ManageAssign";
  }
 
  @RequestMapping(value="/admin/uploadassignment")
  public String uploadassignment()
  {
	  return"adminzone/uploadassignment";
  }
  @RequestMapping(value="/admin/assigntask",method=RequestMethod.POST)
  public String savetask(@RequestParam String title,@RequestParam String descript
		  ,@RequestParam String subdate,@RequestParam CommonsMultipartFile TaskFile,HttpSession ses,Model md)
  {
	  try 
	  {
		// uploading file into server
		  if(TaskFile!=null)
		  {
			  long fsize=TaskFile.getSize();
			  if(fsize>0)
			  {
				  String fname=TaskFile.getOriginalFilename();
				  byte []fileBytes=TaskFile.getBytes();
				  String FolderPath=ses.getServletContext().getRealPath("/")+"resources/Task";
				  FileOutputStream fos=new FileOutputStream(FolderPath+"/"+fname);
				  fos.write(fileBytes);
				  fos.close();
				  //db insertion
				  CommandText="insert into  uploadassignment(Title,description,submissiondb,filename)"
				  		+ "values('"+title+"','"+descript+"','"+subdate+"','"+fname+"')";
				  boolean b=dm.executeInsertUpdateOrDelete(CommandText);
				  Message=b==true?"Task uploaded successfully.":"sorry! unable to upload task.";
			  }
			  else
				  Message="please choose a task file.";
		  }
		  else
			  Message="Sorry!unable to upload task file.";
	  } 
	  catch (Exception e) {
		Message="Sorry! unable to upload task for students.please try again.";
	}
	  md.addAttribute("msg",Message);
	  return"adminzone/uploadassignment";
  }
  
  @RequestMapping(value="/admin/studymaterial")
  public String studymaterial()
  {
	  return"adminzone/studymaterial";
  }
  @RequestMapping(value="/admin/savestudy",method=RequestMethod.POST)
  public String savematerial(@RequestParam String subject,
		  @RequestParam String title,@RequestParam String descript,
		  @RequestParam CommonsMultipartFile Studyfile,HttpSession ses,Model md)
  {
	  try 
	  {
		// uploading file into server
		  if(Studyfile!=null)
		  {
			  long fsize=Studyfile.getSize();
			  if(fsize>0)
			  {
				  String fname=Studyfile.getOriginalFilename();
				  byte []fileBytes=Studyfile.getBytes();
				  String FolderPath=ses.getServletContext().getRealPath("/")+"resources/Notes";
				  FileOutputStream fos=new FileOutputStream(FolderPath+"/"+fname);
				  fos.write(fileBytes);
				  fos.close();
				  // database insertion
				  CommandText="insert into studymaterial(subject,title,description,filename)values"
				  		+ "('"+subject+"','"+title+"','"+descript+"','"+fname+"')";
				  boolean b=dm.executeInsertUpdateOrDelete(CommandText);
				  Message=b==true?"Study material uploaded successfully.":"sorry! unable to upload study material.";
			  }
			  else
				  Message="please choose a study material file.";
		  }
		  else
			  Message="Sorry!unable to upload study material.";
	  } 
	  catch (Exception e) {
		Message="Sorry! unable to upload study material for students.please try again.";
	}
	  md.addAttribute("msg",Message);
	  return"adminzone/studymaterial";
  }
  @RequestMapping(value="/admin/showfeed")
  public String showFeedback(Model md)
  {
	  CommandText="select *from feedbackmaster order by f_id desc";
	  ResultSet rset=dm.executeSelect(CommandText);
	  md.addAttribute("fdata",rset);
	  return"adminzone/managefeed";
  }
}
