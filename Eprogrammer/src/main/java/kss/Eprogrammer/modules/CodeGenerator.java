package kss.Eprogrammer.modules;
import java.util.Random;
public class CodeGenerator 
{
    int x;
    int getOTP()
    {
        Random r=new Random();
        x=r.nextInt(1000,9999);
        return x;
    }
    String getCaptchaCode()
    {
        String code="";
        Random r=new Random();
        char ch=(char)r.nextInt(65,90);  
        code=code+ch;
        ch=(char)r.nextInt(70,90);
        code=code+ch;
        x=r.nextInt(0,9);
        code=code+x;
        ch=(char)r.nextInt(97,120);
        code=code+ch;
        ch=(char)r.nextInt(65,85);
        code=code+ch;
        x=r.nextInt(1,6);
        code=code+x;
        if(x%2==0)
        {
            ch=(char)r.nextInt(100,120);
            code=code+ch;
        }
        return code;
    }
    public static void main(String[]arr)
    {
        CodeGenerator cg=new CodeGenerator();
        int r=cg.getOTP();
        System.out.println("Otp is: "+r);
        String s=cg.getCaptchaCode();
        System.out.println("Captcha code: "+s);
    }

}
