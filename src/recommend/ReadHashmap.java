package recommend;

import java.awt.Window.Type;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.TreeMap;

public class ReadHashmap {

	public ReadHashmap() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HashMap<String, TreeMap<String, Double>> getReadHashmap(String movieCd) throws Exception {
	
		TreeMap<String, Double> inner = null;
		HashMap<String, TreeMap<String, Double>> similarItems=new HashMap<>();

		BufferedReader br = new BufferedReader(new FileReader("/home/junyeol/data/recdata/readydata/"+movieCd+".txt"));
		String line = null;
		int cnt=0;
		while ((line = br.readLine()) != null) { // ��ü�� ���پ� �о����. null�� ������
													// �����.
	
			inner = new TreeMap<String, Double>();
			String[] values = line.split("\\|"); // |�� �������� �߶� �迭�� �����Ѵ�.
			// [0]�� movie id, [1]�� movie title

			String replace = values[1].replace("{", "").replace("}", "");

			String[] values2 = replace.split("\\,");
	
			for (String s : values2) {
				
				String[] keymap = s.split("\\=");
				inner.put(keymap[0].trim(), Double.parseDouble(keymap[1].trim()));
				
			}	
			similarItems.put(values[0], inner);	
			//System.out.println(Integer.parseInt(values[0])+"  :  " +inner);
		}
		br.close();	
      
		return similarItems;
	}

	public static void main(String[] args) throws Exception {
		ReadHashmap read = new ReadHashmap();
		HashMap<String, TreeMap<String, Double>> data = read.getReadHashmap("2010G311");
		Iterator<String> itr = data.keySet().iterator();
		System.out.println(data.get("2010G311").get("19300003"));
		System.out.println("�Ϸ�");
	}
}
