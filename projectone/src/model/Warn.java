package model;

public class Warn {
	private int warnnum;
	private int memnum;
	private int boardnum;
	private String title;
	private String content;
	private int state;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getWarnnum() {
		return warnnum;
	}
	public void setWarnnum(int warnnum) {
		this.warnnum = warnnum;
	}
	public int getMemnum() {
		return memnum;
	}
	public void setMemnum(int memnum) {
		this.memnum = memnum;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Warn [warnnum=" + warnnum + ", memnum=" + memnum + ", boardnum=" + boardnum + ", title=" + title
				+ ", content=" + content + ", state=" + state + "]";
	}
	
	

	
}
