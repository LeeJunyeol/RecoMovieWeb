package com.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.biz.BookingDB;
import com.biz.Booking_SeatDB;
import com.biz.CinemaDB;
import com.biz.MovieDB;
import com.biz.ScreenDB;
import com.biz.SeatDB;
import com.biz.TimeDB;
import com.entity.BookingEntity;
import com.entity.BookingVO;
import com.entity.Booking_SeatEntity;
import com.entity.CinemaEntity;
import com.entity.MemberEntity;
import com.entity.MovieEntity;
import com.entity.RunningPeriodEntity;
import com.entity.ScreenEntity;
import com.entity.SeatEntity;
import com.entity.TimeEntity;

import static com.util.Encoder.isoToUTF;
import static com.util.Encoder.stringEncodingChecker;;

@Controller
public class RESController {
	CinemaDB cinemaDB;
	MovieDB movieDB;
	ScreenDB screenDB;
	TimeDB timeDB;
	SeatDB seatDB;
	BookingDB bookingDB;
	Booking_SeatDB booking_seatDB;
	
	@Autowired
	public RESController(CinemaDB cinemaDB, MovieDB movieDB, ScreenDB screenDB, TimeDB timeDB, SeatDB seatDB, 
			BookingDB bookingDB, Booking_SeatDB booking_seatDB) {
		super();
		this.cinemaDB = cinemaDB;
		this.movieDB = movieDB;
		this.screenDB = screenDB;
		this.timeDB = timeDB;
		this.seatDB = seatDB;
		this.bookingDB = bookingDB;
		this.booking_seatDB = booking_seatDB;
	}
	
	@RequestMapping("/reservation.do")
	public ModelAndView goToReservation(){
		return new ModelAndView("/reservation/reservation");
	}
	@RequestMapping("/goSeat.do")
	public ModelAndView goToSeat(@RequestParam("time") String time, @RequestParam("movieCd") String movieCd, 
			@RequestParam("cinemaID") String cinemaID, @RequestParam("screenID") String screenID, 
			@RequestParam("strdate") String strdate){
		HashMap<String, String> curinfo = new HashMap<String, String>();
		curinfo.put("time", time);
		curinfo.put("movieCd", movieCd);
		curinfo.put("cinemaID", cinemaID);
		curinfo.put("screenID", isoToUTF(screenID));
		curinfo.put("strdate", strdate);
		
		String movieName = movieDB.getMovie(movieCd).getMovo().getTitle();
		curinfo.put("movieName", movieName);
		
		return new ModelAndView("/reservation/seat", "curinfo", curinfo);
	}

