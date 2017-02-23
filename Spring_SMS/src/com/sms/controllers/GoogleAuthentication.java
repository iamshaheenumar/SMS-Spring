package com.sms.controllers;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;




@Controller
public class GoogleAuthentication {
    
	
	JsonFactory jsonFactory = new JacksonFactory();
    HttpTransport transport = new NetHttpTransport();
    
    
	private String CLIENT_ID="695592406680-d0829hvp35t3olive1kdc62e0reeof31.apps.googleusercontent.com";
	private String ID_TOKEN;
	
	@RequestMapping(value="/GoogleAuth",method=RequestMethod.POST)
	void googleAuth(HttpServletRequest request, HttpServletResponse response) throws GeneralSecurityException, IOException{
		
			GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
			    .setAudience(Collections.singletonList(CLIENT_ID))
			    // Or, if multiple clients access the backend:
			    //.setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
			    .build();
			
			// (Receive idTokenString by HTTPS POST)
			ID_TOKEN = request.getParameter("idtoken");
			
			GoogleIdToken idToken = verifier.verify(ID_TOKEN);
			if (idToken != null) {
			  Payload payload = idToken.getPayload();
			
			  // Print user identifier
			  String userId = payload.getSubject();
			  System.out.println("User ID: " + userId);
			
			  // Get profile information from payload
			  String email = payload.getEmail();
			  boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			  String name = (String) payload.get("name");
			  String pictureUrl = (String) payload.get("picture");
			  String locale = (String) payload.get("locale");
			  String familyName = (String) payload.get("family_name");
			  String givenName = (String) payload.get("given_name");
			  System.out.println(name);
			
			  // Use or store profile information
			  // ...
			  
			  response.setStatus(200);
			} else {
			  System.out.println("Invalid ID token.");
			  response.sendError(401,"Unaouthorised access !");
		}

		
	
	}

}
