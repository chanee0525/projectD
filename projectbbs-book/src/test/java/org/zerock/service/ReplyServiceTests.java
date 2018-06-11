package org.zerock.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.controller.ReplyDAOTest;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyServiceTests {

	@Inject
	private ReplyService service;
	
/*	@Test
	public void listTest() throws Exception {
	log.info(service.listReply(1));	
	}
	*/
	@Test
	public void insertTest() throws Exception {
	
		ReplyVO vo = new ReplyVO();
		vo.setReplytext("테테테테스트");
		vo.setReplyer("리플리플러");
		vo.setBno(5072);
		
		service.addReply(vo);
		log.info(vo);
		
	}
	
	@Test
	public void pageTest() throws Exception {
		Criteria cri = new Criteria();
		cri.setPage(1);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		System.out.println(service.listReplyPage(5071, cri));
		
	}
	
	
	
	
}
