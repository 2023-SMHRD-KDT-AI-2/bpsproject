package com.moon.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.moon.db.SqlSessionManager;
public class attendDAO {
	SqlSessionFactory sqlSessionFactory
	=SqlSessionManager.getsqlSession();
	
	

	public int attend_in(attend check) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int num = sqlSession.insert("attend_in", check);

		sqlSession.close();

		return num;
	}

	public int attend_up (attend check) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int num = sqlSession.update("attend_up", check);

		sqlSession.close();

		return num;
	}
	
	ArrayList<attend> list = new ArrayList<>();
	
	public ArrayList<attend> attend_sele(attend att) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("attend_sel", att);

		sqlSession.close();

		return list;
	}
	
}


