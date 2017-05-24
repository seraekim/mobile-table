package com.ccmedia.mbtable.mapper;

import java.util.List;
import java.util.Map;

@SuppressWarnings("rawtypes")
public interface CrudMapper {
	int c(Map mapReq);
	List<Map> r();
	int u(Map mapReq);
	int d(Map mapReq);
	int cnt(Map mapReq);
}
