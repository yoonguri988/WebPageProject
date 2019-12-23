package model;

public class Comment {
	private int commentnum;
	private int boardnum;
	private int memnum;
	private String content;
	public int getCommentnum() {
		return commentnum;
	}
	public void setCommentnum(int commentnum) {
		this.commentnum = commentnum;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public int getMemnum() {
		return memnum;
	}
	public void setMemnum(int memnum) {
		this.memnum = memnum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Comment [commentnum=" + commentnum + ", boardnum=" + boardnum + ", memnum=" + memnum + ", content="
				+ content + "]";
	}
	
	
	
}
