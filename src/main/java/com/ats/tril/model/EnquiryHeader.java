package com.ats.tril.model;

import java.util.List;
 

public class EnquiryHeader {
	
	private int enqId; 
	private String enqDate; 
	private int vendId; 
	private String enqRemark; 
	private int enqStatus; 
	private int delStatus; 
	private String enqNo; 
	private String indNo; 
	private int indId;
	 
	List<EnquiryDetail> enquiryDetailList;

	public int getEnqId() {
		return enqId;
	}

	public void setEnqId(int enqId) {
		this.enqId = enqId;
	}

	public String getEnqDate() {
		return enqDate;
	}

	public void setEnqDate(String enqDate) {
		this.enqDate = enqDate;
	}

	public int getVendId() {
		return vendId;
	}

	public void setVendId(int vendId) {
		this.vendId = vendId;
	}

	public String getEnqRemark() {
		return enqRemark;
	}

	public void setEnqRemark(String enqRemark) {
		this.enqRemark = enqRemark;
	}

	public int getEnqStatus() {
		return enqStatus;
	}

	public void setEnqStatus(int enqStatus) {
		this.enqStatus = enqStatus;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public String getEnqNo() {
		return enqNo;
	}

	public void setEnqNo(String enqNo) {
		this.enqNo = enqNo;
	}

	public String getIndNo() {
		return indNo;
	}

	public void setIndNo(String indNo) {
		this.indNo = indNo;
	}

	public int getIndId() {
		return indId;
	}

	public void setIndId(int indId) {
		this.indId = indId;
	}

	public List<EnquiryDetail> getEnquiryDetailList() {
		return enquiryDetailList;
	}

	public void setEnquiryDetailList(List<EnquiryDetail> enquiryDetailList) {
		this.enquiryDetailList = enquiryDetailList;
	}

	@Override
	public String toString() {
		return "EnquiryHeader [enqId=" + enqId + ", enqDate=" + enqDate + ", vendId=" + vendId + ", enqRemark="
				+ enqRemark + ", enqStatus=" + enqStatus + ", delStatus=" + delStatus + ", enqNo=" + enqNo + ", indNo="
				+ indNo + ", indId=" + indId + ", enquiryDetailList=" + enquiryDetailList + "]";
	}
	
	

}
