package vo;

import java.time.LocalDateTime;
import java.util.List;

public class BoardVo {
	
	private Integer num;
    private String name;
	private String passwd;
	private String title;
	private String content;
	private Integer readcount;
	private LocalDateTime regDate;
	   
    private Integer reRef; /* 글 그룹 번호 */
	private Integer reLev; /* 글 들여쓰기 레벨 */
	private Integer reSeq; /* 글 그룹 내에서의 순서 */
	
	private List<FileVo> fileList;
	
	  public Integer getNum() {
		return num;
	}
	
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getReadcount() {
		return readcount;
	}
	public void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}
	public LocalDateTime getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}
	public Integer getReRef() {
		return reRef;
	}
	public void setReRef(Integer reRef) {
		this.reRef = reRef;
	}
	public Integer getReLev() {
		return reLev;
	}
	public void setReLev(Integer reLev) {
		this.reLev = reLev;
	}

	public Integer getReSeq() {
		return reSeq;
	}
	public void setReSeq(Integer reSeq) {
		this.reSeq = reSeq;
	}
	
	public List<FileVo> getFileList() {
		return fileList;
	}
	public void setFileList(List<FileVo> fileList) {
		this.fileList = fileList;
	}
	@Override
	public String toString() {
		return "BoardVo [num=" + num + ", name=" + name + ", passwd=" + passwd + ", title=" + title + ", readcount="
				+ readcount + ", regDate=" + regDate + ", reRef=" + reRef + ", reLev=" + reLev + ", reSeq=" + reSeq
				+ "]";
	}
	
}
