package com.moon.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.moon.db.SqlSessionManager;

import java.util.ArrayList;

public class NoticeBoardDAO {

SqlSessionFactory sqlSessionFactory = SqlSessionManager.getsqlSession();
	
	ArrayList<NoticeBoard> list = new ArrayList<>();
	
	public ArrayList<NoticeBoard> noticeList(String notice) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("noticeList", notice);

		sqlSession.close();

		return list;
	}

	public int noticeInsert (NoticeBoard board) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("noticeInsert", board);

		sqlSession.close();

		return cnt;
	}
	
	public int noticeDel(NoticeBoard board) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int list = sqlSession.delete("noticeDel", board);

		sqlSession.close();

		return list;
		
		
	}
		
	public ArrayList<NoticeBoard> noticelists(String compNum) {
		System.out.println(compNum);
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		list = (ArrayList) sqlSession.selectList("noticeSelect", compNum);
		System.out.println(list.size());
		sqlSession.close();
		
		return list;
	}
		
	public NoticeBoard detail(int num) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		NoticeBoard list = sqlSession.selectOne("selectDetail", num);

		sqlSession.close();

		return list;
	}
		
		
		
		
		
		
		
		
//		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
//
//			list = (ArrayList) sqlSession.selectList("noticeList", comp);
//		}
//		return list;
//	}
//
//	public int noticeInsert(NoticeBoard notice) {
//
//		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
//
//			int cnt = sqlSession.insert("noticeInsert", notice);
//
//			return cnt;
//		}
//	}
//
//	public int noticeDel(NoticeBoard notice) {
//
//		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
//
//			int result = sqlSession.delete("noticeDel", notice);
//
//			return result;
//		}
	
}
