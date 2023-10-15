package com.example.demo.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {
	private int order_seqNo;
	private int orderNo;
	private String orderer_name;
	private String orderer_phone;
	private String receiver_name;
	private String receiver_address;
	private String receiver_phone;
	private String receiver_comment;
	private int used_point;
	private int used_couponId;
	private int payment_price;
	private int discount_price;
	private int shippingfee;
	private int point_price;
	private int total_price;
	private String payment_type;
	private Date orderDate;
	private String delivery_status;
	private Date deliveryDate;
	private int goods_qty;
	private String goods_inbun;
	private int memberNo;
	private int goodsNo;
	private String goodsName;
	private String goodsImg;
	private int gun;
	private int goodsPrice;
	private int weight;
	private int shippingFee;
	private int optionNo;
	
	private String orderer_id;
	private String sellerType;
	private int sellerNo;
	private int reviewNo;
	private String star;
	private String reviewImg;
	private String content;
	
	private String name;
	private String img1;
	private String price;
	
	
	public int getSellerNo() {
		return sellerNo;
	}
	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}
	public int getOrder_seqNo() {
		return order_seqNo;
	}
	public void setOrder_seqNo(int order_seqNo) {
		this.order_seqNo = order_seqNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getOrderer_name() {
		return orderer_name;
	}
	public void setOrderer_name(String orderer_name) {
		this.orderer_name = orderer_name;
	}
	public String getOrderer_phone() {
		return orderer_phone;
	}
	public void setOrderer_phone(String orderer_phone) {
		this.orderer_phone = orderer_phone;
	}
	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
	public String getReceiver_address() {
		return receiver_address;
	}
	public void setReceiver_address(String receiver_address) {
		this.receiver_address = receiver_address;
	}
	public String getReceiver_phone() {
		return receiver_phone;
	}
	public void setReceiver_phone(String receiver_phone) {
		this.receiver_phone = receiver_phone;
	}
	public String getReceiver_comment() {
		return receiver_comment;
	}
	public void setReceiver_comment(String receiver_comment) {
		this.receiver_comment = receiver_comment;
	}
	public int getUsed_point() {
		return used_point;
	}
	public void setUsed_point(int used_point) {
		this.used_point = used_point;
	}
	public int getUsed_couponId() {
		return used_couponId;
	}
	public void setUsed_couponId(int used_couponId) {
		this.used_couponId = used_couponId;
	}
	public int getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
	}
	public int getDiscount_price() {
		return discount_price;
	}
	public void setDiscount_price(int discount_price) {
		this.discount_price = discount_price;
	}
	public int getShippingfee() {
		return shippingfee;
	}
	public void setShippingfee(int shippingfee) {
		this.shippingfee = shippingfee;
	}
	public int getPoint_price() {
		return point_price;
	}
	public void setPoint_price(int point_price) {
		this.point_price = point_price;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	public Date getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public int getGoods_qty() {
		return goods_qty;
	}
	public void setGoods_qty(int goods_qty) {
		this.goods_qty = goods_qty;
	}
	public String getGoods_inbun() {
		return goods_inbun;
	}
	public void setGoods_inbun(String goods_inbun) {
		this.goods_inbun = goods_inbun;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsImg() {
		return goodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
	public int getGun() {
		return gun;
	}
	public void setGun(int gun) {
		this.gun = gun;
	}
	public int getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getShippingFee() {
		return shippingFee;
	}
	public void setShippingFee(int shippingFee) {
		this.shippingFee = shippingFee;
	}
	public int getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}
	public String getOrderer_id() {
		return orderer_id;
	}
	public void setOrderer_id(String orderer_id) {
		this.orderer_id = orderer_id;
	}
	public String getSellerType() {
		return sellerType;
	}
	public void setSellerType(String sellerType) {
		this.sellerType = sellerType;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public String getReviewImg() {
		return reviewImg;
	}
	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "OrderVO [order_seqNo=" + order_seqNo + ", orderNo=" + orderNo + ", orderer_name=" + orderer_name
				+ ", orderer_phone=" + orderer_phone + ", receiver_name=" + receiver_name + ", receiver_address="
				+ receiver_address + ", receiver_phone=" + receiver_phone + ", receiver_comment=" + receiver_comment
				+ ", used_point=" + used_point + ", used_couponId=" + used_couponId + ", payment_price=" + payment_price
				+ ", discount_price=" + discount_price + ", shippingfee=" + shippingfee + ", point_price=" + point_price
				+ ", total_price=" + total_price + ", payment_type=" + payment_type + ", orderDate=" + orderDate
				+ ", delivery_status=" + delivery_status + ", deliveryDate=" + deliveryDate + ", goods_qty=" + goods_qty
				+ ", goods_inbun=" + goods_inbun + ", memberNo=" + memberNo + ", goodsNo=" + goodsNo + ", goodsName="
				+ goodsName + ", goodsImg=" + goodsImg + ", gun=" + gun + ", goodsPrice=" + goodsPrice + ", weight="
				+ weight + ", shippingFee=" + shippingFee + ", optionNo=" + optionNo + ", orderer_id=" + orderer_id
				+ ", sellerType=" + sellerType + ", sellerNo=" + sellerNo + ", reviewNo=" + reviewNo + ", star=" + star
				+ ", reviewImg=" + reviewImg + ", content=" + content + ", name=" + name + ", img1=" + img1 + ", price="
				+ price + "]";
	}

}
