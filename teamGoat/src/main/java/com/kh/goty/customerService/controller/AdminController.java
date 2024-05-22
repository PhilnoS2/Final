package com.kh.goty.customerService.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.goty.customerService.model.service.AdminService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class AdminController {

	private final AdminService adminService;
	
	@GetMapping("admin")
	public String forwardAdmin() {
		return "admin/adminMain";
	}
	
	@GetMapping("management/board")
	public String forwardManagementBoard() {
		return "admin/managementBoard";
	}
}
