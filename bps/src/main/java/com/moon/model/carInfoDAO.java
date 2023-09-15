package com.moon.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.moon.db.SqlSessionManager;

public class carInfoDAO {

	SqlSessionFactory sqlSessionFactory
	=SqlSessionManager.getsqlSession();
	
	
	ArrayList<carInfo> list = new ArrayList<>();
	public ArrayList<carInfo> showcar() {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("carList");

		sqlSession.close();

		return list;
	}

	public ArrayList<carInfo> searchcar(String carname) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("carsearch", carname);

		sqlSession.close();

		return list;
	}
	
}
