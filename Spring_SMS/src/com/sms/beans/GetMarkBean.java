package com.sms.beans;

public class GetMarkBean {
	private String strSubjectName_;
	private int intIndex, intMarksObtained_,intTotalMarks_;

	
	
	

	public GetMarkBean(){}
	
	
	
	public GetMarkBean(int intIndex, String strSubjectName_, int intMarksObtained_, int intTotalMarks_) {
		super();
		this.intIndex = intIndex;
		this.strSubjectName_ = strSubjectName_;
		this.intMarksObtained_ = intMarksObtained_;
		this.intTotalMarks_ = intTotalMarks_;
	}



	public int getIntIndex() {
		return intIndex;
	}

	public void setIntIndex(int intIndex) {
		this.intIndex = intIndex;
	}


	public String getStrSubjectName_() {
		return strSubjectName_;
	}
	public void setStrSubjectName_(String strSubjectName_) {
		this.strSubjectName_ = strSubjectName_;
	}
	public int getIntMarksObtained_() {
		return intMarksObtained_;
	}
	public void setIntMarksObtained_(int intMarksObtained_) {
		this.intMarksObtained_ = intMarksObtained_;
	}
	public int getIntTotalMarks_() {
		return intTotalMarks_;
	}
	public void setIntTotalMarks_(int intTotalMarks_) {
		this.intTotalMarks_ = intTotalMarks_;
	}


}
