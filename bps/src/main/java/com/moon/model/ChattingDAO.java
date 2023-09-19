package com.moon.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.moon.db.SqlSessionManager;

public class ChattingDAO {

	
	SqlSessionFactory sqlSessionFactory
	=SqlSessionManager.getsqlSession();
	
	public int chat_room_in(ChattingDTO chat_room) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("chat_room_in", chat_room);

		sqlSession.close();

		return cnt;
	}
	
	public int chat_mes_in(ChattingDTO chat_mes) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("chat_mes_in", chat_mes);

		sqlSession.close();

		return cnt;
	}
	
	
	ArrayList<ChattingDTO> list = new ArrayList<>();
	
	public ArrayList<ChattingDTO> show_mes (ChattingDTO show) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("show_mes", show);

		sqlSession.close();

		return list;
	}
	
	public ArrayList<ChattingDTO> show_room (ChattingDTO show) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("show_room", show);

		sqlSession.close();

		return list;
	}
	
}