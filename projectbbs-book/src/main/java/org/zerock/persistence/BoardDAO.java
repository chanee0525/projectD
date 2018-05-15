package org.zerock.persistence;



import java.util.List;

import org.zerock.domain.BoardVO;

import lombok.Data;

public interface BoardDAO {
	
	public void create(BoardVO vo) throws Exception;
	public BoardVO read(Integer vo) throws Exception;
	public void update(BoardVO vo) throws Exception;
	public void delete(Integer vo) throws Exception;
	public List<BoardVO> ListAll() throws Exception;

}
