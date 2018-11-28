package com.bit.ms.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AdminStoreUploadController {

	private static final Logger logger = LoggerFactory.getLogger(AdminStoreUploadController.class);

	@Resource(name = "uploadPath")
	private String uploadPath;

	// 업로드된 파일을 저장하는 함수
	@SuppressWarnings("unused")
	private String uploadFile(String originalName, byte[] fileDate) throws IOException {

		UUID uid = UUID.randomUUID();

		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);

		// org.springframework.util 패키지의 FileCopyUtils는 파일 데이터를 파일로 처리하거나, 복사하는 등의 기능이
		// 있다.
		FileCopyUtils.copy(fileDate, target);

		return savedName;

	}

	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) {

		logger.info("originalName:" + file.getOriginalFilename());
		logger.info("size:" + file.getSize());
		logger.info("contentType:" + file.getContentType());

		return new ResponseEntity<>(file.getOriginalFilename(), HttpStatus.CREATED);
	}
}
