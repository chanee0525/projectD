package org.zerock.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
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
		vo.setTitle("테스트");
		vo.setContent("테스트테스트");

		dao.create(vo);

	}

	@Test
	public void testread() throws Exception {

		log.info(dao.read(2).toString());
	}

	@Test
	public void testUpdate() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setBno(20);
		vo.setTitle("���� ���� �׽�Ʈ");
		vo.setContent("���� ���� �׽�Ʈ");
		dao.update(vo);
	}

	@Test
	public void testDelete() throws Exception {

		dao.delete(1);

	}

	@Test
	public void testList() throws Exception {
		dao.listAll();
	}

	@Test
	public void testListPage() throws Exception {

		int page = 3;

		List<BoardVO> list = dao.listPage(3);

		for (BoardVO boardVO : list) {
			log.info(boardVO.getBno() + ":" + boardVO.getTitle());
		}

	}

	@Test
	public void testListCriteria() throws Exception {

		Criteria cri = new Criteria();

		cri.setPage(2);
		cri.setPerPageNum(20);

		List<BoardVO> list = dao.listCriteria(cri);

		for (BoardVO boardVO : list) {

			log.info(boardVO.getBno() + ":" + boardVO.getTitle());

		}

	}

	@Test
	public void TestURI() throws Exception {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().path("/board/read").queryParam("bno", 12)
				.queryParam("perPageNum", 20).build();

		log.info("/board/read?bno=12&perPageNum=20");
		log.info(uriComponents.toString());
	}

	@Test
	public void TestURI2() throws Exception {

		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.path("/{module}/{page}")
				.queryParam("bno", 12)
				.queryParam("perPageNum", 20)
				.build()
				.expand("board", "read")
				.encode();

		log.info("/board/read?bno=12&perPageNum=20");
		log.info(uriComponents.toString());
	}
	
	@Test
	public void testDynamic1() throws Exception{
		
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setkeyword("��");
		cri.setSearchType("t");
		
		log.info("*******************************************");
		
		List<BoardVO> list = dao.listSearch(cri);
		
		for (BoardVO boardVO : list) {
			log.info(boardVO.getBno() + ":" + boardVO.getTitle());
			
		}
		
		log.info("*********************************************");
		log.info("count:"+dao.listSearchCount(cri));
		
	}

}
