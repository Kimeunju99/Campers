package com.idle.campers.test;

import java.util.List;

import com.idle.campers.board.dao.BoardVO;
import com.idle.campers.business.service.BusinessService;
import com.idle.campers.business.service.BusinessVO;
import com.idle.campers.business.serviceImpl.BusinessServiceImpl;

public class test {
	public static void main(String[] args) {
		BusinessService svc = new BusinessServiceImpl();
		List<BusinessVO> list = svc.bestCampList();
		
		for(BusinessVO vo : list) {
			System.out.println(vo);
		}
	}
}
