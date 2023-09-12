package com.moon.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.moon.db.SqlSessionManager;

public class compInfoDAO {

	SqlSessionFactory sqlSessionFactory
	=SqlSessionManager.getsqlSession();
	
	
	ArrayList<compInfo> list = new ArrayList<>();
	public ArrayList<compInfo> showcomp() {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("compList");

		sqlSession.close();

		return list;
	}

	public ArrayList<compInfo> searchcomp(String compname) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("compsearch", compname);

		sqlSession.close();

		return list;
	}
	
}
