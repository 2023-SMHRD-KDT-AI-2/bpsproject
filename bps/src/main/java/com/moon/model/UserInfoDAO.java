package com.moon.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.ArrayList;

import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ExecutorType;

import org.apache.ibatis.session.TransactionIsolationLevel;

import com.moon.db.SqlSessionManager;

public class UserInfoDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getsqlSession();

	public int join(userInfo user) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("join", user);

		sqlSession.close();

		return cnt;
	}

	public int adminJoin(userInfo user) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("adminJoin", user);

		sqlSession.close();

		return cnt;

	}

	public login info_data(login info) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		info = sqlSession.selectOne("login", info);

		sqlSession.close();

		return info;
	}

	public login user_id(login info) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		info = sqlSession.selectOne("user_id", info);

		sqlSession.close();

		return info;
	}

	ArrayList<login> lists = new ArrayList<>();

	public ArrayList<login> user_id_pw(login info) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		lists = (ArrayList) sqlSession.selectList("user_id_pw", info);

		sqlSession.close();

		return lists;
	}

	public ArrayList<login> user_id2(String id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		lists = (ArrayList) sqlSession.selectList("myPage", id);

		sqlSession.close();

		return lists;
	}

	

	public ArrayList<login> find_id(login info) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		lists = (ArrayList) sqlSession.selectList("find_id", info);

		sqlSession.close();

		return lists;
	}

	ArrayList<userInfo> list = new ArrayList<>();

	public ArrayList<userInfo> dateList(String compNum) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("date_null_list", compNum);

		sqlSession.close();

		return list;
	}

	public ArrayList<userInfo> datenotList(String compNum) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("date_not_null_list", compNum);

		sqlSession.close();

		return list;
	}

	public ArrayList<userInfo> detailed(String email) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		list = (ArrayList) sqlSession.selectList("information", email);

		sqlSession.close();

		return list;
	}

	public int app_info_Up(userInfo info) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int list = sqlSession.update("app_info", info);

		sqlSession.close();

		return list;
	}

	public int app_del(userInfo info) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int list = sqlSession.delete("app_del", info);

		sqlSession.close();

		return list;
	}

	public int app_Up(userInfo info) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int list = sqlSession.update("app_Up", info);

		sqlSession.close();

		return list;
	}

	public int profile(userInfo info) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int list = sqlSession.update("profile", info);

		sqlSession.close();

		return list;
	}

	public int p_profile(userInfo info) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int list = sqlSession.update("p_profile", info);

		sqlSession.close();

		return list;
	}

	public int pw_profile(userInfo info) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int list = sqlSession.update("pw_profile", info);

		sqlSession.close();

		return list;
	}

//	public String login(userInfo user) {
//
//		SqlSession sqlSession = sqlSessionFactory.openSession(true);
//
//		// sqlSession.selectOne(null); -> 실행 결과가 하나만 확인되는 경우
//		// sqlSession.selectList(null); -> 실행 결과가 여러개 확인되는 경우
//
//		String name = sqlSession.selectOne("login", user);
//
//		sqlSession.close();
//
//		return name;
//	}

}
