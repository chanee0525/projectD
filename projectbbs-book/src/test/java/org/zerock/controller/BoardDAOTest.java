package org.zerock.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.persistence.BoardDAO;

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
		vo.setTitle("테스트 제목3");
		vo.setContent("테스트 내용3");
		
		dao.create(vo);
		
	}
	
	@Test
	public void testread() throws Exception{
		
		log.info(dao.read(1).toString());
	}
	
	@Test
	public void testUpdate() throws Exception{
		BoardVO vo = new BoardVO();
		vo.setBno(1);
		vo.setTitle("수정 제목 테스트");
		vo.setContent("수정 본문 테스트");
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
	
	

}
