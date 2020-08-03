import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

public class Test {
	public static String Encryp(String password) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
		String encryp="";
		for (int i=0; i<= password.length()-1; i++) {
			encryp+= Integer.toString( (int) password.charAt(i));
		}
		return encryp;
	}
	public static String Decryp(String password) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
		String decryp="";
		String temp="";
		System.out.println("hello");
		for (int i=0; i<= password.length()-1;i++) {
			temp+=  password.charAt(i);
			if( ( (Integer.parseInt(temp) > 64 && Integer.parseInt(temp) <123) || (Integer.parseInt(temp) > 47 && Integer.parseInt(temp) < 58) )) {	
				decryp+= (char) Integer.parseInt(temp);
				temp="";
			}
		}
		
		return decryp;
	}
	public static void main(String[] args) throws InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException {
		//System.out.println(Encryp("phamducduy123IT"));
		String x = "112104971091001179910011712149505173";
		System.out.println(Decryp(x));
	}
}
