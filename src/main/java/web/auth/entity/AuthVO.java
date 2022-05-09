package web.auth.entity;

public class AuthVO {
	private Integer authID;
	private String authName;
	
	public AuthVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AuthVO(Integer authID, String authName) {
		super();
		this.authID = authID;
		this.authName = authName;
	}
	@Override
	public String toString() {
		return "AuthVO [authID=" + authID + ", authName=" + authName + "]";
	}
	public Integer getAuthID() {
		return authID;
	}
	public void setAuthID(Integer authID) {
		this.authID = authID;
	}
	public String getAuthName() {
		return authName;
	}
	public void setAuthName(String authName) {
		this.authName = authName;
	}
	
	 
}
