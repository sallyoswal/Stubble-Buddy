package Lambda.CompanyDetails;

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

public class FetchCompanyDetails implements RequestHandler<Map<String, String>, List<Map<String, String>>> {

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
				tempData.put("Company Id", res.getString("CompanyId"));
				tempData.put("Company Name", res.getString("CompanyName"));
				tempData.put("Company Location", res.getString("CompanyLoc"));
				tempData.put("Email Id", res.getString("CompanyMail"));
				tempData.put("Phone No", res.getString("CompanyPhoneNo"));
				tempData.put("Registration Number", res.getString("CompanyRegNo"));
				data.add(tempData);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		return data;
	}
	
	private String getQuery(Map<String, String> event)
	{
		String query = "Select * from Stubble_Buddy.Company_Details;";
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