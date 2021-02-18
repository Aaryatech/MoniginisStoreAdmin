package com.ats.tril.model.mrn;

import java.util.List;


public class OfficeMrnHeader {
	
	
	private int mrnId;
	
	private String mrnNo;
	
	private String mrnDate;
	
	private int mrnType;
	
	private int vendorId;
	
	private String gateEntryNo;
	private String gateEntryDate;
	
	private String docNo;//chalan no
	private String docDate;//chalan Date
	
	
	private String billNo;
	private String billDate;

	private int userId;
	
	private String transport;
	
	private String lrNo;
	
	private String lrDate;
	private String remark1;
	private String remark2;
	
	private int mrnStatus;
	
	private int delStatus;
	
	private int poStatus;
	private int exInt1;
	private int exInt2;
	private String exVar1;
	private String exVar2;
	
	
	List<OfficeMrnDetail> mrnDetailList;


	public int getMrnId() {
		return mrnId;
	}


	public String getMrnNo() {
		return mrnNo;
	}


	public String getMrnDate() {
		return mrnDate;
	}


	public int getMrnType() {
		return mrnType;
	}


	public int getVendorId() {
		return vendorId;
	}


	public String getGateEntryNo() {
		return gateEntryNo;
	}


	public String getGateEntryDate() {
		return gateEntryDate;
	}


	public String getDocNo() {
		return docNo;
	}


	public String getDocDate() {
		return docDate;
	}


	public String getBillNo() {
		return billNo;
	}


	public String getBillDate() {
		return billDate;
	}


	public int getUserId() {
		return userId;
	}


	public String getTransport() {
		return transport;
	}


	public String getLrNo() {
		return lrNo;
	}


	public String getLrDate() {
		return lrDate;
	}


	public String getRemark1() {
		return remark1;
	}


	public String getRemark2() {
		return remark2;
	}


	public int getMrnStatus() {
		return mrnStatus;
	}


	public int getDelStatus() {
		return delStatus;
	}


	public List<OfficeMrnDetail> getMrnDetailList() {
		return mrnDetailList;
	}


	public void setMrnId(int mrnId) {
		this.mrnId = mrnId;
	}


	public void setMrnNo(String mrnNo) {
		this.mrnNo = mrnNo;
	}


	public void setMrnDate(String mrnDate) {
		this.mrnDate = mrnDate;
	}


	public void setMrnType(int mrnType) {
		this.mrnType = mrnType;
	}


	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}


	public void setGateEntryNo(String gateEntryNo) {
		this.gateEntryNo = gateEntryNo;
	}


	public void setGateEntryDate(String gateEntryDate) {
		this.gateEntryDate = gateEntryDate;
	}


	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}


	public void setDocDate(String docDate) {
		this.docDate = docDate;
	}


	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}


	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public void setTransport(String transport) {
		this.transport = transport;
	}


	public void setLrNo(String lrNo) {
		this.lrNo = lrNo;
	}


	public void setLrDate(String lrDate) {
		this.lrDate = lrDate;
	}


	public void setRemark1(String remark1) {
		this.remark1 = remark1;
	}


	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}


	public void setMrnStatus(int mrnStatus) {
		this.mrnStatus = mrnStatus;
	}


	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}


	public void setMrnDetailList(List<OfficeMrnDetail> mrnDetailList) {
		this.mrnDetailList = mrnDetailList;
	}


	public int getPoStatus() {
		return poStatus;
	}


	public void setPoStatus(int poStatus) {
		this.poStatus = poStatus;
	}


	public int getExInt1() {
		return exInt1;
	}


	public void setExInt1(int exInt1) {
		this.exInt1 = exInt1;
	}


	public int getExInt2() {
		return exInt2;
	}


	public void setExInt2(int exInt2) {
		this.exInt2 = exInt2;
	}


	public String getExVar1() {
		return exVar1;
	}


	public void setExVar1(String exVar1) {
		this.exVar1 = exVar1;
	}


	public String getExVar2() {
		return exVar2;
	}


	public void setExVar2(String exVar2) {
		this.exVar2 = exVar2;
	}


	@Override
	public String toString() {
		return "OfficeMrnHeader [mrnId=" + mrnId + ", mrnNo=" + mrnNo + ", mrnDate=" + mrnDate + ", mrnType=" + mrnType
				+ ", vendorId=" + vendorId + ", gateEntryNo=" + gateEntryNo + ", gateEntryDate=" + gateEntryDate
				+ ", docNo=" + docNo + ", docDate=" + docDate + ", billNo=" + billNo + ", billDate=" + billDate
				+ ", userId=" + userId + ", transport=" + transport + ", lrNo=" + lrNo + ", lrDate=" + lrDate
				+ ", remark1=" + remark1 + ", remark2=" + remark2 + ", mrnStatus=" + mrnStatus + ", delStatus="
				+ delStatus + ", poStatus=" + poStatus + ", exInt1=" + exInt1 + ", exInt2=" + exInt2 + ", exVar1="
				+ exVar1 + ", exVar2=" + exVar2 + ", mrnDetailList=" + mrnDetailList + "]";
	}


}
