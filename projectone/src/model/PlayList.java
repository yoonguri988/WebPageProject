package model;

public class PlayList {
	private int listnum;
	private String youtubeurl;
	private int chkcnt;
	
	public int getListnum() {
		return listnum;
	}
	public void setListnum(int listnum) {
		this.listnum = listnum;
	}
	public String getYoutubeurl() {
		return youtubeurl;
	}
	public void setYoutubeurl(String youtubeurl) {
		this.youtubeurl = youtubeurl;
	}
	
	public int getChkcnt() {
		return chkcnt;
	}
	public void setChkcnt(int chkcnt) {
		this.chkcnt = chkcnt;
	}
	@Override
	public String toString() {
		return "PlayList [listnum=" + listnum + ", youtubeurl=" + youtubeurl + ", chkcnt=" + chkcnt + "]";
	}
	
	
}
