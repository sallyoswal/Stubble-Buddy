package TestLambda.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;

public class PostExample implements RequestHandler<Map<String, String>,  List<Map<String, String>>> {


	@Override
	public List<Map<String, String>> handleRequest(Map<String, String> event, Context context) {
		
		List<Map<String, String>> data = new ArrayList<>();
		Map<String, String> tempData;
		Connection conn;
		
		try {
			conn = getConnection();
			Statement statement = conn.createStatement();
			String query = getQuery(event);
			
			ResultSet res = statement.executeQuery(query);
			
			while(res.next())
			{
				tempData = new HashMap<String, String>();
				tempData.put("Request Id", res.getString("RequestId"));
				tempData.put("Farmer Id", res.getString("FarmerId"));
				tempData.put("Farmer Name", res.getString("FarmerName"));
				tempData.put("Request Date", res.getString("OrderDate").replace(".0", ""));
				data.add(tempData);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		return data;
	}
	
	private String getQuery(Map<String, String> event)
	{
		String query = "Select * from Stubble_Buddy.F_Requests;";
		return query;
	}
	
	private Connection getConnection() throws SQLException {

		String url = "jdbc:mysql://stubbledata.ceotxlqlwd9b.us-east-1.rds.amazonaws.com:3306";
		String username = "root";
		String password = "SIH_2020";
		Connection conn = DriverManager.getConnection(url, username, password);
		return conn;
	}

}
