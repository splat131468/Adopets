package web.order.entity;

import java.io.Serializable;

public class OrderDetailVO implements Serializable{
	private Integer orderDetailID;
	private Integer orderID;
	private Integer skuID;
	private String prodName;
	private Integer prodNum;
	private Integer prodPrice;
	
	
	@Override
	public String toString() {
		return "OrderDetailVO [orderDetailID=" + orderDetailID + ", orderID=" + orderID + ", skuID=" + skuID
				+ ", prodName=" + prodName + ", prodNum=" + prodNum + ", prodPrice=" + prodPrice + "]";
	}
	public OrderDetailVO(Integer orderDetailID, Integer orderID, Integer skuID, String prodName, Integer prodNum,
			Integer prodPrice) {
		this.orderDetailID = orderDetailID;
		this.orderID = orderID;
		this.skuID = skuID;
		this.prodName = prodName;
		this.prodNum = prodNum;
		this.prodPrice = prodPrice;
	}
	public OrderDetailVO() {
		
	}
	public Integer getOrderDetailID() {
		return orderDetailID;
	}
	public void setOrderDetailID(Integer orderDetailID) {
		this.orderDetailID = orderDetailID;
	}
	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public Integer getSkuID() {
		return skuID;
	}
	public void setSkuID(Integer skuID) {
		this.skuID = skuID;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public Integer getProdNum() {
		return prodNum;
	}
	public void setProdNum(Integer prodNum) {
		this.prodNum = prodNum;
	}
	public Integer getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(Integer prodPrice) {
		this.prodPrice = prodPrice;
	}
	
	
}
