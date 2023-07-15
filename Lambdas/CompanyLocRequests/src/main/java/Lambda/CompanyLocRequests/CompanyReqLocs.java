package Lambda.CompanyLocRequests;

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

public class CompanyReqLocs implements RequestHandler<Map<String, String>,  List<Map<String, String>>> {

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
				tempData.put("Request Id", res.getString("RequestCount"));
				tempData.put("Company Location", res.getString("CompanyLoc"));
				data.add(tempData);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		return data;
	}
	
	private String getQuery(Map<String, String> event)
	{
		String query = "select count(C_Requests.CRequestId) as RequestCount, t2.CompanyLoc from Stubble_Buddy.C_Requests Right join Stubble_Buddy.Company_Details t2 on C_Requests.CompanyId = t2.CompanyId group by t2.CompanyLoc;";
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
