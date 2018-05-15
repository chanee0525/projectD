package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	public int bno, viewcnt;
	public String title, content;
	public Date regdate, updatedate;

}
