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
	private String fileType;
	private String regiDate;
	private String modyDate;
	private List<MultipartFile> files;
	private List<GlaaFileVO> glaaFileVO;
	private String fileNo;
	private int fileSeq;
	private String filePath;
	private String fileNmKey;
	
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
	public int getGllyNo() {
		return gllyNo;
	}
	public void setGllyNo(int gllyNo) {
		this.gllyNo = gllyNo;
	}
	public String getGllyNm() {
		return gllyNm;
	}
	public void setGllyNm(String gllyNm) {
		this.gllyNm = gllyNm;
	}
	
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
	public String getGllyCts() {
		return gllyCts;
	}
	public void setGllyCts(String gllyCts) {
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
	public String getFileNmKey() {
		return fileNmKey;
	}
	public void setFileNmKey(String fileNmKey) {
		this.fileNmKey = fileNmKey;
	}


	
	
}
