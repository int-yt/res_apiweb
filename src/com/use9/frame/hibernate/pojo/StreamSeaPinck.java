package com.use9.frame.hibernate.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class StreamSeaPinck {
	private int id;
	private int ExpressCompanyId;
	private String ExpressOutId;
	private BigDecimal ItemWeight;
	private String userId;
	private Date saveDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getExpressCompanyId() {
		return ExpressCompanyId;
	}
	public void setExpressCompanyId(int expressCompanyId) {
		ExpressCompanyId = expressCompanyId;
	}
	public String getExpressOutId() {
		return ExpressOutId;
	}
	public void setExpressOutId(String expressOutId) {
		ExpressOutId = expressOutId;
	}
	public BigDecimal getItemWeight() {
		return ItemWeight;
	}
	public void setItemWeight(BigDecimal itemWeight) {
		ItemWeight = itemWeight;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getSaveDate() {
		return saveDate;
	}
	public void setSaveDate(Date saveDate) {
		this.saveDate = saveDate;
	}
	
	
}
