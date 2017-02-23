package com.sms.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sms.beans.GetMarkBean;
import com.sms.connection.DbConnection;
import com.sms.dao.StudentDao;

@Controller
public class LoginController{
	@RequestMapping("/studentLogin")
    public ModelAndView studentLogin(){  
        //write the code to get all employees from DAO  
        //here, we are writing manual code of list for easy understanding  
        StudentDao dao=new StudentDao(); 
		List<GetMarkBean> list=new ArrayList<GetMarkBean>();
        list=dao.getMarks(10);
        
//        list.add(new GetMarkBean(1,"Science",25,100));  
//        list.add(new GetMarkBean(2,"Maths",95,100));  
//        list.add(new GetMarkBean(3,"Social Science",95,100));  
          
        return new ModelAndView("studentLogin","list",list);  
    }  
}
