package com.spring.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.command.CheckModifyCommand;
import com.spring.command.CheckRegistCommand;
import com.spring.command.CheckSearchListCommand;
import com.spring.command.MailRequestCommand;
import com.spring.dto.AttachVO;
import com.spring.dto.CheckVO;
import com.spring.message.MimeAttachNotifier;
import com.spring.service.CheckService;

@Controller
@RequestMapping("check")
public class CheckController {
	
	@Autowired
	private MimeAttachNotifier notifier;
	
	@Resource(name = "checkService")
	private CheckService checkService;

	@Resource(name = "uploadAttachFileUrl")
	private String uploadAttachFileUrl;
	
	@GetMapping("/main")
	public void main() {
	}
	
	@GetMapping("/form")
	public void mailGet() throws Exception{}
	
	@PostMapping(value="/sendMail", produces="text/plain;charset=utf-8")
	public String mailPost(MailRequestCommand mailReq, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		
		String url="redirect:/check/success";
	   
		MultipartFile attach=mailReq.getFile();
		String uploadPath= request.getServletContext().getRealPath("/resources/mail_attach");
	      
	    //파일유무
	    if(attach!=null && !attach.isEmpty()){
	    	//파일의크기
	        if(attach.getSize()<1024*1024*5){
	        	//파일저장
	            File file = new File(uploadPath,attach.getOriginalFilename());
	            file.mkdirs();            
	            
	            attach.transferTo(file);
	            
	         }else { //용량초과            
	            url="redirect:/check/fail";
	            rttr.addFlashAttribute("message","첨부파일이 용량초과 입니다.");
	            
	            return url;
	         }
	         //메일 메세지 보내기
	         try {
	            notifier.sendMail(mailReq, uploadPath);
	            rttr.addFlashAttribute("mailRequest", mailReq);
	         }catch(Exception e) {
	            e.printStackTrace();
	            url="redirect:/check/fail";
	            rttr.addFlashAttribute("message","메일 보내기를 실패했습니다.");
	         }
	    }
	    return url;
	}
	   
	@GetMapping("/success")
	public void mailSuccess() {}
	   
	@GetMapping("/fail")
	public void mailFail() {}
	
