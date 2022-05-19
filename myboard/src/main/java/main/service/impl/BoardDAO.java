package main.service.impl;



import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.BoardVO;

@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO {
	//게시물작성
	public String saveNBoard(BoardVO vo) throws Exception{
		return (String) insert ("boardDAO.saveNBoard",vo);
	}

	//목록
	public List<?> listBoard(BoardVO vo) {
		return list("boardDAO.listBoard",vo);
	}

	//상세화면
	public BoardVO DetailNBoard(int unq) {
		return (BoardVO) select ("boardDAO.DetailNBoard",unq);
	}

	
	
}
