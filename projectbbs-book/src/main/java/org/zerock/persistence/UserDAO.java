
package org.zerock.persistence;

import java.util.Date;

import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;

public interface UserDAO {
	
	public UserVO login(LoginDTO dto) throws Exception;
	public void keeplogin(String uid, String sessionId, Date next);
	public UserVO checkUserWithSessionkey(String value);

}