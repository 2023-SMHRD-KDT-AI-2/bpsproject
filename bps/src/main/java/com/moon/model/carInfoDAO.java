package com.moon.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.moon.db.SqlSessionManager;

public class carInfoDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getsqlSession();
	
	
	public ArrayList<carInfo> showcar() {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		ArrayList<carInfo> list = (ArrayList) sqlSession.selectList("carList");

		sqlSession.close();

		return list;
	}
	

	public ArrayList<carInfo> searchcar(String carname) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		ArrayList<carInfo> list = (ArrayList) sqlSession.selectList("carsearch", carname);

		sqlSession.close();

		return list;
	}
	
	
	public ArrayList<carInfo> searchManufacturer(String manufac) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		ArrayList<carInfo> list = (ArrayList) sqlSession.selectList("manusearch", manufac);
		
		sqlSession.close();
		
		return list;
	}
	
	public int carSign(carInfo carInfo) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("carSign", carInfo);

		sqlSession.close();

		return cnt;

	}
	
	
	
	
}
