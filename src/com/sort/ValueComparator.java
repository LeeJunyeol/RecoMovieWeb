package com.sort;

import java.util.*;


public class ValueComparator implements Comparator<Object>{
	Map<Integer,Double> base;

    public ValueComparator( Map<Integer,Double> base )
    {
        this.base = base;
    }

    public int compare( Object a , Object b )
    {
        if ( (Double)base.get(a) < (Double)base.get(b) )
        {
            return 1;
        }
        else if ( base.get( a ) == base.get( b ) )
        {
            return 0;
        }
        else
        {
            return - 1;
        }
    }
}

