package com.moon.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.moon.db.SqlSessionManager;

public class PositionDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getsqlSession();
	
	
	ArrayList<position> list = new ArrayList<>();
	public ArrayList<position> positionList(String compNum) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("positioninfo", compNum);

		sqlSession.close();

		return list;
	}
	
	public int positioninsert (position posi) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("positioninsert", posi);

		sqlSession.close();

		return cnt;
	}
	
	public position positionCheck (position posi) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		position cnt = sqlSession.selectOne("positionCheck", posi);

		sqlSession.close();

		return cnt;
	}
	
	
	public ArrayList<position> positionDetailed(position posi) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("positionInformation", posi);

		sqlSession.close();

		return list;
	}
	
	public int positionDel(position posi) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int list = sqlSession.delete("positionDel", posi);

		sqlSession.close();

		return list;
	}
	
	public int positionUp(position posi) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int list = sqlSession.delete("positionUp", posi);

		sqlSession.close();

		return list;
	}
	
	public ArrayList<position> position_info_List(String compNum) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("position_info_list", compNum);

		sqlSession.close();

		return list;
	}
	
	
	
}
