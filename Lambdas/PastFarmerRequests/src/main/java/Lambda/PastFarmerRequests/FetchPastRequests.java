package Lambda.PastFarmerRequests;

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

public class FetchPastRequests implements RequestHandler<Map<String, String>, List<Map<String, String>>> {

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
				tempData.put("Farmer Req Id", res.getString("F_RequestId"));
				tempData.put("Company Req Id", res.getString("C_RequestId"));
				tempData.put("Farmer Id", res.getString("FarmerId"));
				tempData.put("Company Id", res.getString("CompanyId"));
				tempData.put("Order Date", res.getString("OrderDate").replace(".0", ""));
				tempData.put("Stubble Amount Sold", res.getString("StubbleAmtSold"));
				tempData.put("Order Completion Date", res.getString("OrderCompletionDate").replace(".0", ""));
				tempData.put("Farmer Request Status", res.getString("FReqStatus"));
				tempData.put("Money Received", res.getString("MoneyRecieved"));
				data.add(tempData);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		return data;
	}
	
	private String getQuery(Map<String, String> event)
	{
		String query = "Select * from Stubble_Buddy.PastFarmerRequests;";
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
