package vo;

public class FileVo {
	private String uuid;
	private String filename;
	private String uploadpath;
	private String image;
	private int bno;
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getUploadpath() {
		return uploadpath;
	}
	public void setUploadpath(String uploadpath) {
		this.uploadpath = uploadpath;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	@Override
	public String toString() {
		return "FileVo [uuid=" + uuid + ", filename=" + filename + ", uploadpath=" + uploadpath + ", image=" + image
				+ ", bno=" + bno + "]";
	}
}
