package org.cao.mapperdao;

import java.util.List;

import org.cao.dto.City;

/**
**1:@作者:曹子良
**2:@时间:2018年1月13日上午9:32:56
**3:@功能:
**/
public interface UserMapperdao {

	List<City> findprovice(Integer id);

	int getCountName(String name);

}
