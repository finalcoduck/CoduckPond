package com.coduck.pond.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coduck.pond.board.vo.BoardSrchDto;
import com.coduck.pond.board.vo.HwBoardVo;

@Repository
public class HwBoardDao {
	private static final String NAMESPACE = "Mappers.hwBoardMapper.";
	
	@Autowired
	private SqlSession session;
	
	public List<HwBoardVo> selectHwBoardList(BoardSrchDto boardSrchDto){
		return session.selectList(NAMESPACE+"selectHwBoardList",boardSrchDto);
	}
	
	public void insertHwBoard(HwBoardVo hwBoardVo ) {
		session.insert(NAMESPACE+"insertHwBoard",hwBoardVo);
	}
	
	public void deleteHwBoard(int ntcNum) {
		session.delete(NAMESPACE+"deleteHwBoard",ntcNum);
	}
	
}