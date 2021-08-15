package Database;
import java.sql.*;

public class Data {
	public Connection cn;
	public Statement st;
	public ResultSet rs;
	
	public Data()
	{
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
           
            cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/smartoffice","root","root");
            //System.out.println("Connected");
			
		}
		catch(Exception ex) {
			System.out.println(ex);
		}
	}
}
