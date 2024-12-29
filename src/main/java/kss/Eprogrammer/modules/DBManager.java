package kss.Eprogrammer.modules;
import java.sql.*;
public class DBManager 
{
   Connection con;
   Statement stmt;
   public DBManager()
   {
	   try
	   {
		   Class.forName("com.mysql.jdbc.Driver");
		   con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eprogdb","root","");
		   stmt=con.createStatement();
	   }
	   catch(Exception e) {
		   System.out.println("Error:"+e.getMessage());
	   }
   }
   public boolean executeInsertUpdateOrDelete(String CommandText)
   {
	   try
	   {
		   stmt.executeUpdate(CommandText);
		   return true;
	   }
	   catch (Exception e) {
		   System.out.println("Error:"+e.getMessage());
		   return false;
	   }
   }
   public ResultSet executeSelect(String CommandText)
   {
	   ResultSet rs=null;
	   try {
		rs = stmt.executeQuery(CommandText);
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println("Error:"+e.getMessage());
	}
	   return rs;
   }
}
