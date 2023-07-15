package Lambda.PostFarmerRequest;

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

public class PostRequest implements RequestHandler<Map<String, String>, String> {


	@Override
	public String handleRequest(Map<String, String> event, Context context) {
		
		Connection conn;
		int status = -1;
		PublishResult result = null;
		
		try {
			conn = getConnection();
			Statement statement = conn.createStatement();
			String query = getQuery(event);
			
			status = statement.executeUpdate(query);
			
			if(status == 1)
			{
				ResultSet res = statement.executeQuery("Select FarmerPhoneNo from Stubble_Buddy.Farmer_Details where FarmerId = '" + event.get("Farmer Id") + "';");
				
		        String message = "Dear "+ event.get("Farmer Name") + ", your stubble collection request is placed successfully";
		        String phoneNumber= null;
		        res.next();
		        phoneNumber = "+91" + res.getString("FarmerPhoneNo");
		        
		        
		        AmazonSNSClient snsClient = (AmazonSNSClient) AmazonSNSClientBuilder.defaultClient();
		        Map<String, MessageAttributeValue> smsAttributes = new HashMap<String, MessageAttributeValue>();
		        smsAttributes.put("AWS.SNS.SMS.SMSType", new MessageAttributeValue().withStringValue("Transactional").withDataType("String") );
		        
		        result = sendSMSMessage(snsClient, message, phoneNumber, smsAttributes);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		return Integer.toString(status) + result;
	}
	
	public static PublishResult sendSMSMessage(AmazonSNSClient snsClient, String message, 
			String phoneNumber, Map<String, MessageAttributeValue> smsAttributes) {
	        PublishResult result = snsClient.publish(new PublishRequest()
	                        .withMessage(message)
	                        .withPhoneNumber(phoneNumber)
	                        .withMessageAttributes(smsAttributes));
	        return result;
		}
	
	private String getQuery(Map<String, String> event)
	{
		String RequestId = event.get("Request Id");
		String FarmerId = event.get("Farmer Id");
		String FarmerName = event.get("Farmer Name");
		String query = "insert into Stubble_Buddy.F_Requests values ('" + RequestId + "', '" + FarmerId + "', '" + FarmerName + "', Now());";
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
