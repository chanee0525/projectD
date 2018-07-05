package org.zerock.dto;

import lombok.Data;

@Data
public class LoginDTO {
	
	private String uid, upw;
	private boolean useCookie;
	

}
