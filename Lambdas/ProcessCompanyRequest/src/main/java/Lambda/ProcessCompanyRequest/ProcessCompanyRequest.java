package Lambda.ProcessCompanyRequest;

import java.sql.CallableStatement;
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

public class ProcessCompanyRequest implements RequestHandler<Map<String, String>, String> {


	@Override
	public String handleRequest(Map<String, String> event, Context context) {
		
		Connection conn;
		Boolean status = false;
		int status1 = 0;
		
		try {
			conn = getConnection();
			
			CallableStatement statement = conn.prepareCall("{call Stubble_Buddy.CompleteCRequest(?, ?, ?)}");
			
			statement.setInt(1, Integer.parseInt(event.get("Stubble Amount")));
            statement.setString(2, event.get("Request Id"));
            statement.setString(3, event.get("Company Id"));
			
			status = statement.execute();
			
			Statement statement1 = conn.createStatement();
			Statement statement2 = conn.createStatement();
			Statement statement3 = conn.createStatement();
			
			ResultSet res = statement1.executeQuery("Select CompanyPhoneNo from Stubble_Buddy.Company_Details where CompanyId = '" + event.get("Company Id") + "';");
			
			String message = "Dear Company your stubble request of request Id: " + event.get("Request Id") + " is delievered";
	        
			res.next();
	        String phoneNumber = "+91" + res.getString("CompanyPhoneNo");
	        
	        AmazonSNSClient snsClient = (AmazonSNSClient) AmazonSNSClientBuilder.defaultClient();
	        Map<String, MessageAttributeValue> smsAttributes = new HashMap<String, MessageAttributeValue>();
	        smsAttributes.put("AWS.SNS.SMS.SMSType", new MessageAttributeValue().withStringValue("Transactional").withDataType("String") );
	        sendSMSMessage(snsClient, message, phoneNumber, smsAttributes);
	        
	        ResultSet res1 = statement2.executeQuery("select FarmerId, F_RequestId from Stubble_Buddy.PastFarmerRequests where FReqStatus = 'Complete' and C_RequestId = '" + event.get("Request Id") + "';");
	        while(res1.next())
	        {
	        	ResultSet res2 = statement3.executeQuery("Select FarmerPhoneNo from Stubble_Buddy.Farmer_Details where FarmerId = '" + res1.getString("FarmerId") + "';");
	        	
	        	message = "Dear Farmer your stubble request of request Id: " + res1.getString("F_RequestId") + " is completed";
		        
				res2.next();
		        phoneNumber = "+91" + res2.getString("FarmerPhoneNo");
		        
		        snsClient = (AmazonSNSClient) AmazonSNSClientBuilder.defaultClient();
		        smsAttributes = new HashMap<String, MessageAttributeValue>();
		        smsAttributes.put("AWS.SNS.SMS.SMSType", new MessageAttributeValue().withStringValue("Transactional").withDataType("String") );
		        sendSMSMessage(snsClient, message, phoneNumber, smsAttributes);
	        }
	        
	        statement.close();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		return Boolean.toString(status) + " " + Integer.toString(status1);
	}
	
	public static void sendSMSMessage(AmazonSNSClient snsClient, String message, 
			String phoneNumber, Map<String, MessageAttributeValue> smsAttributes) {
	        PublishResult result = snsClient.publish(new PublishRequest()
	                        .withMessage(message)
	                        .withPhoneNumber(phoneNumber)
	                        .withMessageAttributes(smsAttributes));
		}

	private Connection getConnection() throws SQLException {

		String url = "jdbc:mysql://stubbledata.ceotxlqlwd9b.us-east-1.rds.amazonaws.com:3306";
		String username = "root";
		String password = "SIH_2020";
		Connection conn = DriverManager.getConnection(url, username, password);
		return conn;
	}

}
