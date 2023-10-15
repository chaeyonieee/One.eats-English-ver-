package com.example.demo.admin.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.admin.main.dao.AdminMainDAO;

@Service("adminMainService")
public class AdminMainServiceImpl implements AdminMainService {
	@Autowired
	private AdminMainDAO adminMainDAO;
}
