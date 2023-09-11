package com.moon.db;

import java.io.InputStream;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	
	
	
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		
		try {
			
			String resource
			="com/moon/db/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory =
			  new SqlSessionFactoryBuilder().build(inputStream);

		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		
		
		
		
	}
	
	public static SqlSessionFactory getsqlSession() {
		return sqlSessionFactory;
	}
	
	
	
	
	

}
