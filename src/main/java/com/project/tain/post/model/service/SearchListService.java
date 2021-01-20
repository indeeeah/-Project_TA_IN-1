package com.project.tain.post.model.service;

import java.util.List;

import com.project.tain.post.model.domain.SearchList;

public interface SearchListService {

	List<SearchList> showHashTag(String hashtag);

	int showHashTagCount(String hashtag);

	List<SearchList> showHashTagPage(String hashtag, int startPage, int limit);
}
