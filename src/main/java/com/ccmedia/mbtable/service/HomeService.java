package com.ccmedia.mbtable.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ccmedia.mbtable.mapper.CrudMapper;

@Transactional
@Service
@SuppressWarnings("rawtypes")
public class HomeService {
	@Autowired
	private CrudMapper crudMapper;

	public int create(Map mapReq) throws Exception {
		return crudMapper.c(mapReq);
	}
	
	public List<Map> read() throws Exception {
		return crudMapper.r();
	}

	public int update(Map mapReq) throws Exception {
		return crudMapper.u(mapReq);
	}

	public int delete(Map mapReq) throws Exception {
		return crudMapper.d(mapReq);
	}
}
