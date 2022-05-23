package web.chat.model;

public class ChatMessage {
	private String type;
	private String username;
	private String message;
	
	
	public ChatMessage(String type, String username, String message) {
		super();
		this.type = type;
		this.username = username;
		this.message = message;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
	

}
