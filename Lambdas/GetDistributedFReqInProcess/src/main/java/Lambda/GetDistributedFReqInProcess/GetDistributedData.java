package Lambda.GetDistributedFReqInProcess;

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

public class GetDistributedData implements RequestHandler<Map<String, String>, List<Map<String, String>>> {

	@Override
	public List<Map<String, String>> handleRequest(Map<String, String> event, Context context) {
		
		List<Map<String, String>> data = new ArrayList<>();
		Map<String, String> tempData;
		Connection conn1, conn2;
		
		try {
			conn1 = getConnection1();
			conn2 = getConnection2();
			Statement statement1 = conn1.createStatement();
			Statement statement2 = conn2.createStatement();
			String query = getQuery1(event);
			
			ResultSet res = statement1.executeQuery(query);
			
			while(res.next())
			{
				tempData = new HashMap<String, String>();
				tempData.put("Request Id", res.getString("RequestId"));
				tempData.put("Farmer Id", res.getString("FarmerId"));
				tempData.put("Farmer Name", res.getString("FarmerName"));
				tempData.put("Request Date", res.getString("OrderDate").replace(".0", ""));
				tempData.put("Stubble Amount", res.getString("StubbleAmt"));
				tempData.put("Request Status", res.getString("ReqStatus"));
				data.add(tempData);
			}
			
			query = getQuery2(event);
			ResultSet res1 = statement2.executeQuery(query);
			
			while(res1.next())
			{
				tempData = new HashMap<String, String>();
				tempData.put("Request Id", res1.getString("RequestId"));
				tempData.put("Farmer Id", res1.getString("FarmerId"));
				tempData.put("Farmer Name", res1.getString("FarmerName"));
				tempData.put("Request Date", res1.getString("OrderDate").replace(".0", ""));
				tempData.put("Stubble Amount", res1.getString("StubbleAmt"));
				tempData.put("Request Status", res1.getString("ReqStatus"));
				data.add(tempData);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		return data;
	}
	
	private String getQuery1(Map<String, String> event)
	{
		String query = "Select * from Stubble_Buddy1.FRequests_InProcess;";
		return query;
	}
	
	private String getQuery2(Map<String, String> event)
	{
		String query = "Select * from Stubble_Buddy2.FRequests_InProcess;";
		return query;
	}
	
	private Connection getConnection1() throws SQLException {

		String url = "jdbc:mysql://shardeddb1.ceotxlqlwd9b.us-east-1.rds.amazonaws.com:3306";
		String username = "root";
		String password = "SIH_2020";
		Connection conn = DriverManager.getConnection(url, username, password);
		return conn;
	}
	
	private Connection getConnection2() throws SQLException {

		String url = "jdbc:mysql://shardeddb2.ceotxlqlwd9b.us-east-1.rds.amazonaws.com:3306";
		String username = "root";
		String password = "SIH_2020";
		Connection conn = DriverManager.getConnection(url, username, password);
		return conn;
	}


}

