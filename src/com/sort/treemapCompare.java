package com.sort;

import java.util.*;

public class treemapCompare {
	public static void main(String[] args) {
		
		HashMap<Integer, Double> map = new HashMap<>();
		ValueComparator bvc = new ValueComparator( map );
		TreeMap<Integer,Double> sorted_map = new TreeMap<Integer ,Double>(bvc);
		TreeMap<Integer,Double> sorted_map2 = new TreeMap<Integer ,Double>(bvc);
		
        map.put( 2, 99.5 );
        map.put( 3 , 67.4 );
        map.put( 456 , 67.5 );
        map.put( 1 , 67.3 );
        System.out.println( "unsorted map" );
        for ( Integer key : map.keySet( ) )
        {
            System.out.println( "key/value: " + key + "/" + map.get( key ) );
        }
        int count=0;
        int n=3;
        sorted_map.putAll( map );
        System.out.println( "results" );
        for ( Integer key : sorted_map.keySet( ) )
        {
            //System.out.println( "key/value: " + key + "/" + sorted_map.get( key ) );
            sorted_map2.put(key, sorted_map.get(key));
            count++;
            
            if(count==n){
				break;
			}
        }
        System.out.println(sorted_map2);
    }
}

