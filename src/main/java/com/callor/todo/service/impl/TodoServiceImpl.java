package com.callor.todo.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.callor.todo.model.TodoVO;
import com.callor.todo.persistance.TodoDao;
import com.callor.todo.service.TodoService;

@Service
public class TodoServiceImpl implements TodoService {

	@Autowired
	private TodoDao todoDao;

	@Override
	public List<TodoVO> findByUsername(String username) {
		return todoDao.findByUsername(username);
	}

	@Override
	public List<TodoVO> selectAll() {
		return todoDao.selectAll();
	}

	@Override
	public TodoVO findById(Long id) {
		return todoDao.findById(id);
	}

	@Override
	public int insert(TodoVO vo) {
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeForm = new SimpleDateFormat("HH:mm:SS");
		vo.setT_sdate(dateForm.format(date));
		vo.setT_stime(timeForm.format(date));
		return todoDao.insert(vo);
	}

	@Override
	public int update(TodoVO vo) {
		return 0;
	}

	@Override
	public int delete(Long id) {
		return 0;
	}

}