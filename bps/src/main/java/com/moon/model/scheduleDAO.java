package com.moon.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.moon.db.SqlSessionManager;
public class scheduleDAO {
	SqlSessionFactory sqlSessionFactory
	=SqlSessionManager.getsqlSession();
	
	public List<schedule> scheduleSelectByDate(String data) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<schedule> result = sqlSession.selectList("scheduleSelect", data);

		sqlSession.close();

		return result;
	}
	
	public schedule scheduleSelectById(String data) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		schedule result = sqlSession.selectOne("scheduleSelectById", data);

		sqlSession.close();

		return result;
	}

	public int scheduleInsert(schedule check) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int num = sqlSession.insert("scheduleInsert", check);

		sqlSession.close();

		return num;
	}
	
	public int scheduleTestInsert() {
		schedule test = new schedule();
		test.setDepartment("a");
		test.setName("b");
		test.setEmployee_id("c");
		test.setTitle("d");
		test.setDetail("e");
		test.setAdd_date("2023-4-18");
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int num = sqlSession.insert("scheduleInsert", test);

		sqlSession.close();
		
		return num;
	}
}
