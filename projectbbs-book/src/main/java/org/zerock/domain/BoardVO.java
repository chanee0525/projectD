package org.zerock.domain;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
public class BoardVO {
	
	private Integer bno;
	private String title, content;
	private Date regdate, updatedate;
	private int viewcnt, replycnt;
	private String[] files;

}
