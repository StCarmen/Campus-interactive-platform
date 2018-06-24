package Bean;

public class Comment {
	private int userid;
	private int articleid;
	private String username;
	private String content;
	private String publishtime;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getcontent() {
		return content;
	}
	public void setcontent(String content) {
		this.content = content;
	}
	public String getpublishtime() {
		return publishtime;
	}
	public void setpublishtime(String publishtime) {
		this.publishtime = publishtime;
	}
	public int getuserid() {
		return userid;
	}
	public void setuserid(int userid) {
		this.userid = userid;
	}
	public int getarticleid() {
		return articleid;
	}
	public void setarticleid(int articleid) {
		this.articleid = articleid;
	}
}
