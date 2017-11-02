package client.app;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class RestHttpWishListApp {
	
	// main Method
	public static void main(String[] args) throws Exception{

		
		System.out.println("\n====================================\n");
	
		RestHttpWishListApp.WishListTest_Codehaus();		

	}

	//1.4 Http Protocol GET ���? Request : FromData���� 
	//==> JsonSimple + codehaus 3rd party lib ���?
	public static void WishListTest_Codehaus() throws Exception{
		
	
		// HttpClient : Http Protocol �� client �߻�ȭ 
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/movie/json/wishList/s@s.s";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
	
	
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		//==> Response Ȯ��
		System.out.println(httpResponse);
		System.out.println();
				
		
		//==> Response �� entity(DATA) Ȯ��
		HttpEntity httpEntity = httpResponse.getEntity();
		System.out.println("httpEntity :: " + httpEntity);
		
		//==> InputStream ����
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		//==> �ٸ� �������? serverData ó�� 
		//System.out.println("[ Server ���� ���� Data Ȯ�� ] ");
		String serverData = br.readLine();
		System.out.println(serverData);
		
		// Using List TypeReferece 
		//TypeReference<List<Product>> mapType = new TypeReference<List<Product>>() {};
		//List<Product> jsonToProductList = objectMapper01.readValue(serverData,mapType);		
		//jsonToProductList.forEach(System.out::println);
	
	}	
	
}