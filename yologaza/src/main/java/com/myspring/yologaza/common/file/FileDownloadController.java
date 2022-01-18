package com.myspring.yologaza.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class FileDownloadController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	@RequestMapping("/download.do")
	protected void download(@RequestParam("imageFileName") String imageFileName,
							@RequestParam("articleNO") String articleNO,
							HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO + "\\" +articleNO+"\\"+ imageFileName;
		File file = new File(downFile);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) 
			break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/thumbnails.do")
	protected void thumbnails(@RequestParam("imageFileName") String imageFileName,
                            	@RequestParam("articleNO") String articleNO,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile=ARTICLE_IMAGE_REPO + "\\" +articleNO+"\\"+ imageFileName;
		File file = new File(downFile);
		
		if (file.exists()) { 
			Thumbnails.of(file).size(80,50).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
	private static final String MEMBER_IMAGE_REPO = "C:\\member\\member_image";
	@RequestMapping("/mem_download.do")
	protected void mem_download(@RequestParam("memFileName") String memFileName,
							@RequestParam("uid") String uid,
							HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = MEMBER_IMAGE_REPO + "\\" +uid+"\\"+ memFileName;
		File file = new File(downFile);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + memFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) 
			break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/mem_thumbnails.do")
	protected void mem_thumbnails(@RequestParam("memFileName") String memFileName,
                            	@RequestParam("uid") String uid,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile=MEMBER_IMAGE_REPO + "\\" +uid+"\\"+ memFileName;
		File file = new File(downFile);
		
		if (file.exists()) { 
			Thumbnails.of(file).size(50,50).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
	private static final String CURR_IMAGE_REPO_PATH = "C:\\yoloshopping\\file_repo";
	
	@RequestMapping("/goods_download.do")
	protected void goods_download(@RequestParam("fileName") String fileName,
		                 	@RequestParam("goods_id") String goods_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+goods_id+"\\"+fileName;
		File image=new File(filePath);

		response.setHeader("Cache-Control","no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+fileName);
		FileInputStream in=new FileInputStream(image); 
		byte[] buffer=new byte[1024*8];
		while(true){
			int count=in.read(buffer); //버퍼에 읽어들인 문자개수
			if(count==-1)  //버퍼의 마지막에 도달했는지 체크
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();
	}
	
	
	@RequestMapping("/goods_thumbnails.do")
	protected void goods_thumbnails(@RequestParam("fileName") String fileName,
                            	@RequestParam("goods_id") String goods_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+goods_id+"\\"+fileName;
		File image=new File(filePath);
		
		if (image.exists()) { 
			Thumbnails.of(image).size(121,154).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
private static final String ROOM_IMAGE_REPO_PATH = "C:\\yoloshopping\\file_repo";
	
	@RequestMapping("/room_download.do")
	protected void room_download(@RequestParam("fileName") String fileName,
		                 	@RequestParam("goods_id") String goods_id,
		                 	@RequestParam("goods_uroom") String goods_uroom,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=ROOM_IMAGE_REPO_PATH+"\\"+goods_id+"\\"+goods_uroom+"\\"+fileName;
		File image=new File(filePath);

		response.setHeader("Cache-Control","no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+fileName);
		FileInputStream in=new FileInputStream(image); 
		byte[] buffer=new byte[1024*8];
		while(true){
			int count=in.read(buffer); //버퍼에 읽어들인 문자개수
			if(count==-1)  //버퍼의 마지막에 도달했는지 체크
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();
	}
}

