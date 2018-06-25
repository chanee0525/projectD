package org.zerock.domain;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
public class BoardVO {
	
	public Integer bno;
	public String title, content;
	public Date regdate, updatedate;
	public int viewcnt, replycnt;

}
