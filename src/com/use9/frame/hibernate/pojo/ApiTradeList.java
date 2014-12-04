package com.use9.frame.hibernate.pojo;

import java.util.Date;

public class ApiTradeList {
	private int id;
	private String tradeNo;
	private Date regTime;
	private Date tradeTime;
	private Date payTime;
	private Date chkTime;
	private Date stockOutTime;
	private Date sndTime;
	private Date lastModifyTime;
	private String tradeStatus;
	private String nickName;
	private String shopName;
	private String tradeFlag;
	public String getTradeNo() {
		return tradeNo;
	}
	public void setTradeNo(String tradeNo) {
		this.tradeNo = tradeNo;
	}
	public Date getRegTime() {
		return regTime;
	}
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
	public Date getTradeTime() {
		return tradeTime;
	}
	public void setTradeTime(Date tradeTime) {
		this.tradeTime = tradeTime;
	}
	public Date getPayTime() {
		return payTime;
	}
	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}
	public Date getChkTime() {
		return chkTime;
	}
	public void setChkTime(Date chkTime) {
		this.chkTime = chkTime;
	}
	public Date getStockOutTime() {
		return stockOutTime;
	}
	public void setStockOutTime(Date stockOutTime) {
		this.stockOutTime = stockOutTime;
	}
	public Date getSndTime() {
		return sndTime;
	}
	public void setSndTime(Date sndTime) {
		this.sndTime = sndTime;
	}
	public Date getLastModifyTime() {
		return lastModifyTime;
	}
	public void setLastModifyTime(Date lastModifyTime) {
		this.lastModifyTime = lastModifyTime;
	}
	public String getTradeStatus() {
		return tradeStatus;
	}
	public void setTradeStatus(String tradeStatus) {
		this.tradeStatus = tradeStatus;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getTradeFlag() {
		return tradeFlag;
	}
	public void setTradeFlag(String tradeFlag) {
		this.tradeFlag = tradeFlag;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
}
