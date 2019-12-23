package model;

public class MyList {
	private int mylistnum;
	private int memnum;
	private int listnum;
	public int getMylistnum() {
		return mylistnum;
	}
	public void setMylistnum(int mylistnum) {
		this.mylistnum = mylistnum;
	}
	public int getMemnum() {
		return memnum;
	}
	public void setMemnum(int memnum) {
		this.memnum = memnum;
	}
	public int getListnum() {
		return listnum;
	}
	public void setListnum(int listnum) {
		this.listnum = listnum;
	}
	@Override
	public String toString() {
		return "MyList [mylistnum=" + mylistnum + ", memnum=" + memnum + ", listnum=" + listnum + "]";
	}
	
	
}
