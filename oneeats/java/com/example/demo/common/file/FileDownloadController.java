package com.example.demo.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class FileDownloadController {
	private static String IMAGE_REPO_PATH = "c:\\oneeats\\file_repo";

	@RequestMapping("/download.do")
	protected void download(@RequestParam("imageFileName") String imageFileName, @RequestParam("path") String path,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		OutputStream out = response.getOutputStream();
		if (path.contains("No")) {
			String[] paths = path.split("No");
			if (paths.length<2) {
				System.out.println("이미지 파일 참조 번호가 없음");
				return;
			}
			path = paths[0] + "\\" + paths[1];
		}
		if (imageFileName == null || imageFileName.trim().length()<1) {
			return;
		}
		System.out.println(path);
		String downFile = IMAGE_REPO_PATH + "\\" + path + "\\" + imageFileName;
		File file = new File(downFile);
		response.setHeader("Cache-control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer);
			if (count == -1) {
				break;
			}
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}

	@RequestMapping("/thumbnailDownload.do")
	protected void thumbnailDownload(@RequestParam("imageFileName") String imageFileName, HttpServletResponse response)
			throws IOException {
		OutputStream out = response.getOutputStream();
		String filePath = IMAGE_REPO_PATH + "\\" + imageFileName;
		File image = new File(filePath);
		int lastIndex = imageFileName.lastIndexOf(".");
		String fileName = imageFileName.substring(0, lastIndex);
		File thumbnail = new File(IMAGE_REPO_PATH + "\\thumbnail\\" + fileName + ".png");
		if (image.exists()) {
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(50, 50).outputFormat("png").toFile(thumbnail);
		}
		FileInputStream in = new FileInputStream(thumbnail);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer);
			if (count == -1) {
				break;
			}
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}

	@RequestMapping("/thumbnailDownload2.do")
	protected void thumbnailDownload2(@RequestParam("imageFileName") String imageFileName, HttpServletResponse response)
			throws IOException {
		OutputStream out = response.getOutputStream();
		String filePath = IMAGE_REPO_PATH + "\\" + imageFileName;
		File image = new File(filePath);
		if (image.exists()) {
			Thumbnails.of(image).size(50, 50).outputFormat("png").toOutputStream(out);
		} else {
			out.close();
			return;
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();

	}
}
