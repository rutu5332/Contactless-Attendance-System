package server;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
maxFileSize = 1024 * 1024 * 10 ,
maxRequestSize = 1024 * 1024 * 50 )

public class changeImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		//PrintWriter out = response.getWriter();
		
		Part part = request.getPart("img1");
		String filename = extractFileName(part);
		String savepath = "C:\\eclipse-workspace\\SmartOffice\\src\\main\\webapp\\images" + File.separator + filename;
 		String newsavepath = "C:\\eclipse-workspace\\SmartOffice\\src\\main\\webapp\\images" + File.separator ;//+ filename;
		part.write(savepath + File.separator);
		String id=request.getParameter("uid");
		filename = id+"-1.jpg";
		newsavepath += filename;
		File f= new File(newsavepath);           
		if(f.delete())                      //delete old image
		{  
			System.out.println(f.getName() + " deleted");   //getting and printing the file name  
		} 
		File old =new File(savepath);
		File newF=new File(newsavepath);
		old.renameTo(newF);   //rename new image
		HttpSession session = request.getSession(true);
		int t = Integer.parseInt(session.getAttribute("userType").toString());
		if (t == 1) {
			response.sendRedirect("Admin/myprofile.jsp");
		} else if (t == 2) {
			response.sendRedirect("OfficeAdmin/myprofile.jsp");
		} else {
			response.sendRedirect("employee/myprofile.jsp");
		}
	}
	
	private String extractFileName(Part part) throws IOException, NullPointerException
	{
		try 
		{
			String contentDisp = part.getHeader("content-disposition");
			String[] items = contentDisp.split(";");
			for (String s : items)
			{
				if (s.trim().startsWith("filename")) 
				{
					//System.out.println("file :: " + s.substring(s.indexOf("=") + 2, s.length() - 1));  // output :: file :: logo.png
					return s.substring(s.indexOf("=") + 2, s.length() - 1);
				}
			}
			return "";
		} catch (Exception e)
		{
			System.out.println(e);
		}
		return "";
	}

}
