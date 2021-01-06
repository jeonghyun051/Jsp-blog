package com.cos.blog.service;

import com.cos.blog.domain.user.User;
import com.cos.blog.domain.user.UserDao;
import com.cos.blog.domain.user.dto.JoinReqDto;
import com.cos.blog.domain.user.dto.LoginReqDto;
import com.cos.blog.domain.user.dto.UpdateReqDto;

public class UserService {
	private UserDao userDao; 
	// 회원가입, 회원수정, 로그인, 아이디중복체크
	public UserService() {
		userDao = new UserDao();
	}
	
	//select결과를 받는게 아니라 성공했다, 못했다를 받기 때문에 0 또는 -1 리턴 
	public int 회원가입(JoinReqDto dto) {
		int result = userDao.save(dto);
		return result;
	}

	//아이디 비밀번호로 받은 값을 select 해서 한 행을 User model에 들어간다. 
	public User 로그인(LoginReqDto dto) {
		return userDao.findByUsernameAndPassword(dto);

	}

	//update 하는 것
	public int 회원수정(UpdateReqDto dto) {

		return -1;
	}

	//유저한테 아이디만 받기 떄문에 username만 받는다. 
	public int 유저네임중복체크(String username) {
		int result = userDao.findByUsername(username);
		return result;
	}
}