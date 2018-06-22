package org.zerock.domain;



import java.util.Date;

import lombok.Data;

@Data
public class MessageVO {
	
	private Integer mid;  
	private String targetid, sender, message;
	private Date opendate, senddate;

}
