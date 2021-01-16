package com.project.tain.util;

import java.util.ArrayList;
import java.util.List;

// 해시태그 split후 배열에 넣기
public class Utils {
	public static List<String> tagParser(String tags){
		String temp[] = tags.split("#");
		
		List<String> tagList = new ArrayList<String>();
		
		int len = temp.length;
		
		for(int i =1; i<len; i++) {
			tagList.add(temp[i]);
			System.out.println("tagList : "+temp[i]);
		}
		return tagList;
	}
}
