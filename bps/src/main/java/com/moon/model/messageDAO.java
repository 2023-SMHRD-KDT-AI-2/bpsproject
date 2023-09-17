package com.moon.model;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.moon.db.SqlSessionManager;
import com.moon.model.message;

public class messageDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getsqlSession();
	
	
	
	
	public int sendmsg(message msg) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("sendmsg", msg);

		sqlSession.close();

		return cnt;

	}
	
	// 메세지 출력 기능
	
	ArrayList<message> msglist = new ArrayList<>();
	
	public ArrayList<message> msglist(String name) {
		
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		msglist = (ArrayList) sqlSession.selectList("msglist");
		
		sqlSession.close();
		
		return msglist;
	}
	
	public message msgdetail(String num) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		message msg = sqlSession.selectOne("detail",num);
		sqlSession.close();
		return msg;
		
	}
	
	

}
	
	

