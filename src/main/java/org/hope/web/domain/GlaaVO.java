package org.hope.web.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class GlaaVO {
	private int gllyNo;
	private String gllyNm;
	private String gllyCts;
	private String imgPstn;
	private String mainComment;
	private String subComment;
	private String regiDate;
	private String modyDate;
	private List<MultipartFile> files;
	private List<GlaaFileVO> glaaFileVO;
	private String fileNo;
	private int fileSeq;
	private String filePath;
	
	public String getImgPstn() {
		return imgPstn;
	}
	public void setImgPstn(String imgPstn) {
		this.imgPstn = imgPstn;
	}
	public String getMainComment() {
		return mainComment;
	}
	public void setMainComment(String mainComment) {
		this.mainComment = mainComment;
	}
	public String getSubComment() {
		return subComment;
	}
	public void setSubComment(String subComment) {
		this.subComment = subComment;
	}
	public List<GlaaFileVO> getGlaaFileVO() {
		return glaaFileVO;
	}
	public void setGlaaFileVO(List<GlaaFileVO> glaaFileVO) {
		this.glaaFileVO = glaaFileVO;
	}
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
	public String getFileNo() {
		return fileNo;
	}
	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}
	public int getFileSeq() {
		return fileSeq;
	}
	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
//	@Override
//	public String toString() {
//		return "GlaaVO [gllyNo=" + gllyNo + ", gllyNm=" + gllyNm + ", gllyCts=" + gllyCts + ", imgPstn=" + imgPstn
//				+ ", comment=" + comment + ", subComment=" + subComment + ", regiDate=" + regiDate + ", modyDate="
//				+ modyDate + ", files=" + files + ", glaaFileVO=" + glaaFileVO + ", firstFilePath=" + firstFilePath
//				+ "]";
//	}

	



	
	
}
