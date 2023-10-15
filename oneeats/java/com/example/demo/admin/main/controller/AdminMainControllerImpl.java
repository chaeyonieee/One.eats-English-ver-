package com.example.demo.admin.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.demo.admin.main.service.AdminMainService;

@Controller("adminMainController")
public class AdminMainControllerImpl implements AdminMainController {

	@Autowired
	private AdminMainService adminMainService;
}
