package com.coduck.pond.schedule.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coduck.pond.core.constant.ErrorCodeConstant;
import com.coduck.pond.group.service.GroupService;
import com.coduck.pond.group.vo.GroupVo;
import com.coduck.pond.member.vo.MemAttendedDto;
import com.coduck.pond.member.vo.MemDto;
import com.coduck.pond.schedule.service.AttendedService;
import com.coduck.pond.schedule.vo.AttendedVo;
import com.coduck.pond.schedule.vo.SrchAttendedDto;



@Controller
public class AttendedController {
	
	@Autowired
	private AttendedService attendedService;
	
	@Autowired
	private GroupService groupService;
	
	//출석 페이지 리턴
	@RequestMapping(value="/group/attended")
	public String attendedPage(int groupNum, Model model) {
		
		GroupVo groupVo = groupService.selectGroup(groupNum);
		model.addAttribute("groupVo", groupVo);
		return "/group/attended";
	}
	
	
	//해당 달의 출석 기록 리스트 리턴
	@RequestMapping(value="/group/srch/attended/proc",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> srchAttended(@RequestBody SrchAttendedDto srchAttendedDto, MemDto memDto) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		srchAttendedDto.setMemEmail(memDto.getMemVo().getMemEmail());
		List<AttendedVo> attendedVoList = attendedService.selectMonthAttended(srchAttendedDto);
		
		resultMap.put(ErrorCodeConstant.ERR_C_KEY, ErrorCodeConstant.SUCCESS);
		resultMap.put("attendedVoList", attendedVoList);
		return resultMap;
	}
	
	//금일 출석 여부 리턴
	@RequestMapping(value="/group/is/attended/proc",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> isAttended(@RequestBody AttendedVo attendedVo, MemDto memDto) {
		HashMap<String,Object> resultMap = new HashMap<String, Object>();
		
		
		attendedVo.setMemEmail(memDto.getMemVo().getMemEmail());
		boolean result = attendedService.isAttended(attendedVo);
		
		resultMap.put("isAttended",result);
		
		return resultMap;
	}
	
	// 등원
	@RequestMapping(value="/group/attended/in/proc",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> attendedIn(@RequestBody AttendedVo attendedVo,MemDto memDto){
		HashMap<String,Object> resultMap = new HashMap<String, Object>();
		
		//그룹 출석 QR코드와 일치 하지 않으면 Failure code return
		if(!groupService.isQRcodeCorrect(attendedVo)) {
			resultMap.put(ErrorCodeConstant.ERR_C_KEY, ErrorCodeConstant.FAILURE);
			return resultMap;
		}
		
		
		attendedVo.setMemEmail(memDto.getMemVo().getMemEmail());
		resultMap = attendedService.attendedIn(attendedVo);
		
		return resultMap;
	}
	
	@RequestMapping(value="/group/attended/out/proc",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> attendedOut(@RequestBody AttendedVo attendedVo,MemDto memDto){
		HashMap<String,Object> resultMap = new HashMap<String, Object>();
		
		//그룹 출석 QR코드와 일치 하지 않으면 Failure code return
		if(!groupService.isQRcodeCorrect(attendedVo)) {
			resultMap.put(ErrorCodeConstant.ERR_C_KEY, ErrorCodeConstant.FAILURE);
			return resultMap;
		}
		
		attendedVo.setMemEmail(memDto.getMemVo().getMemEmail());
		resultMap = attendedService.attendedOut(attendedVo);
		
		return resultMap;
	}
}
