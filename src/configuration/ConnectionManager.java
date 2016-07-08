package configuration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

	private ConnectionManager(){}
	
	public static Connection cnn = null;
	private static final String URL="jdbc:postgresql://localhost:5432/jdbc";
	private static final String DRIVER="org.postgresql.Driver";
	private static final String NAME="postgres";
	private static final String PASSWORD="123";
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		Class.forName(DRIVER);
		if(cnn==null)
		{
			cnn = DriverManager.getConnection(URL,NAME,PASSWORD);
		}
		return cnn;
	}
// Test Connection database
//	public static void main(String[] args) throws ClassNotFoundException, SQLException {
//		ConnectionManager.getConnection();
//		System.out.println("TEST");
//	}
}
