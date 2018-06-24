package tool;

public class Tool {

	public static String duelString(String a) {
		if(a.length()>50)return a.substring(0, 50);
		return a;
	}
}
