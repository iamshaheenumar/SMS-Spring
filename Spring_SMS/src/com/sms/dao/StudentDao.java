package com.sms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.sms.beans.GetMarkBean;
import com.sms.connection.DbConnection;

public class StudentDao extends DbConnection {
	 
	Statement stmt = null;
	String query=null;
	ResultSet rs;
	
	public StudentDao() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public List<GetMarkBean> getMarks(long studentId){
		List<GetMarkBean> list=new ArrayList<GetMarkBean>(); 
		try{
			stmt = conn.createStatement();
		    query = "SELECT * FROM tbl_st";
		    rs = stmt.executeQuery(query);	
		    
	
		    while(rs.next()){		    	
		        list.add(new GetMarkBean(rs.getInt("id"),rs.getString("subject"),rs.getInt("markobtained"),rs.getInt("totalmark"))); 
		         //Retrieve by column name
		         int id  = rs.getInt("id");
		         String subject = rs.getString("subject");

		         //Display values
		         System.out.print("ID: " + id);
		         System.out.print(", Age: " + subject);

		      }
		      rs.close();
			
		}catch(SQLException e){
			 //Handle errors for JDBC
		      e.printStackTrace();
		}
		return (list);
	}

}
