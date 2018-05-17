package org.zerock.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.persistence.BoardDAO;

import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class BoardDAOTest {
	
	@Inject
	private BoardDAO dao;
	
	
	@Test
	public void testCreate() throws Exception {
		
		BoardVO vo = new BoardVO();
		vo.setTitle("�׽�Ʈ ����3");
		vo.setContent("�׽�Ʈ ����3");
		
		dao.create(vo);
		
	}
	
	@Test
	public void testread() throws Exception{
		
		log.info(dao.read(2).toString());
	}
	
	@Test
	public void testUpdate() throws Exception{
		BoardVO vo = new BoardVO();
		vo.setBno(20);
		vo.setTitle("���� ���� �׽�Ʈ");
		vo.setContent("���� ���� �׽�Ʈ");
		dao.update(vo);	
	}
	
	@Test
	public void testDelete() throws Exception{
		
		dao.delete(1);
		
	}
	
	@Test
	public void testList() throws Exception{
		dao.listAll();
	}
	
	@Test
	public void testListPage() throws Exception{
		
		int page = 3;
		
		/*List<BoardVO> list = dao.listPage(page);
				
		for (BoardVO boardVO : list) {
			log.info(boardVO.getBno() + ":" + boardVO.getTitle());
		}*/
		dao.listPage(1).forEach(c -> log.info(c));
	}
}
		
		
	
	
	

