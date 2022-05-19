package main;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {

	@Resource(name = "boardService")
	private BoardService boardService;


	@RequestMapping(value = "/board.do")
	public String Board() {
		
		return "board/board";
	}


//일반게시판 저장

	@RequestMapping("/boardsave.do")
	@ResponseBody
	public String saveNBoard(BoardVO vo) throws Exception {
		System.out.println(vo.toString());
		//
		String result = boardService.saveNBoard(vo);
		System.err.println("test"+result);
		String msg = "";
		if(result == null) msg = "ok";
		else msg = "fail";
		
		return msg;
	}

	
// 일반 게시판 화면 목록
	
	@RequestMapping("/List.do")
	public String listNBoard(BoardVO vo, ModelMap model) throws Exception {
		
		List<?> list = boardService.listBoard(vo);
		System.out.println("list:"+ list);
		
		model.addAttribute("resultList", list );
		return "board/List";
		
		
	}

	//상세화면
	@RequestMapping("/Detail.do")
	public String DetailNBoard(BoardVO vo, ModelMap model) throws Exception {
		
		BoardVO boardVO = boardService.DetailNBoard(vo.getUnq());
		model.addAttribute("data",boardVO);
		return "board/Detail";
	}
}
	