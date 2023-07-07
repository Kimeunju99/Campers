package com.idle.campers.common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DataSource {
	private static SqlSessionFactory sessionFactory;
	private DataSource() {}
	
	public static SqlSessionFactory getInstance() {
		String resource = "config/mybatis-config.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sessionFactory;
	}
}
