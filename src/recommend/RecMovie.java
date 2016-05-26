package recommend;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;
import java.util.TreeSet;

import com.sort.myComparator;

public class RecMovie {
	
	public ArrayList<similarity> recommendMovie(HashMap<String, Double> userinfo,List<String> DistinctMovieCd, int n){
		
		HashMap<String, Double> total = new HashMap<>(); //유사도*평점 누적
		HashMap<String, Double> simtotal = new HashMap<>(); //유사도 누적
		int countz=1;
		for(String UserMovieCd : userinfo.keySet()){//user가 평가한 영화들의 리스트를 하나씩 도는데
			System.out.println(countz+"/"+userinfo.keySet().size());
			countz=countz+1;
			for(String movieCd : DistinctMovieCd){//그 속에서 rating테이블의 모든 영화 리스트를 돌고 
				if(!userinfo.keySet().contains(movieCd)){ //movieCd가 user가 평가하지 않은 영화라면
					//그 영화의 이름으로 파일을 읽어와서 data라는 트리맵으로 만듬
					
					TreeMap<String, Double> data = new TreeMap<>();
					ReadHashmap read = new ReadHashmap();
					try {
						data = read.getReadHashmap(movieCd).get(movieCd);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					//만든 트리맵 data에서 movieCd와 UserMovieCd 의 유사도를 얻는다.
					double sim =0;
					double rating =0;
					
					if(data.get(UserMovieCd)==null || userinfo.get(UserMovieCd)==null){
						
						continue;
					}else{
						
						sim = data.get(UserMovieCd);
						rating = userinfo.get(UserMovieCd);
					}
					
					//userinfo에서 UserMovieCd의 평점을 얻는다.
					
					double mul = sim*rating;
					//둘을 곱해서 결과 hashmap에 put
					
					if(total.get(movieCd)==null){//값이 없다면 그냥 추가
						total.put(movieCd, mul);
					}else{
						mul=total.get(movieCd)+mul; //값이 있다면 value가져와서 더해서 다시 put
						total.put(movieCd, mul);
					}
					
					if(simtotal.get(movieCd)==null){//값이 없다면 그냥 추가
						simtotal.put(movieCd, sim);
					}else{
						sim=simtotal.get(movieCd)+sim;
						simtotal.put(movieCd, sim);
					}
				}
			}
		}
		TreeSet<similarity> result = new TreeSet<similarity>(new myComparator<similarity>());
		ArrayList<similarity> finalresult = new ArrayList<>();
		
		for(String key : total.keySet()){
			result.add(new similarity(key, total.get(key)/simtotal.get(key)) );
		}
		
		Iterator<similarity> itr = result.iterator();
		int count=0;
		while(itr.hasNext()){
			similarity key=itr.next();
			similarity moviedata= new similarity(key.getMovieid(), 
												Double.parseDouble(String.format("%.3f", key.getRate())));
			//finalresult.put(key, new MovieName().getMovieName().get(result.get(key)) );
			finalresult.add(moviedata);
			count++;
			
			if(count==n+1){
				break;
			}
		}
		
		return finalresult; 
	}
}
