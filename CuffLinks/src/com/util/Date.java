package com.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Date {

	
	public static void main(String[] args) {

	     int[] DayArray   = {31,29,31,30,31,30,31,31,30,31,30,31};
	     String today     = "";       
	     
	     Calendar cal = Calendar.getInstance();


	     SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy:MM:dd-hh:mm:ss");
	     int year  = cal.get(Calendar.YEAR);
	     int month = cal.get(Calendar.MONTH)+1;
	     int day   = cal.get(Calendar.DAY_OF_MONTH);
	     int index = month+1;
	     int start = 30;
	     int cnt   = 0;
	     int end   = 30;

	     
	     today = String.valueOf(year)+"-"+String.valueOf(month)+"-"+String.valueOf(day);
	     
	     
	     
	     for(int i = month; i<start;i++) {
	    	 
	    	 for(int j = day;j<day+start;j++) {
	    		 cnt++;
	    		    System.out.println("2018-"+i+"-"+j);
	    		 
	    		    if(j==DayArray[month-1]) {
	    		    	month = month+1;
	    		    	day   = 1;
	    		    }
	    		    
	    		  
	    		    if(cnt==start) {
	    		    	return;
	    		    }
	    		
	    	 }
	    	 
	     }
	     
	    
	     
	}
	
}
