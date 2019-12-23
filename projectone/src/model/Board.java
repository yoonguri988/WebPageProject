package model;

public class Board {
	private int boardnum;
	private String id;
	private int boardtype;
	private int boardcategory;
	private String title;
	private String content;
	private String file1;
	private int readcnt;
    private int grp;
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBoardtype() {
		return boardtype;
	}
	public void setBoardtype(int boardtype) {
		this.boardtype = boardtype;
	}
	public int getBoardcategory() {
		return boardcategory;
	}
	public void setBoardcategory(int boardcategory) {
		this.boardcategory = boardcategory;
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
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getGrp() {
		return grp;
	}
	public void setGrp(int grp) {
		this.grp = grp;
	}
	@Override
	public String toString() {
		return "Board [boardnum=" + boardnum + ", id=" + id + ", boardtype=" + boardtype
				+ ", boardcategory=" + boardcategory + ", title=" + title + ", content=" + content + ", file1=" + file1
				+ ", readcnt=" + readcnt + ", grp=" + grp + "]";
	}
	
	
    
    
}
