/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class IdGenerator {
    
    private static String gerenateId(String input)
		{
			String hashtext = null;
			
			try 
			{
				MessageDigest md = MessageDigest.getInstance("SHA-512");
				
				 byte[] messageDigest = md.digest(input.getBytes());
				 
				  BigInteger no = new BigInteger(1, messageDigest);
				  
				  hashtext = no.toString(16);
				  
				  while (hashtext.length() < 32) 
				  {
		                hashtext = "0" + hashtext;
		          } 
			} 
			 catch (NoSuchAlgorithmException e) 
			 {
				e.printStackTrace();
			 }
			
			 return hashtext.substring(0, 15);
		}
		
		
		public static String gerenateId(String input,String idType)
		{
			return idType+gerenateId(input);
		}
}
