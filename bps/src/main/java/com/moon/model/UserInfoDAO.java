package com.moon.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.moon.db.SqlSessionManager;

public class UserInfoDAO {
	
	SqlSessionFactory sqlSessionFactory
	=SqlSessionManager.getsqlSession();
	
	public int join(userInfo user) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.insert("join", user);
		
		sqlSession.close();
		
		return cnt;
	}
	
	public int adminJoin(userInfo user) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.insert("adminJoin", user);
		
		sqlSession.close();
		
		return cnt;
		
	}
	
	
	

}
