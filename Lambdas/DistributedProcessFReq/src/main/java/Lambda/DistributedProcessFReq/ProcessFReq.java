package Lambda.DistributedProcessFReq;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.sns.AmazonSNSClient;
import com.amazonaws.services.sns.AmazonSNSClientBuilder;
import com.amazonaws.services.sns.model.MessageAttributeValue;
import com.amazonaws.services.sns.model.PublishRequest;
import com.amazonaws.services.sns.model.PublishResult;

public class ProcessFReq implements RequestHandler<Map<String, String>, String> {


	@Override
	public String handleRequest(Map<String, String> event, Context context) {
		
		Connection conn, conn1, conn2;
		int status = 0;
		int status1 = 0;
		
		try {
			conn = getConnection();
			Statement statement = conn.createStatement();
			
			ResultSet res = statement.executeQuery("Select DatabaseId from Stubble_Buddy.shardTable where FarmerId = '" + event.get("Farmer Id") + "';");
			
			res.next();
			String databaseId = res.getString("DatabaseId");
			
			if(databaseId.equals("1"))
			{
				conn1 = getConnection1();
				Statement statement1 = conn1.createStatement();
				
				String query = getQuery1(event);
				status = statement1.executeUpdate(query);
				status1 = statement.executeUpdate("delete from Stubble_Buddy.F_Requests where RequestId = '" + event.get("Request Id") + "';");
				
			}
			
			else
			{
				conn2 = getConnection2();
				Statement statement2 = conn2.createStatement();
				
				String query = getQuery2(event);
				status = statement2.executeUpdate(query);
				status1 = statement.executeUpdate("delete from Stubble_Buddy.F_Requests where RequestId = '" + event.get("Request Id") + "';");
			}
			
			
			ResultSet res1 = statement.executeQuery("Select FarmerPhoneNo from Stubble_Buddy.Farmer_Details where FarmerId = '" + event.get("Farmer Id") + "';");
	
	        String message = "Dear "+ event.get("Farmer Name") + ", your stubble request is under process";
	        res1.next();
	        String phoneNumber = "+91" + res1.getString("FarmerPhoneNo");
	        
	        AmazonSNSClient snsClient = (AmazonSNSClient) AmazonSNSClientBuilder.defaultClient();
	        Map<String, MessageAttributeValue> smsAttributes = new HashMap<String, MessageAttributeValue>();
	        smsAttributes.put("AWS.SNS.SMS.SMSType", new MessageAttributeValue().withStringValue("Transactional").withDataType("String") );
	        sendSMSMessage(snsClient, message, phoneNumber, smsAttributes);
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		return Integer.toString(status) + " " + Integer.toString(status1);
	}
	
	public static void sendSMSMessage(AmazonSNSClient snsClient, String message, 
			String phoneNumber, Map<String, MessageAttributeValue> smsAttributes) {
	        PublishResult result = snsClient.publish(new PublishRequest()
	                        .withMessage(message)
	                        .withPhoneNumber(phoneNumber)
	                        .withMessageAttributes(smsAttributes));
		}
	
	
	private String getQuery1(Map<String, String> event)
	{
		String RequestId = event.get("Request Id");
		String FarmerId = event.get("Farmer Id");
		String FarmerName = event.get("Farmer Name");
		String OrderDate = event.get("Request Date");
		String StubbleAmt = event.get("Stubble Amount");
		String ReqStatus = event.get("Request Status");
		String query = "insert into Stubble_Buddy1.FRequests_InProcess values ('" + RequestId + "', '" + FarmerId + "', '" + FarmerName + "', " + "str_to_date('" + OrderDate + "','%Y-%m-%d %H:%i:%s'), " + "Cast('" + StubbleAmt + "' as Decimal(10,6)), '" + ReqStatus + "');";
		return query;
	}
	
	private String getQuery2(Map<String, String> event)
	{
		String RequestId = event.get("Request Id");
		String FarmerId = event.get("Farmer Id");
		String FarmerName = event.get("Farmer Name");
		String OrderDate = event.get("Request Date");
		String StubbleAmt = event.get("Stubble Amount");
		String ReqStatus = event.get("Request Status");
		String query = "insert into Stubble_Buddy2.FRequests_InProcess values ('" + RequestId + "', '" + FarmerId + "', '" + FarmerName + "', " + "str_to_date('" + OrderDate + "','%Y-%m-%d %H:%i:%s'), " + "Cast('" + StubbleAmt + "' as Decimal(10,6)), '" + ReqStatus + "');";
		return query;
	}
	
	private Connection getConnection() throws SQLException {

		String url = "jdbc:mysql://stubbledata.ceotxlqlwd9b.us-east-1.rds.amazonaws.com:3306";
		String username = "root";
		String password = "SIH_2020";
		Connection conn = DriverManager.getConnection(url, username, password);
		return conn;
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
