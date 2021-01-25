package com.project.tain.util;

import java.util.ArrayList;
import java.util.List;

// 해시태그 split후 배열에 넣기
public class Utils {
	public static List<String> tagParser(String tags){
		String temp[] = tags.split("#");
		System.out.println("유틸s"+temp[1]);
		List<String> tagList = new ArrayList<String>();
		
		int len = temp.length;
		
		for(int i =1; i<len; i++) {
			String str = temp[i].trim();
			tagList.add(str);
			System.out.println("tagList : "+str);
		}
		return tagList;
	}
}