	@RequestMapping(value="/ViewTimeTable.do", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> doViewTimeTable(@RequestParam("cinemaID") String cinemaID, @RequestParam("movieCd") String movieCd,
			@RequestParam("strdate") String strdate){
		Date date = Date.valueOf(strdate);
		List<TimeEntity> timelist = timeDB.getViewTimeTable(cinemaID,movieCd,date);
		List<MovieEntity> movielist = movieDB.getMovieList(movieCd);
		
		HashMap<String, Object> tableobj = new HashMap<String, Object>();
		tableobj.put("time", timelist);
		tableobj.put("movie", movielist);
		
		return tableobj;
	}
	
	@RequestMapping("/CinemaSelect.do")
	public @ResponseBody List<CinemaEntity> doCinemaSelect(){
		return cinemaDB.getSelectAll();
	}
	
	@RequestMapping("/ScreenSelect.do")
	public @ResponseBody List<ScreenEntity> doScreenSelect(@RequestParam("cinemaID") String cinemaID){
		return screenDB.getSelect(cinemaID);
	}
	
	@RequestMapping("/TimeSelect.do")
	public @ResponseBody List<TimeEntity> doTimeSelect(@RequestParam("cinemaID") String cinemaID, @RequestParam("screenID") String screenID){
		ScreenEntity se = new ScreenEntity(cinemaID, screenID);
		return timeDB.getSelect(se);
	}
	
	@RequestMapping("/OpenMovieLoad.do")
	public @ResponseBody List<MovieEntity> doOpenMovieLoad(){
		return movieDB.getOpenMovieLoad(); 
	}
	
	@RequestMapping("/CinemaRefresh.do")
	public @ResponseBody List<CinemaEntity> doCinemaRefresh(@RequestParam("movieCd") int movieCd){
		return cinemaDB.getCinemaRefresh(movieCd);
	}
	
	@RequestMapping("/CalendarRefresh.do")
	public @ResponseBody List<String> doCalendarRefresh(@RequestParam("cinemaID") String cinemaID,
			@RequestParam("movieCd") String movieCd){
		List<RunningPeriodEntity> rpelist = timeDB.getDayList(cinemaID, movieCd);
		List<String> daylist = new ArrayList<String>();
		Date s_date = null;
		Date e_date = null;
		for(RunningPeriodEntity rpe : rpelist){
			s_date = rpe.getS_date();
			e_date = rpe.getE_date();
		}
		LocalDate localE_date = e_date.toLocalDate();
		LocalDate localS_date = s_date.toLocalDate();
		int daycnt = 0;
		if(localE_date.getYear()==localS_date.getYear()){
			daycnt = localE_date.getDayOfYear()-localS_date.getDayOfYear();
		} else {
			if(localS_date.isLeapYear()){
				daycnt = localE_date.getDayOfYear()+(366-localS_date.getDayOfYear());
			} else {
				daycnt = localE_date.getDayOfYear()+(365-localS_date.getDayOfYear());
			}
		}
		for(int i=0; i<=daycnt; i++){
			daylist.add(localS_date.toString());
			System.out.println(localS_date);
			localS_date = localS_date.plusDays(1);
		}
		return daylist;
	}
	
	
	@RequestMapping("SeatLoad.do")
	public @ResponseBody List<SeatEntity> doSeatLoad(@RequestParam("cinemaID") String cinemaID, 
			@RequestParam("screenID") String screenID){
		return seatDB.doSeatLoad(cinemaID, screenID);
	}
	
	@RequestMapping("/confirmBooking.do")
	public ModelAndView confirmBooking(@RequestParam("cinemaID") String cinemaID, @RequestParam("screenID") String screenID,
			@RequestParam("seats") List<String> seats, @RequestParam("movietime") String starttime, @RequestParam("movieCd") 
	String movieCd, @RequestParam("strdate") String strdate, HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberEntity me = (MemberEntity) session.getAttribute("me");
		int memberno = me.getMemberno();
		
		Date date = Date.valueOf(strdate);

		try {
			stringEncodingChecker(screenID);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int timeno = timeDB.getTimeEntity(cinemaID, screenID, movieCd, date, starttime).getTimeno();
		
		BookingVO bookingVO = new BookingVO();
		bookingVO.setCinemaID(cinemaID);
		bookingVO.setScreenID(screenID);
		bookingVO.setMovieCd(movieCd);
		bookingVO.setMemberno(memberno);
		bookingVO.setTimeno(timeno);
		bookingVO.setBookingdate(date);
		
		String msg="";
		bookingDB.inputBookingInfo(bookingVO);
		ArrayList<Integer> mybookingNums = new ArrayList<Integer>();
		for(BookingEntity be : bookingDB.getBooking(bookingVO)){
			mybookingNums.add(be.getBookingno());
		}
		
		//예약번호가 존재하는지 체크하여 존재하면 좌석DB에 삽입하지 않는다.
		int mybookingno=0;
		for(int num : mybookingNums){
			System.out.println(num);
			if(booking_seatDB.getMySeatList(num).isEmpty()){
				System.out.println("bookingno in if: "+num);
				mybookingno=num;	
			};
		}

		for(String seat : seats){
			String[] seatrowcol = seat.split("_");
			int seatno = seatDB.getSeatNo(cinemaID, screenID,seatrowcol);
			Booking_SeatEntity bsentity = new Booking_SeatEntity(mybookingno, seatno, cinemaID, screenID);
			Boolean chk = booking_seatDB.insertBooking_Seat(bsentity);
			if(chk){
				System.out.println("Booking_Seat insert success");
			}else{
				System.out.println("Booking_Seat insert failed");
			}
		}
		
		List<Booking_SeatEntity> myseatlist = booking_seatDB.getMySeatList(mybookingno);
		
		if(myseatlist!=null){
			System.out.println("예매 완료");
			msg = "예매가 완료되었습니다.";
			return new ModelAndView("/reservation/mybookingstat","successmsg",msg);
		} else {
			msg = "예매가 정상적으로 완료되지 않았습니다. 다시 시도하여 주십시오.";
			return new ModelAndView("/reservation/reservation","errormsg",msg);
		}
		
	}
	
	@RequestMapping("/confirmBookingInMain.do")
	public ModelAndView confirmBookingInMain(@RequestParam("movieCd") Integer movieCd){
		return new ModelAndView("/reservation/reservation","movieCd",movieCd);
	}
	
	@RequestMapping("/loadBookingInfo.do")
	public @ResponseBody ArrayList<HashMap<String, Object>> loadBookingInfo(@RequestParam("myNo") Integer myNo){
		List<BookingEntity> mybookinglist = bookingDB.getBookingByNo(myNo);
	
		ArrayList<HashMap<String,Object>> m = new ArrayList<HashMap<String,Object>>();
		
		HashMap<String, Object> detailInfo = new HashMap<String, Object>();
		for(BookingEntity myinfo: mybookinglist){
			int bookingNo = myinfo.getBookingno();
			detailInfo.put("bookingNo", bookingNo);
			
			String movieCd = myinfo.getBvo().getMovieCd();
			String movieName = movieDB.getMovie(movieCd).getMovo().getTitle();
			detailInfo.put("movieName", movieName);
			
			String cinemaID = myinfo.getBvo().getCinemaID();
			String cinemaName = cinemaDB.getCinema(cinemaID).getCinemaVO().getCinemaname();
			detailInfo.put("cinemaName", cinemaName);
			
			String screenID = myinfo.getBvo().getScreenID();
			detailInfo.put("screenID", screenID);
			
			int timeNo = myinfo.getBvo().getTimeno();
			String startTime = timeDB.getTime(timeNo).getTimeVO().getStartTime();
			detailInfo.put("startTime", startTime);

			Date date = myinfo.getBvo().getBookingdate();
			detailInfo.put("date", date);

			List<Booking_SeatEntity> seat = booking_seatDB.getMySeatList(myinfo.getBookingno());
			List<String> seatlist = new ArrayList<String>();
			for(Booking_SeatEntity bs : seat){
				SeatEntity se = seatDB.getSeat(bs.getSeatno());
				String seatRowCol = se.getSeatVO().getSeatRow() + se.getSeatVO().getSeatCol();
				seatlist.add(seatRowCol);
			}
			detailInfo.put("seatList", seatlist);
			m.add(detailInfo);
			detailInfo = new HashMap<String, Object>();
		}
		return m;
	}
	
	@RequestMapping("LoadedSeat.do")
	public @ResponseBody List<SeatEntity> doLoadedSeat(@RequestParam("cinemaID") String cinemaID, 
			@RequestParam("screenID") String screenID, @RequestParam("time") String time, 
			@RequestParam("strdate") String strdate, @RequestParam("movieCd") String movieCd){
		Date date = Date.valueOf(strdate);
		int timeno = timeDB.getTimeEntity(cinemaID, screenID, movieCd, date, time).getTimeno();
		List<BookingEntity> belist = bookingDB.getBooking(date, timeno, cinemaID, screenID);
		List<SeatEntity> loadedseatlist = new ArrayList<SeatEntity>();
		for(BookingEntity be : belist){
			List<Booking_SeatEntity> seatlist = booking_seatDB.getMySeatList(be.getBookingno());	
			for(Booking_SeatEntity bsentity : seatlist){
				SeatEntity s = seatDB.getSeat(bsentity.getSeatno());
				loadedseatlist.add(s);
			}
		}
		return loadedseatlist;
	}
	// 예약 취소 추가
	@RequestMapping(value="/reservationdelete.do")
	public @ResponseBody String doMemberDelete(HttpSession session, @RequestParam("resno") int resno) throws UnsupportedEncodingException{
		String msg="";
		int n = bookingDB.getResDelete(resno);
		if (n > 0) {
			System.out.println("예매취소 완료");
			msg = "예매가 취소되었습니다.";
			
			return new String(msg.getBytes("euc-kr"), "ksc5601");
		} else {
			msg = "취소가 정상적으로 완료되지 않았습니다. 다시 시도하여 주십시오.";
			return msg;
		}
	} 

}
