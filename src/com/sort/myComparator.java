package com.sort;

import java.util.Comparator;

public class myComparator<T> implements Comparator<T> {
	
	public int compare(T a1, T a2){
		
		similarity s1 = (similarity)a1;
		similarity s2 = (similarity)a2;
		
		double r=s1.getRate()-s2.getRate();
		if(r<0){
			return 1;
		}else if(r==0){
			return 0;
		}else{
			return -1;
		}
	}

}
