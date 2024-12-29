package kss.Eprogrammer.modules;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class CaptchaGenerator
 */
public class CaptchaGenerator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CaptchaGenerator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		CodeGenerator cg = new CodeGenerator();
		String Code = cg.getCaptchaCode();
		HttpSession ses=request.getSession();
		ses.setAttribute("CaptchaCode", Code);
		BufferedImage bi =new BufferedImage(140,30,BufferedImage.TYPE_INT_RGB);
		Graphics2D gd = bi.createGraphics();
		gd.setBackground(Color.black);
		gd.fillRect(0,0,140,30);
		gd.setColor(Color.black);
		gd.drawRect(8,2,125,25);
		Font ft = new Font("Cursive",Font.ITALIC,16);
		gd.setFont(ft);
		gd.setColor(Color.red);
		gd.drawString(Code,25, 22);
		gd.dispose();
		OutputStream ops=response.getOutputStream();
		ImageIO.write(bi,"jpg", ops);
		ops.close();
	}

}
