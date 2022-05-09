package web.order.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public  class OrdersVO implements Serializable{
	private Integer orderID;
	private Integer memID;
	private Timestamp createTime;
	private Integer orderPrice;
	private Integer orderStatus;
	private Integer paymentType;
	private String address;
	
	public OrdersVO(Integer orderID, Integer memID, Timestamp createTime, Integer orderPrice, Integer orderStatus,
			Integer paymentType, String address) {
		this.orderID = orderID;
		this.memID = memID;
		this.createTime = createTime;
		this.orderPrice = orderPrice;
		this.orderStatus = orderStatus;
		this.paymentType = paymentType;
		this.address = address;
	}
	public OrdersVO() {
		
	}
	@Override
	public String toString() {
		return "OrdersVO [orderID=" + orderID + ", memID=" + memID + ", creatTime=" + createTime + ", orderPrice="
				+ orderPrice + ", orderStatus=" + orderStatus + ", paymentType=" + paymentType + ", address=" + address
				+ "]";
	}
	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public Integer getMemID() {
		return memID;
	}
	public void setMemID(Integer memID) {
		this.memID = memID;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public Integer getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(Integer orderPrice) {
		this.orderPrice = orderPrice;
	}
	public Integer getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Integer getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(Integer paymentType) {
		this.paymentType = paymentType;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
