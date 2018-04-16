package org.cao.controller;

import java.util.List;

import org.cao.dto.City;
import org.cao.service.UserServie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
**1:@作者:曹子良
**2:@时间:2018年1月13日上午9:28:49
**3:@功能:只是一个三级联动  
**/
@Controller
public class UserController {

	@Autowired
	private UserServie userServie;
	
	
	@RequestMapping("findprovince.do")
	@ResponseBody
	public List<City> findprovice(Integer pid){
		
		List<City> cityList  =	userServie.findprovice(pid);
		
		return cityList;
	}
	
	@RequestMapping("getCountName.do")	
	public @ResponseBody int getCountName(String name){
		
				
		return userServie.getCountName(name);
	}
	/********************************/
	public void say(){
		System.out.println("我修改了");
	}
	
}
