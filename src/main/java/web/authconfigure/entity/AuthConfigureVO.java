package web.authconfigure.entity;

public class AuthConfigureVO {
	private Integer adminID;
	private Integer authID;
	
	public AuthConfigureVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AuthConfigureVO(Integer adminID, Integer authID) {
		super();
		this.adminID = adminID;
		this.authID = authID;
	}
	@Override
	public String toString() {
		return "AuthConfigureVO [adminID=" + adminID + ", authID=" + authID + "]";
	}
	public Integer getAdminID() {
		return adminID;
	}
	public void setAdminID(Integer adminID) {
		this.adminID = adminID;
	}
	public Integer getAuthID() {
		return authID;
	}
	public void setAuthID(Integer authID) {
		this.authID = authID;
	}
	
	
}
