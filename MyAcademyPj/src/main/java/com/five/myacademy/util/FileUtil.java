package com.five.myacademy.util;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	@Autowired 
	ServletContext application;
	
	//파일 절대경로 얻어오기
	public String get_filename(MultipartFile photo) {
		String filename = "no_file";
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);


		if(!photo.isEmpty()) {
			filename = photo.getOriginalFilename();

			File saveFile = new File(savePath, filename);
			if( !saveFile.exists() ) {
				saveFile.mkdirs();
			}else {
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			try {
				photo.transferTo(saveFile);

			} catch (Exception e) {
				e.printStackTrace();
			} 

		}
		return filename;
	}
}
