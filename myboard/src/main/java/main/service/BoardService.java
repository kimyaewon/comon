package main.service;

import java.util.List;

public interface BoardService {
	/*
	 * 저장처리
	 */
	public String saveNBoard(BoardVO vo) throws Exception;

	/*
	 * 목록
	 */
	public List<?> listBoard(BoardVO vo) throws Exception;

	/*
	 * 상세화면
	 */
	public BoardVO DetailNBoard(int unq) throws Exception;

}

