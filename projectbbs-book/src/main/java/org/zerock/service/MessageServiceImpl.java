package org.zerock.service;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.zerock.domain.MessageVO;
import org.zerock.persistence.MessageDAO;
import org.zerock.persistence.PointDAO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDAO messageDAO;
	
	@Inject
	private PointDAO pointDAO;
	
	@Override
	public void addMessage(MessageVO vo) throws Exception {
	
		log.info("vo..."+vo);
	messageDAO.create(vo);
	
	log.info("vo get sender..."+vo.getSender());
	pointDAO.updatePoint(vo.getSender(), 10);

	}

	@Override
	public MessageVO readMessage(String uid, Integer mid) throws Exception {
		
		messageDAO.updateState(mid);
		pointDAO.updatePoint(uid, 5);

		
		return messageDAO.readMessage(mid);
	}

}
