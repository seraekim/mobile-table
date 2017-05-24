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
		if(crudMapper.cnt(mapReq) == 0) {
			return crudMapper.c(mapReq);
		} else {
			return 0;
		}
	}
	
	public List<Map> read() throws Exception {
		return crudMapper.r();
	}

	public int update(Map mapReq) throws Exception {
		if(crudMapper.cnt(mapReq) == 1) {
			return crudMapper.u(mapReq);
		} else {
			return 0;
		}
	}

	public int delete(Map mapReq) throws Exception {
		if(crudMapper.cnt(mapReq) == 1) {
			return crudMapper.d(mapReq);
		} else {
			return 0;
		}
	}
	
//	public int cnt(Map mapReq) throws Exception {
//		return crudMapper.cnt(mapReq);
//	}
}
