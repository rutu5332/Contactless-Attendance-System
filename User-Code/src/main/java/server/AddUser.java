package server;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Database.Data;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
maxFileSize = 1024 * 1024 * 10 ,
maxRequestSize = 1024 * 1024 * 50 )

public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		//PrintWriter out = response.getWriter();
		
		Part part = request.getPart("img1");
		Part part2 = request.getPart("img2");
		Part part3 = request.getPart("img3");
		String filename = extractFileName(part);
		String filename2 = extractFileName(part2);
		String filename3 =extractFileName(part3);
 		String savepath = "C:\\eclipse-workspace\\SmartOffice\\src\\main\\webapp\\images" + File.separator + filename;
 		String savepath2 ="C:\\eclipse-workspace\\SmartOffice\\src\\main\\webapp\\images" + File.separator + filename2;
 		String savepath3 ="C:\\eclipse-workspace\\SmartOffice\\src\\main\\webapp\\images" + File.separator + filename3;
 		String newsavepath = "C:\\eclipse-workspace\\SmartOffice\\src\\main\\webapp\\images" + File.separator ;//+ filename;
 		String newsavepath2 ="C:\\eclipse-workspace\\SmartOffice\\src\\main\\webapp\\images" + File.separator ;//+ filename2;
 		String newsavepath3 ="C:\\eclipse-workspace\\SmartOffice\\src\\main\\webapp\\images" + File.separator ;//+ filename3;
		part.write(savepath + File.separator);
		part2.write(savepath2 + File.separator);
		part3.write(savepath3 + File.separator);
		
		try {
			Data dt = new Data();
			String fname,lname,email,type,mob,des,gen,id="";
			type=request.getParameter("user").trim();
			fname=request.getParameter("fname").trim();
			lname=request.getParameter("lname").trim();
			email=request.getParameter("email").trim();
			mob=request.getParameter("mob").trim();
			des=request.getParameter("des").trim();
			gen=request.getParameter("gen");
			
			dt.st=dt.cn.createStatement();
			String insert="insert into user (fname,lname,email,mobileNo,password,type,designation,gender) values ('"+fname+"', '"+
			lname+" ','" +email+"'," + mob+" , '12345678',"+type+",'"+des+"','"+gen+"')";
			dt.st.executeUpdate(insert);
			dt.st.close();
			
			dt.st=dt.cn.createStatement();
			String sel ="select * from user";
			dt.rs=dt.st.executeQuery(sel);
			while(dt.rs.next())
			{
				id=dt.rs.getString("id");
			}
			dt.st.close();
			
			filename = id+"-1.jpg";
			filename2 = id+"-2.jpg";
			filename3 = id+"-3.jpg";
			
			newsavepath += filename;
			File old =new File(savepath);
			File newF=new File(newsavepath);
			old.renameTo(newF);
			dt.st=dt.cn.createStatement();
			insert="insert into image(uid,image_path) values ("+id+" , ' "+ filename+"')";
			dt.st=dt.cn.createStatement();
			dt.st.executeUpdate(insert);
			dt.st.close();
			
			newsavepath2 += filename2;
			old =new File(savepath2);
			newF=new File(newsavepath2);
			old.renameTo(newF);
			dt.st=dt.cn.createStatement();
			insert="insert into image(uid,image_path) values ("+id+" , ' "+ filename2+"')";
			dt.st=dt.cn.createStatement();
			dt.st.executeUpdate(insert);
			dt.st.close();
			
			newsavepath3 += filename3;
			old =new File(savepath3);
			newF=new File(newsavepath3);
			old.renameTo(newF);
			dt.st=dt.cn.createStatement();
			insert="insert into image(uid,image_path) values ("+id+" , ' "+ filename3+"')";
			dt.st=dt.cn.createStatement();
			dt.st.executeUpdate(insert);
			dt.st.close();
			dt.cn.close();
		}
		catch(Exception e) {System.out.println(e);}
		
		response.sendRedirect("Admin/index.jsp");
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
