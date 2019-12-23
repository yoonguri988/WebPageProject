package model;
public class Member {
	private int memnum;
	private int chk;
	private int warncnt;
	private int deadmem;
	private String id;
	private String pass;
	private String name;
	private String nick;
	private String tel;
	//
	public int getMemnum() {
		return memnum;
	}
	public void setMemnum(int memnum) {
		this.memnum = memnum;
	}
	public int getChk() {
		return chk;
	}
	public void setChk(int chk) {
		this.chk = chk;
	}
	public int getWarncnt() {
		return warncnt;
	}
	public void setWarncnt(int warncnt) {
		this.warncnt = warncnt;
	}
	public int getDeadmem() {
		return deadmem;
	}
	public void setDeadmem(int deadmem) {
		this.deadmem = deadmem;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "Member [memnum=" + memnum + ", chk=" + chk + ", warncnt=" + warncnt + ", deadmem=" + deadmem + ", id="
				+ id + ", pass=" + pass + ", name=" + name + ", nick=" + nick + ", tel=" + tel + "]";
	}
	

	
}
