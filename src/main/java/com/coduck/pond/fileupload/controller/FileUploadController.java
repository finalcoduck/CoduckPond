package com.coduck.pond.fileupload.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.oauth2.GrantType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.coduck.pond.fileupload.service.FileUploadService;
import com.coduck.pond.fileupload.vo.FileUploadVo;

@Controller
public class FileUploadController {
	@Autowired
	private FileUploadService fileUploadService;
	
	/*
	 * form태그로 전송된 파일 처리
	 */
	@RequestMapping(value="/fileUpload/insertFile", method=RequestMethod.POST)
	public String fileInsert(int groupNum,int refBoardNum,MultipartFile file1, HttpSession session) {
		String uploadPath = session.getServletContext().getRealPath("/resources/upload");
		System.out.println("uploadPath:"+uploadPath);
		
		String orgFileName = file1.getOriginalFilename(); //전송된 파일명
		String saveFileName = UUID.randomUUID()+"_"+ orgFileName; //저장할 파일명
		
		try {
			InputStream is = file1.getInputStream();
			FileOutputStream fos = new FileOutputStream(uploadPath + "//" + saveFileName);
			FileCopyUtils.copy(is, fos); //spring에 있는 복사 기능
			is.close();
			fos.close();
			System.out.println("파일업로드 ~ 성공");
			
			long fileSize = file1.getSize(); //파일크기 얻어오기
			FileUploadVo vo = new FileUploadVo(0, groupNum, refBoardNum, orgFileName, saveFileName, fileSize);
			System.out.println(vo);
			fileUploadService.insertFileInfo(vo); //파일 정보 인서트
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "fileupload";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletResponse response) {
		return "fileupload";
	}
}
