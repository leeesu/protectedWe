package org.protectedog.service.user;

import java.util.Map;

import org.protectedog.common.Search;
import org.protectedog.service.domain.User;

public interface UserService {

	//ȸ������(�⺻����)
	public void addUsersBase(User user) throws Exception;
	
	//ȸ������(�߰�����)
	public void addUsersAdditional(User user) throws Exception;
	
	//�α���, ����������
	public User getUsers(String id) throws Exception;
	
	//��üȸ������
	public Map<String, Object> getUsersList(Search search) throws Exception;
	
	//ȸ����������
	public void updateUsers(User user) throws Exception;
	
	//���̵� �ߺ�üũ
	public int checkDuplication(String id) throws Exception;
	
}