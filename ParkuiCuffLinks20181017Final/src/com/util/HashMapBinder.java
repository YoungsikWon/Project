package com.util;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

/*
 * 공통코드를 작성해 봅시다.
 * 1)파라미터가 필요한가? - yes(왜? )
 * 힌트:누가 언제 어떤 클래스에서 인스턴스화를 해야하는거지?
 *     어떤 시점에서 필요한 걸까?
 *     
 */
public class HashMapBinder {
	Logger logger = Logger.getLogger(HashMapBinder.class);
	HttpServletRequest req = null;
	int i = 0;
	public HashMapBinder(HttpServletRequest req) {
		this.req = req;
	}
	public void bind(Map<String,Object> pMap){//외부에서 객체 생성이 되었다.
		Enumeration<String> en = 
				req.getParameterNames();
		while(en.hasMoreElements()) {
			String key = en.nextElement();
		
			pMap.put(key, HangulConversion.toUTF((String)pMap.get(key)));
		}
	}
}









