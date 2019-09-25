package bean;

public class ReservationDTO {
	
	String resnum;
	String regnum;
	String reservedate;
	String reservename;
	String etc;
	String additional;
	String nowstate;
	
	public String getResnum() {
		return resnum;
	}
	public void setResnum(String reservenum) {
		this.resnum = reservenum;
	}
	public String getRegnum() {
		return regnum;
	}
	public void setRegnum(String regnum) {
		this.regnum = regnum;
	}
	public String getReservedate() {
		return reservedate;
	}
	public void setReservedate(String reservedate) {
		this.reservedate = reservedate;
	}
	public String getReservename() {
		return reservename;
	}
	public void setReservename(String reservename) {
		this.reservename = reservename;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getAdditional() {
		return additional;
	}
	public void setAdditional(String additional) {
		this.additional = additional;
	}
	public String getNowstate() {
		return nowstate;
	}
	public void setNowstate(String nowstate) {
		this.nowstate = nowstate;
	}
	
}
