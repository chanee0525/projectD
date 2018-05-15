package org.zerock.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.Data;


@Repository
public class BoardDAOImpl {
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.mapper.BoardMapper";
	
	
	
	
	

}
