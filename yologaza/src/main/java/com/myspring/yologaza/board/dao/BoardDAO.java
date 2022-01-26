package com.myspring.yologaza.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.yologaza.board.vo.ArticleVO;

public interface BoardDAO {

	public List selectAllArticlesList() throws Exception;
	public int insertNewArticle(Map articleMap) throws DataAccessException;
	public int insertNewReply(Map articleMap) throws DataAccessException;
	public ArticleVO selectArticle(int articleNO) throws DataAccessException;
	public void updateArticle(Map articleMap) throws DataAccessException;
	public void deleteArticle(int articleNO) throws DataAccessException;
	public List mainBoard() throws Exception;
}
