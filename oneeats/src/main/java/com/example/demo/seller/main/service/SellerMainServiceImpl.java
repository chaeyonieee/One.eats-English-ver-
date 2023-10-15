package com.example.demo.seller.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.seller.main.dao.SellerMainDAO;

@Service("sellerMainService")
public class SellerMainServiceImpl implements SellerMainService{
	@Autowired
	private SellerMainDAO sellerMainDAO;

}
