package com.ccmedia.mbtable;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccmedia.mbtable.service.HomeService;

@Controller
@SuppressWarnings("rawtypes")
public class HomeController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private HomeService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public @ResponseBody int create(@RequestParam Map<String, Object> mapReq) {
		//List<Map> result = null;
		int affectedCnt = -1;
		try {
			logger.debug(""+mapReq);
			affectedCnt = service.create(mapReq);
			//result = doRead();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affectedCnt;
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public @ResponseBody List<Map> read() {
		return doRead();
	}
	
	private List<Map> doRead() {
		List<Map> result = null;
		try {
			result = service.read();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody int update(@RequestParam Map<String, Object> mapReq) {
		//List<Map> result = null;
		int affectedCnt = -1;
		try {
			logger.debug(""+mapReq);
			affectedCnt = service.update(mapReq);
			//result = doRead();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affectedCnt;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody int delete(@RequestParam Map<String, Object> mapReq) {
		//List<Map> result = null;
		int affectedCnt = -1;
		try {
			logger.debug(""+mapReq);
			affectedCnt = service.delete(mapReq);
			//result = doRead();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affectedCnt;
	}
}
