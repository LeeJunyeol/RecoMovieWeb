package recommend;

public class similarity {
	private String movieid=null;
	private double rate=0;
	
	public similarity(String movieid, double rate) {
		super();
		this.movieid = movieid;
		this.rate = rate;
	}

	public String getMovieid() {
		return movieid;
	}

	public void setMovieid(String movieid) {
		this.movieid = movieid;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	@Override
	public String toString() {
		return movieid + "," + rate;
	}
	
	
	
	
}
