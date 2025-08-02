package kss.Eprogrammer.modules;

public class Cryptography
{
  public String encryptMyPassword(String PlainPassword)
  {
	  String EncryptedPass="";
	  int ASCIIVal,NewASCIIVal;
	  for(int x=0;x<PlainPassword.length();x++)
	  {
		  char ch=PlainPassword.charAt(x);
		  ASCIIVal=(int)ch;
		  if(ASCIIVal>=65 && ASCIIVal<=90)
		  {
			  NewASCIIVal=65-ASCIIVal+90;
		  }
		  else if(ASCIIVal>=97 && ASCIIVal<=122)
		  {
			  NewASCIIVal=ASCIIVal+32;
		  }
		  else if(ASCIIVal>=48 && ASCIIVal<=57)
		  {
			  NewASCIIVal=ASCIIVal+2;
		  }
		  else
		  {
			  NewASCIIVal=ASCIIVal;
		  }
		  EncryptedPass=EncryptedPass+(char)NewASCIIVal;
	  }
	  return EncryptedPass;
  }
}
