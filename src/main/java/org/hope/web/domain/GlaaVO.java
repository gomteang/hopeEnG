package org.hope.web.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class GlaaVO {
	private int gllyNo;
	private String gllyNm;
	private String gllyCts;
	private String showMainYn;
	private String regiDate;
	private String modyDate;
	private List<MultipartFile> files;
	
	
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	public int getgllyNo() {
		return gllyNo;
	}
	public void setgllyNo(int gllyNo) {
		this.gllyNo = gllyNo;
	}
	public String getgllyNm() {
		return gllyNm;
	}
	public void setgllyNm(String gllyNm) {
		this.gllyNm = gllyNm;
	}
	public String getgllyCts() {
		return gllyCts;
	}
	public void setgllyCts(String gllyCts) {
		this.gllyCts = gllyCts;
	}
	public String getShowMainYn() {
		return showMainYn;
	}
	public void setShowMainYn(String showMainYn) {
		this.showMainYn = showMainYn;
	}
	public String getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(String regiDate) {
		this.regiDate = regiDate;
	}
	public String getModyDate() {
		return modyDate;
	}
	public void setModyDate(String modyDate) {
		this.modyDate = modyDate;
	}
	@Override
	public String toString() {
		return "GlaaVO [gllyNo=" + gllyNo + ", gllyNm=" + gllyNm + ", gllyCts=" + gllyCts + ", showMainYn=" + showMainYn
				+ ", regiDate=" + regiDate + ", modyDate=" + modyDate + ", files=" + files + "]";
	}



	
	
}
