package com.moon.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.moon.db.SqlSessionManager;

public class departDAO {

SqlSessionFactory sqlSessionFactory = SqlSessionManager.getsqlSession();
	
	
	ArrayList<Depart> list = new ArrayList<>();
	
	public ArrayList<Depart> departinfoList(Depart dp) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("departinfo", dp);

		sqlSession.close();

		return list;
	}
	
	public int departInsert (Depart dp) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("departinsert", dp);

		sqlSession.close();

		return cnt;
	}
	
	public Depart departCheck (Depart dp) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		Depart cnt = sqlSession.selectOne("departCheck", dp);

		sqlSession.close();

		return cnt;
	}
	
	
	public ArrayList<Depart> departDetailed(Depart dp) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("departInformation", dp);

		sqlSession.close();

		return list;
	}
	
	public int departDel(Depart dp) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int list = sqlSession.delete("departDel", dp);

		sqlSession.close();

		return list;
	}
	
	public int departUp(Depart dp) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int list = sqlSession.delete("departUp", dp);

		sqlSession.close();

		return list;
	}
	
	public ArrayList<Depart> depart_ListUp (Depart dp) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("depart_info_list", dp);

		sqlSession.close();

		return list;
	}
	
}
