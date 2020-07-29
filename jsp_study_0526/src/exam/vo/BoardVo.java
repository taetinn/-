package exam.vo;

import java.time.LocalDateTime;

public class BoardVo {
	
	private Integer num;
	private String name;
	private String passwd;
	private String subject;
	private String content;
	private Integer readCount;
	private String ip;
	private LocalDateTime RegDate;
	private Integer reRef;
	private Integer reLev;
	private Integer reSeq;
	
	
//	Alt+Shift+s (generator...)
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getReadCount() {
		return readCount;
	}
	public void setReadCount(Integer readCount) {
		this.readCount = readCount;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public LocalDateTime getReg_date() {
		return RegDate;
	}
	public void setReg_date(LocalDateTime reg_date) {
		this.RegDate = reg_date;
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
	
	//Stringbuilder에서 append는 void가 아니라 자기 자신을 return(retrn this;) --> append는 체인 형태로 계속 호출 가능.
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("boardVo [num=").append(num).append(", name=").append(name).append(", passwd=").append(passwd)
				.append(", subject=").append(subject).append(", content=").append(content).append(", readCount=")
				.append(readCount).append(", ip=").append(ip).append(", reg_date=").append(RegDate).append(", reRef=")
				.append(reRef).append(", reLev=").append(reLev).append(", reSeq=").append(reSeq).append("]");
		return builder.toString();
	}
	
	
	
}
