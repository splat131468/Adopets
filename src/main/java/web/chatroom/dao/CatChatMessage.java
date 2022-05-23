package web.chatroom.dao;

public class CatChatMessage {
	private String type;
	private String catID;
//	private String sender;
//	private String receiver;
	private String message;
public CatChatMessage(String type, String catID, String message) {
	super();
	this.type = type;
	this.catID = catID;
	this.message = message;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getCatID() {
	return catID;
}
public void setCatID(String catID) {
	this.catID = catID;
}
public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
}
	 
	
	

	

}
