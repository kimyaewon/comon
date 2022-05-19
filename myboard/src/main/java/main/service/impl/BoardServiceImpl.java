package main.service.impl;



import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.BoardService;
import main.service.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name="boardDAO")
	public BoardDAO boardDAO;

	@Override
	public String saveNBoard(BoardVO vo) throws Exception {
		return boardDAO.saveNBoard(vo);
	}

	@Override
	public List<?> listBoard(BoardVO vo) throws Exception {
		return boardDAO.listBoard(vo);
	}

	@Override
	public BoardVO DetailNBoard(int unq) throws Exception {
		return boardDAO.DetailNBoard(unq);
	}
	
	
}
