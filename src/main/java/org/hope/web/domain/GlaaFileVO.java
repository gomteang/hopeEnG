package org.hope.web.domain;

public class GlaaFileVO {
	private int gllyNo;
	private String fileNo;
	private int fileSeq;
	private String fileNameKey;
	private String filePath;
	private String fileSize;
	private String regiDate;
	@Override
	public String toString() {
		return "GlaaFileVO [gllyNo=" + gllyNo + ", fileNo=" + fileNo + ", fileNameKey=" + fileNameKey + ", filePath="
				+ filePath + ", fileSize=" + fileSize + ", regiDate=" + regiDate + "]";
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
	
	public String getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(String regiDate) {
		this.regiDate = regiDate;
	}
	public int getGllyNo() {
		return gllyNo;
	}
	public void setGllyNo(int gllyNo) {
		this.gllyNo = gllyNo;
	}
	public String getFileNameKey() {
		return fileNameKey;
	}
	public void setFileNameKey(String fileNameKey) {
		this.fileNameKey = fileNameKey;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	
	
	
	
}
