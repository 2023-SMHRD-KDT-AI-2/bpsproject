package com.moon.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.moon.db.SqlSessionManager;

public class fileDriveDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getsqlSession();
	
	ArrayList<fileDrive> list = new ArrayList<>();
	
	public ArrayList<fileDrive> fileList(String comp) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("fileList", comp);

		sqlSession.close();

		return list;
	}

	public int fileInsert (fileDrive file) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("fileInsert", file);

		sqlSession.close();

		return cnt;
	}
	
	public int fileDel(fileDrive file) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int list = sqlSession.delete("fileDel", file);

		sqlSession.close();

		return list;
	}
}
