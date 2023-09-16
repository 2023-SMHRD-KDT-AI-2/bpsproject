package com.moon.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.ArrayList;

import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ExecutorType;

import org.apache.ibatis.session.TransactionIsolationLevel;


import com.moon.db.SqlSessionManager;


public class UserInfoDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getsqlSession();

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
	
	
	
	
	
	
	public login info_data (login info) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		info = sqlSession.selectOne("login", info);

		sqlSession.close();

		return info;
	}

	
	public login user_id (login info) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		info = sqlSession.selectOne("user_id", info);

		sqlSession.close();

		return info;
	}
//	public String login(userInfo user) {
//
//		SqlSession sqlSession = sqlSessionFactory.openSession(true);
//
//		// sqlSession.selectOne(null); -> 실행 결과가 하나만 확인되는 경우
//		// sqlSession.selectList(null); -> 실행 결과가 여러개 확인되는 경우
//
//		String name = sqlSession.selectOne("login", user);
//
//		sqlSession.close();
//
//		return name;
//	}

}
