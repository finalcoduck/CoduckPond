package com.coduck.pond.board.service;

import java.util.HashMap;
import java.util.List;
import com.coduck.pond.board.vo.BoardSrchDto;
import com.coduck.pond.board.vo.GroupNoticeVo;
import com.coduck.pond.board.vo.HwBoardVo;


public interface BoardService {
	
	public List<HwBoardVo> selectBoardList (BoardSrchDto boardSrchDto);
	
	public HashMap<String,Object> insertNoticeBoard(GroupNoticeVo groupNoticeVo);
	
}