package com.cufflink.partners;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class MapTest {
	Map<String,Object> map;
	public void test() {
	map.put("key","value");
		
	Set set = map.keySet();
	Iterator iter = set.iterator();
	while(iter.hasNext()) {
		String key =(String)iter.next();
		System.out.println("key"+key);
	}
	for(String value : map.keySet()) {
		
	}
	}
	
	
}