	@GetMapping("/list")
	public ModelAndView list (CheckSearchListCommand command, ModelAndView mnv) throws SQLException {
		
		String url = "/check/list";
		
		Map<String, Object> dataMap = checkService.getSearchCheck(command);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/detailnatural")
	public ModelAndView datailnatural (int checkNum, @RequestParam(defaultValue = "") String from, RedirectAttributes rttr, ModelAndView mnv) throws SQLException{ 
		
		String url = "/check/detailnatural";
		
		CheckVO check = null;
		
		if(from.equals("list")) {
			check = checkService.read(checkNum);
			url = "redirect:/check/detailnatural.do";
			
			rttr.addAttribute("checkNum", checkNum);
			mnv.setViewName(url);
			return mnv;
		}
		
		check = checkService.getCheck(checkNum);
		
		// 파일명 재정의
		if(check != null) {
			List<AttachVO> attachList = check.getAttachList();
			if(attachList != null) {
				for(AttachVO attach : attachList) {
					String attachFileName = attach.getAttachFileName().split("\\$\\$")[1];
					attach.setAttachFileName(attachFileName);
				}
			}
		}
		mnv.addObject("check", check);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/getFile")
	public String getFile(int attachNum, Model model)throws Exception{
		String url = "downloadFile";
		
		AttachVO attach = checkService.getAttachByAttachNum(attachNum);
		
		model.addAttribute("savedAttachFileUrl", attach.getAttachFileUrl());
		model.addAttribute("attachFileName", attach.getAttachFileName());
		
		return url;
	}
	
	@GetMapping("/detailgear")
	public ModelAndView detailgear (int checkNum, @RequestParam(defaultValue = "") String from, RedirectAttributes rttr, ModelAndView mnv) throws SQLException{ 
		
		String url = "/check/detailgear";

		CheckVO check = null;
		
		if(from.equals("list")) {
			check = checkService.read(checkNum);
			url = "redirect:/check/detailgear.do";
			
			rttr.addAttribute("checkNum", checkNum);
			mnv.setViewName(url);
			return mnv;
		}
		
		check = checkService.getCheck(checkNum);
		
		// 파일명 재정의
		if(check != null) {
			List<AttachVO> attachList = check.getAttachList();
			if(attachList != null) {
				for(AttachVO attach : attachList) {
					String attachFileName = attach.getAttachFileName().split("\\$\\$")[1];
					attach.setAttachFileName(attachFileName);
				}
			}
		}
		mnv.addObject("check", check);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/modifyFormnatural")
	public ModelAndView modifyFormnatural (int checkNum, ModelAndView mnv) throws SQLException{ 
		
		String url = "/check/modifynatural";
		
		CheckVO check = checkService.getCheck(checkNum);
		
		// 파일명 재정의
		if(check != null) {
			List<AttachVO> attachList = check.getAttachList();
			if(attachList != null) {
				for(AttachVO attach : attachList) {
					String attachFileName = attach.getAttachFileName().split("\\$\\$")[1];
					attach.setAttachFileName(attachFileName);
				}
			}
		}
		mnv.addObject("check", check);
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping(value="/modifynatural", produces="text/plain;charset=utf-8")
	public String modifynatural (CheckModifyCommand modifyReq, RedirectAttributes rttr) throws Exception{ 
		
		String url = "redirect:/check/detailnatural.do";
		
		// 파일삭제
		if(modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
			for(int attachNum : modifyReq.getDeleteFile()) {
				AttachVO attach = checkService.getAttachByAttachNum(attachNum);
				
				String savedAttachFileUrl = attach.getAttachFileUrl().replace("/", File.separator);
				
				File deleteFile = new File(savedAttachFileUrl, attach.getAttachFileName());
				
				if(deleteFile.exists()) {
					deleteFile.delete(); // 파일삭제
				}
				checkService.removeAttachByAttachNum(attachNum); // DB에서 파일 삭제
			}
		}
	
		// 파일저장
		List<AttachVO> attachList = savedMultipartFileToAttaches(modifyReq.getUploadFile(), uploadAttachFileUrl);
		
		// CheckVO 셋팃
		CheckVO check = modifyReq.toCheckVO();
		check.setAttachList(attachList);
		
		// DB 저장
		checkService.modifyCheck(check);
		
		rttr.addFlashAttribute("from", "modifynatural");
		rttr.addAttribute("checkNum", check.getCheckNum());
		
		return url;
	}
	
	@GetMapping("/modifyFormgear")
	public ModelAndView modifyFormgear (int checkNum, ModelAndView mnv) throws SQLException{ 
		
		String url = "/check/modifygear";

		CheckVO check = checkService.getCheck(checkNum);
		
		// 파일명 재정의
		if(check != null) {
			List<AttachVO> attachList = check.getAttachList();
			if(attachList != null) {
				for(AttachVO attach : attachList) {
					String attachFileName = attach.getAttachFileName().split("\\$\\$")[1];
					attach.setAttachFileName(attachFileName);
				}
			}
		}
		mnv.addObject("check", check);
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping("/modifygear")
	public String modifygear (CheckModifyCommand modifyReq, RedirectAttributes rttr) throws Exception{ 
		
		String url = "redirect:/check/detailgear.do";

		// 파일삭제
		if(modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
			for(int attachNum : modifyReq.getDeleteFile()) {
				AttachVO attach = checkService.getAttachByAttachNum(attachNum);
				
				String savedAttachFileUrl = attach.getAttachFileUrl().replace("/", File.separator);
				
				File deleteFile = new File(savedAttachFileUrl, attach.getAttachFileName());
				
				if(deleteFile.exists()) {
					deleteFile.delete(); // 파일삭제
				}
				checkService.removeAttachByAttachNum(attachNum); // DB에서 파일 삭제
			}
		}
	
		// 파일저장
		List<AttachVO> attachList = savedMultipartFileToAttaches(modifyReq.getUploadFile(), uploadAttachFileUrl);
		
		// CheckVO 셋팃
		CheckVO check = modifyReq.toCheckVO();
		check.setAttachList(attachList);
		
		// DB 저장
		checkService.modifyCheck(check);
		
		rttr.addFlashAttribute("from", "modifygear");
		rttr.addAttribute("checkNum", check.getCheckNum());
		
		return url;
	}

		
	@GetMapping("/registFormnatural")
	public String registFormnatural () throws Exception{ 
		
		String url = "/check/registnatural";
		
		return url;
	}
	
	@PostMapping(value = "/registnatural", produces = "text/plain;charset=utf-8")
	public String registnatural (CheckRegistCommand command, RedirectAttributes rttr) throws Exception{		
		String url = "check/registnaturalsuccess";
		
		List<MultipartFile> multiFiles = command.getUploadFile();
		String savedAttachFileUrl = this.uploadAttachFileUrl;
		
		// 파일저장 > attachVO > list.add
		List<AttachVO> attachList = savedMultipartFileToAttaches(multiFiles, savedAttachFileUrl);
		
		// DB 저장
		CheckVO check = command.toCheckVO();
		check.setAttachList(attachList);
		checkService.registCheck(check);
		rttr.addFlashAttribute("from", "registnatural");		
		return url;
	}

	private List<AttachVO> savedMultipartFileToAttaches(List<MultipartFile> multiFiles, String attachFileUrl) throws Exception {

		if (multiFiles == null)
			return null;

		// 저장 > attachVO > list.add
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		
		for (MultipartFile multi : multiFiles) {
			// 파일저장
			String attachFileName = UUID.randomUUID().toString() + "$$" + multi.getOriginalFilename();

			File target = new File(attachFileUrl, attachFileName);
			target.mkdirs();
			multi.transferTo(target);

			// 저장 > attachVO
			AttachVO attach = new AttachVO();
			attach.setAttachFileUrl(attachFileUrl);
			attach.setAttachFileName(attachFileName);
			attach.setAttachFileType(attachFileName.substring(attachFileName.lastIndexOf('.') + 1).toUpperCase());

			attachList.add(attach);
		}

		return attachList;

	}
	
	@GetMapping("/registFormgear")
	public String registFormgear () throws Exception{ 
		
		String url = "/check/registgear";
		
		return url;
	}
	
	@PostMapping(value = "/registgear", produces = "text/plain;charset=utf-8")
	public String registgear (CheckRegistCommand command, RedirectAttributes rttr) throws Exception{ 
		
		String url = "check/registgearsuccess";
		
		List<MultipartFile> multiFiles = command.getUploadFile();
		String savedAttachFileUrl = this.uploadAttachFileUrl;
		
		// 파일저장 > attachVO > list.add
		List<AttachVO> attachList = savedMultipartFileToAttaches(multiFiles, savedAttachFileUrl);
		
		// DB 저장
		CheckVO check = command.toCheckVO();
		check.setAttachList(attachList);
		checkService.registCheck(check);
		rttr.addFlashAttribute("from", "registgear");		
		return url;
	}
	
	@GetMapping("/removenatural")
	public String removenaturalsuccess(int checkNum, RedirectAttributes rttr) throws Exception {
		
		String url ="check/removenaturalsuccess";
		
		// 첨부파일 삭제
		List<AttachVO> attachList = checkService.getCheck(checkNum).getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				File target = new File(attach.getAttachFileUrl(), attach.getAttachFileName());
				if(target.exists()) {
					target.delete(); // 파일삭제
				}
			}
		}
		checkService.removeCheck(checkNum);
		rttr.addFlashAttribute("from", "removenatural");
		rttr.addAttribute("checkNum", checkNum);
		return url;
	}
	
	@GetMapping("/removegear")
	public String removegearsuccess(int checkNum, RedirectAttributes rttr) throws Exception {
		
		String url ="check/removegearsuccess";
		
		// 첨부파일 삭제
		List<AttachVO> attachList = checkService.getCheck(checkNum).getAttachList();
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				File target = new File(attach.getAttachFileUrl(), attach.getAttachFileName());
				if(target.exists()) {
					target.delete(); // 파일삭제
				}
			}
		}
		checkService.removeCheck(checkNum);
		rttr.addFlashAttribute("from", "removegear");
		rttr.addAttribute("checkNum", checkNum);
		return url;
	}
}