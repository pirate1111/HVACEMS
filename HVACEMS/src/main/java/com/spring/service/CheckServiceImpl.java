package com.spring.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.command.CheckSearchListCommand;
import com.spring.command.CheckPageMaker;
import com.spring.dao.AttachDAO;
import com.spring.dao.CheckDAO;
import com.spring.dto.AttachVO;
import com.spring.dto.CheckVO;

public class CheckServiceImpl implements CheckService{
	
	private CheckDAO checkDAO;
	public void setCheckDAO(CheckDAO checkDAO) {
		this.checkDAO = checkDAO;
	}
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}

	private void addAttachList(CheckVO check) throws SQLException { 
		if(check == null)
			return;
		
		int checkNum = check.getCheckNum();                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
		List<AttachVO> attachList = attachDAO.selectAttachesByCheckNum(checkNum);
		
		check.setAttachList(attachList);
	}
	
	@Override
	public Map<String, Object> getSearchCheck(CheckSearchListCommand command) throws SQLException {

		List<CheckVO> checkList = checkDAO.selectSearchCheck(command);

		if(checkList != null)
			for(CheckVO check : checkList)
				addAttachList(check);
		
		CheckPageMaker pageMaker = new CheckPageMaker();
		pageMaker.setCommand(command);
		pageMaker.setTotalCount(checkDAO.selectSearchCheckCount(command));

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("checkList", checkList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}
	
	@Override
	public CheckVO read(int checkNum) throws SQLException {
		CheckVO check = checkDAO.selectCheckByCheckNum(checkNum);
		checkDAO.increaseCheckCnt(checkNum);
		addAttachList(check);
		return check;
	}

	@Override
	public CheckVO getCheck(int checkNum) throws SQLException {
		CheckVO check = checkDAO.selectCheckByCheckNum(checkNum);
		addAttachList(check);
		return check;
	}

	@Override
	public void registCheck(CheckVO check) throws SQLException {
		int checkNum = checkDAO.selectCheckSeqNext();
		
		check.setCheckNum(checkNum);
		checkDAO.insertCheck(check);
		
		if(check.getAttachList() != null)
			for(AttachVO attach : check.getAttachList()) {
				attach.setCheckNum(checkNum);
				attach.setAdminId(check.getAdminId());
				attachDAO.insertAttach(attach);
			}
	}

	@Override
	public void modifyCheck(CheckVO check) throws SQLException {
		checkDAO.updateCheck(check);
		
		if(check.getAttachList() != null)
			for(AttachVO attach : check.getAttachList()) {
				attach.setCheckNum(check.getCheckNum());
				attach.setAdminId(check.getAdminId());
				attachDAO.insertAttach(attach);
			}
	}

	@Override
	public void removeCheck(int checkNum) throws SQLException {
		checkDAO.deleteCheck(checkNum);
	}

	@Override
	public AttachVO getAttachByAttachNum(int attachNum) throws SQLException {
		AttachVO attach = attachDAO.selectAttachByAttachNum(attachNum);
		return attach;
	}

	@Override
	public void removeAttachByAttachNum(int attachNum) throws SQLException {
		attachDAO.deleteAttach(attachNum);		
	}
}