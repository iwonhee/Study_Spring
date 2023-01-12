package com.and.middle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import common.CommonService;
import vo.BoardFileVO;
import vo.BoardVO;
import vo.ReplyVO;

@RestController		// 안되면 spring-framework 버전 확인 (낮으면 안됨)
public class AndController {
	@Autowired @Qualifier("bteam") SqlSession sql;
	@Autowired CommonService common;
	

	//신규 게시글(+첨부파일) 저장
	@RequestMapping(value="/insert.fi", produces = "text/html;charset=utf-8")
	public int insert_file(String param, HttpServletRequest req) {
		
		BoardVO vo = new Gson().fromJson(param, BoardVO.class);
		String test = req.getParameter("param");
		
		MultipartRequest mReq = (MultipartRequest) req;
		String zzzz = mReq.getMultipartContentType("param");
		List<MultipartFile> fileList = mReq.getFiles("file");
		String imgPath = null;
		ArrayList<BoardFileVO> list = new ArrayList<>();
		
		for(int i = 0; i < fileList.size(); i++) {
			BoardFileVO f_vo = new BoardFileVO();
			MultipartFile file=  fileList.get(i); // getFiles 또는 getFileMap활용.
			System.out.println(file.getOriginalFilename());
			System.out.println(file.getName());
			f_vo.setFile_name(file.getOriginalFilename());
			imgPath = common.fileUpload("and", file, req);
			f_vo.setPath(imgPath);
			list.add(f_vo);
			
		}	
		vo.setFileList(list);
		
		int result = sql.insert("and.board_insert", vo);
		if(list.size() > 0) {
		
			sql.insert("and.file_insert", vo);
		}
		
		return result;
	}
	
	//파일첨부 메소드 - 참고
	public void attachedFile(BoardVO vo, MultipartFile file[], HttpServletRequest req) {
		ArrayList<BoardFileVO> files = null;
		for( MultipartFile attached : file ) {
			if( attached.isEmpty() ) continue;
			if( files==null )files = new ArrayList<BoardFileVO>();
			
			BoardFileVO fileVO = new BoardFileVO();
			fileVO.setFile_name( attached.getOriginalFilename() );
			fileVO.setPath( common.fileUpload("board", attached, req) );
			files.add(fileVO);
		}
		vo.setFileList(files);
	}
	
	// 댓글 삭제
	@RequestMapping("/delete.re")
	public int delete_reply(ReplyVO vo) {
		int result = sql.update("and.reply_delete", vo);
		return result;
	}
	
	// 댓글 수정
	@RequestMapping("/update.re")
	public int update_reply(ReplyVO vo) {
		int result = sql.update("and.reply_update", vo);
		return result;
	}
	
	// 댓글 insert
	@RequestMapping("/insert.re")
	public int insert_reply(ReplyVO vo) {
		int result = sql.insert("and.reply_insert", vo);
		return result;
	}
	
	// 댓글 조회
	@RequestMapping(value="/list.re", produces = "text/html;charset=utf-8")
	public String reply_list(int board_code, int cnt) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_code", board_code);
		map.put("cnt", cnt);
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(sql.selectList("and.reply_list", map));
	}
	
	// 특정 게시판 조회
	@RequestMapping(value="/info.bo", produces = "text/html;charset=utf-8")
	public String board_info(int board_code) {
		//조회수 증가처리
		sql.update("and.readcnt", board_code);
		
		//특정 게시판 조회
		BoardVO vo =sql.selectOne("and.board_info", board_code);
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(vo);
	}
	
	// 자유게시판 update
	@RequestMapping(value="/update.bo", produces = "text/html;charset=utf-8")
	public int board_update(BoardVO vo) {
		int result = sql.update("and.board_update", vo);
		return result;
	}
	
	// 자유게시판 삭제
	@RequestMapping(value="/delete.bo", produces = "text/html;charset=utf-8")
	public int board_delete(int board_code) {
		int result = sql.delete("and.board_delete", board_code);
		return result;
	}
	
	// 자유게시판 신규 등록
	@RequestMapping(value="/insert.bo", produces = "text/html;charset=utf-8")
	public int board_insert(BoardVO vo) {
		int result = sql.insert("and.board_insert", vo);
		return result;
	}
	
	// 자유게시판 목록 조회
	@RequestMapping(value="/list.bo", produces = "text/html;charset=utf-8")
	public String and(int cnt) {
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(sql.selectList("and.board_list", cnt));
	}
	
	// 자유게시판 남은 게시글 수 반환
	@RequestMapping(value="cal.bo", produces="text/html;charset=utf-8")
	public String cal_board(int cnt) {
		
		int boardCount = sql.selectOne("and.cal_board");
		
		return ( boardCount - (cnt*10) ) + "";
	}
	
	// 특정 게시글의 남은 댓글 수
	@RequestMapping(value="cal.re", produces="text/html;charset=utf-8")
	public String cal_reply(int cnt, int board_code) {
		
		int boardCount = sql.selectOne("and.cal_reply", board_code);
		
		return ( boardCount - (cnt*10) ) + "";
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/andVO", produces = "text/html;charset=utf-8")
	public String andVo() {
		System.out.println("ddd");
//		List<CustomerVO> list = sql.selectList("and.list");
		
		
		return "lastTest";
	}
	
}
