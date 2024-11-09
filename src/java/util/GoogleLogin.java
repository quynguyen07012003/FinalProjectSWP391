/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import constant.Iconstant;
import entity.Account;
import entity.GoogleAccount;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 */
public class GoogleLogin {

    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Iconstant.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(
                        Form.form()
                                .add("client_id", Iconstant.GOOGLE_CLIENT_ID)
                                .add("client_secret", Iconstant.GOOGLE_CLIENT_SECRET)
                                .add("redirect_uri", Iconstant.GOOGLE_REDIRECT_URI)
                                .add("code", code)
                                .add("grant_type", Iconstant.GOOGLE_GRANT_TYPE)
                                .build()
                )
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static Account getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Iconstant.GOOGLE_LINK_GET_USER_INFO + accessToken;
    String response = Request.Get(link).execute().returnContent().asString();

    // Thêm log để xem phản hồi JSON từ Google
    System.out.println("Google API response: " + response);

    Account googlePojo = new Gson().fromJson(response, Account.class);
    
    JsonObject jsonResponse = new Gson().fromJson(response, JsonObject.class);
    String googleId = jsonResponse.get("id").getAsString(); 
    

    googlePojo.setId(null);
    

    googlePojo.setGgid(googleId); 

    return googlePojo;
    }

}
