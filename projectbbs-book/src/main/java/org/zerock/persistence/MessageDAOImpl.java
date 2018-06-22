package org.zerock.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.MessageVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository
public class MessageDAOImpl implements MessageDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.mapper.MessageMapper";

	@Override
	public void create(MessageVO vo) throws Exception {
		
		log.info("VO.................."+vo);
		session.insert(namespace+".create", vo);
		
	}

	@Override
	public MessageVO readMessage(Integer mid) throws Exception {
		return session.selectOne(namespace+".readMessage", mid);
	}

	@Override
	public void updateState(Integer mid) throws Exception {
		session.update(namespace+".updateState",mid);
		
	}
	
	
	

}
