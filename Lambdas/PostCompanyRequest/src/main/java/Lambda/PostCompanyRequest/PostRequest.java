package Lambda.PostCompanyRequest;

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
		int status = 0;
		String phoneNumber = null;
		PublishResult result = null;
		
		try {
			conn = getConnection();
			Statement statement = conn.createStatement();
			String query = getQuery(event);
			
			status = statement.executeUpdate(query);
			

				ResultSet res = statement.executeQuery("Select CompanyPhoneNo from Stubble_Buddy.Company_Details where CompanyId = '" + event.get("Company Id") + "';");
				
				String message = "Dear Company "+ event.get("Company Name") + ", your stubble request is placed successfully";
		        
				res.next();
		        phoneNumber = "+91" + res.getString("CompanyPhoneNo");
		        
		        AmazonSNSClient snsClient = (AmazonSNSClient) AmazonSNSClientBuilder.defaultClient();
		        Map<String, MessageAttributeValue> smsAttributes = new HashMap<String, MessageAttributeValue>();
		        smsAttributes.put("AWS.SNS.SMS.SMSType", new MessageAttributeValue().withStringValue("Transactional").withDataType("String") );
		        result = sendSMSMessage(snsClient, message, phoneNumber, smsAttributes);
			
			
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
		String CompanyId = event.get("Company Id");
		String CompanyName = event.get("Company Name");
		String StubbleAmt = event.get("Stubble Amount");
		String query = "insert into Stubble_Buddy.C_Requests values ('" + RequestId + "', '" + CompanyId + "', '" + CompanyName + "', " + "Now(), " + "Cast('" + StubbleAmt + "' as Decimal(10,6)));";
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
