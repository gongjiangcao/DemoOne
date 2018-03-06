package org.cao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.cao.dto.City;
import org.cao.mapperdao.UserMapperdao;
import org.cao.service.UserServie;
import org.springframework.stereotype.Service;

/**
**1:@作者:曹子良
**2:@时间:2018年1月13日上午9:31:22
**3:@功能:
**/
@Service
public class UserServieImpl implements UserServie {

	@Resource
	private UserMapperdao  userMapperdao;

	@Override
	public List<City> findprovice(Integer id) {
		
		
		return userMapperdao.findprovice(id);
		
	}

	@Override
	public int getCountName(String name) {
		
		
		return userMapperdao.getCountName(name);
		
	}
}
