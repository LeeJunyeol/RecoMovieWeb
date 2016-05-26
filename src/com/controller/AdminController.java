package com.controller;
 
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.biz.BookingDB;
import com.biz.CinemaDB;
import com.biz.MemberDB;
import com.biz.MovieDB;
import com.biz.Movie_CinemaDB;
import com.biz.ScreenDB;
import com.biz.SeatDB;
import com.biz.TimeDB;
import com.entity.BookingEntity;
import com.entity.BookingVO;
import com.entity.CinemaEntity;
import com.entity.CinemaVO;
import com.entity.MemberEntity;
import com.entity.MovieEntity;
import com.entity.MovieVO;
import com.entity.Movie_CinemaEntity;
import com.entity.Movie_CinemaVO;
import com.entity.ScreenEntity;
import com.entity.SeatEntity;
import com.entity.SeatVO;
import com.entity.TimeEntity;
import com.entity.TimeVO;
import com.filevalidate.UploadFile;
import com.filevalidate.FileValidator;

import static com.util.Encoder.utfToIso;
import static com.util.Encoder.findMultipartFileEncoding;

@Controller
public class AdminController {
	MemberDB memberDB;
	MovieDB movieDB;
	Movie_CinemaDB movie_cinemaDB;
	BookingDB bookingDB;
	TimeDB timeDB;
	CinemaDB cinemaDB;
	ScreenDB screenDB;
	SeatDB seatDB;

	private FileValidator fileValidator;

	@Autowired
	public AdminController(MemberDB memberDB, MovieDB movieDB, FileValidator fileValidator, 
			BookingDB bookingDB, TimeDB timeDB, Movie_CinemaDB movie_cinemaDB, CinemaDB cinemaDB, 
			ScreenDB screenDB, SeatDB seatDB) {
		super();
		this.memberDB = memberDB;
		this.movieDB = movieDB;
		this.movie_cinemaDB = movie_cinemaDB;
		this.fileValidator = fileValidator;
		this.bookingDB = bookingDB;
		this.timeDB = timeDB;
		this.cinemaDB = cinemaDB;
		this.screenDB = screenDB;
		this.seatDB = seatDB;
	}

 	@RequestMapping("/goMainAdm.do")
	public ModelAndView goMainAdm(){
		return new ModelAndView("/admin/mainAdmin");
	}
	
	@RequestMapping("/goMemberAdm.do")
	public ModelAndView goMemberAdm(){
		List<MemberEntity> memberList = memberDB.getSelectAll();
		return new ModelAndView("/admin/memberAdmin", "memberList", memberList);
	}
	
	//Memeber Contoller in Admin
	@RequestMapping("/MemberDeleteAdmin.do")
	public ModelAndView memberDeleteAdmin(@RequestParam("ch") List<Integer> nums){
		int n=0;
		for(Integer memberno: nums){
			n+=memberDB.getMemberDelete(memberno);
		}
		if(n>0){
			System.out.println("Admin Member Delete Success");
			return goMemberAdm();
		} else {
			System.out.println("Admin Member Delete Failed");
			return goMemberAdm();
		}
	}
	
	//파일 인코딩은 UTF-8
	@RequestMapping(value="/MemberUpload.do", method=RequestMethod.POST)
	public ModelAndView memberUpload(HttpServletRequest request, @ModelAttribute UploadFile uploadFile, BindingResult result) throws UnsupportedEncodingException{
		fileValidator.validate(uploadFile, result);
		if(result.hasErrors()){
			return new ModelAndView("/admin/memberAdmin");
		}
		
		MultipartFile file = uploadFile.getFile();
		try {
			System.out.println(findMultipartFileEncoding(file));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String filename=file.getOriginalFilename();
		UploadFile fileobj = new UploadFile();
		fileobj.setFilename(filename);
		fileobj.setDesc(uploadFile.getDesc());

		InputStream in = null;
		BufferedReader br = null;
		
		try{
			in=file.getInputStream();
			br = new BufferedReader(new InputStreamReader(in));
			
			String line = null;
			br.readLine();	//첫 줄 스킵
			while((line = br.readLine()) != null){
				String[] str = line.split("\t");
				MemberEntity me = new MemberEntity(str[0],str[1],utfToIso(str[2]), utfToIso(str[3]),
						Date.valueOf(str[4]),utfToIso(str[5]),str[6],str[7]);
				memberDB.getMemberInsert(me);
			}
		}catch(IOException e){
			e.printStackTrace();
		}finally {
			try{
				if(br!=null){
					br.close();
				}
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		return goMemberAdm();	
	}
	
	// 수정
	@RequestMapping("/MemberFindAdmin.do")
	public ModelAndView findMembers(@RequestParam("ch") List<Integer> nums) {
		List<MemberEntity> memList = memberDB.getSelectedMemberList(nums);
		return new ModelAndView("admin/memberUpdate","memlist", memList);
	}
	
	@RequestMapping("/MemberUpdateAdmin.do")
	public ModelAndView goMovieUpdate(@ModelAttribute MemberEntity me){
		List<MemberEntity> memberList = me.getMemberList();
		for(MemberEntity res : memberList){
			memberDB.getMemberAllUpdate(res);
		}
		return goMemberAdm();
	}
	
	/*	**********************************************************************************/
	/*	Movie 관련*/
		
		// 전체출력
		@RequestMapping("/goMovieAdm.do")
		public ModelAndView goMovieAdm(){
			List<MovieEntity> movieList = movieDB.getMovieSelectAll();
			return new ModelAndView("/admin/movieAdmin", "movieList", movieList);
		}
		
		// 삭제
		@RequestMapping("/movieDelete.do")
		public String deleteMovie(@RequestParam String[] ch) {
			movieDB.deleteMovie(ch);
			return "redirect:/goMovieAdm.do";
		}
		
		// 추가
		@RequestMapping("/movieInsert.do")
		public ModelAndView insertMovie() {
			return new ModelAndView("admin/movieInsert");
		}
		
		@RequestMapping("/movieInput.do")
		public String inputMovie(@RequestParam("movieCd") String movieCd,@ModelAttribute MovieVO movie) {
			if (movieCd == null) {
				return "/admin/movieInsert";
			} else {
				MovieEntity me = new MovieEntity(movieCd, movie);
				movieDB.insertMovie(me);
				return "redirect:/goMovieAdm.do";
			}
		}
		
		// 수정
		@RequestMapping("/movieFind.do")
		public String findMovie(Model model, @RequestParam List<String> ch) {
			model.addAttribute("movieFind", movieDB.findMovie(ch));
			return "admin/movieUpdate";
		}
		
		@RequestMapping("/movieUpdate.do")
		public String updateMovie(@ModelAttribute MovieEntity movie) {
			//System.out.println(movie);
			List<MovieEntity> me = movie.getMovieList();
			for(MovieEntity mo : me){
				movieDB.updateMovie(mo);
			}
			/*for(int i=0; i<me.size(); i++){
				MovieEntity mo = me.get(i);
				movieDB.updateMovie(mo);
			}*/
			return "redirect:/goMovieAdm.do";
		}

		@RequestMapping(value="/MovieUpload.do", method=RequestMethod.POST)
		public ModelAndView movieUpload(HttpServletRequest request, @ModelAttribute UploadFile uploadFile, BindingResult result) throws UnsupportedEncodingException{
			fileValidator.validate(uploadFile, result);
			if(result.hasErrors()){
				return new ModelAndView("/admin/movieAdmin");
			}
			
			MultipartFile file = uploadFile.getFile();
			try {
				System.out.println(findMultipartFileEncoding(file));
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String filename=file.getOriginalFilename();
			UploadFile fileobj = new UploadFile();
			fileobj.setFilename(filename);
			fileobj.setDesc(uploadFile.getDesc());

			InputStream in = null;
			BufferedReader br = null;
			
			try{
				in=file.getInputStream();
				br = new BufferedReader(new InputStreamReader(in));
				
				String line = null;
				br.readLine();	//첫 줄 스킵
				while((line = br.readLine()) != null){
					String[] str = line.split("\t");
					MovieVO mvo = new MovieVO();
					mvo.setTitle(str[1]);
					mvo.setTitleen(str[2]);
					mvo.setYear(Integer.parseInt(str[3]));
					mvo.setNation(str[4]);
					mvo.setType(str[5]);
					mvo.setGenre(str[6]);
					mvo.setDirector(str[7]);
					mvo.setCompany(str[8]);
					mvo.setOpendate(str[9]);
					mvo.setRunningtime(str[10]);
					MovieEntity movie = new MovieEntity(str[0], mvo); 
					movieDB.insertMovie(movie);
				}
			}catch(IOException e){
				e.printStackTrace();
			}finally {
				try{
					if(br!=null){
						br.close();
					}
				}catch(IOException e){
					e.printStackTrace();
				}
			}
			return goMovieAdm();	
		}
		
		/*	**********************************************************************************/	
		/*	Cinema 관련*/
		
		// 전체출력
		@RequestMapping("/goCinemaAdm.do")
		public ModelAndView goCinemaAdm(){
			List<CinemaEntity> cinemaList = cinemaDB.getCinemaSelectAll();
			System.out.println("Cinema Controller");
			return new ModelAndView("/admin/cinemaAdmin", "cinemaList", cinemaList);
		}
		
		// 삭제
		@RequestMapping("/cinemaDelete.do")
		public String deleteCinema(@RequestParam String[] ch) {
			cinemaDB.deleteCinema(ch);
			return "redirect:/goCinemaAdm.do";
		}
		
		// 추가
		@RequestMapping("/cinemaInsert.do")
		public ModelAndView insertCinema() {
			return new ModelAndView("admin/cinemaInsert");
		}
		
		@RequestMapping("/cinemaInput.do")
		public String inputCinema(@RequestParam("cinemaID") String cinemaid, @ModelAttribute CinemaVO cinema) {
			if (cinemaid == null) {
				return "/admin/cinemaInsert";
			} else {
				CinemaEntity ce = new CinemaEntity(cinemaid, cinema);
				cinemaDB.insertCinema(ce);
				return "redirect:/goCinemaAdm.do";
			}
		}
		
		// 수정
		@RequestMapping("/cinemaFind.do")
		public String findCinema(Model model, @RequestParam List<String> ch) {
			model.addAttribute("cinemaFind", cinemaDB.findCinema(ch));
			return "admin/cinemaUpdate";
		}
		
		@RequestMapping("/cinemaUpdate.do")
		public String updateCinema(@ModelAttribute CinemaEntity cinema) {
			List<CinemaEntity> ce = cinema.getCinemaList();
			
			for(CinemaEntity co : ce){
				cinemaDB.updateCinema(co);
			}
			return "redirect:/goCinemaAdm.do";
		}

		@RequestMapping(value="/CinemaUpload.do", method=RequestMethod.POST)
		public ModelAndView cinemaUpload(HttpServletRequest request, @ModelAttribute UploadFile uploadFile, BindingResult result) throws UnsupportedEncodingException{
			fileValidator.validate(uploadFile, result);
			if(result.hasErrors()){
				return new ModelAndView("/admin/cinemaAdmin");
			}
			
			MultipartFile file = uploadFile.getFile();
			try {
				System.out.println(findMultipartFileEncoding(file));
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String filename=file.getOriginalFilename();
			UploadFile fileobj = new UploadFile();
			fileobj.setFilename(filename);
			fileobj.setDesc(uploadFile.getDesc());

			InputStream in = null;
			BufferedReader br = null;
			
			try{
				in=file.getInputStream();
				br = new BufferedReader(new InputStreamReader(in));
				
				String line = null;
				br.readLine();	//첫 줄 스킵
				while((line = br.readLine()) != null){
					String[] str = line.split("\t");
					CinemaVO cvo = new CinemaVO();
					cvo.setCinemaname(str[1]);
					cvo.setBrand(str[2]);
					cvo.setLoc(str[3]);
					CinemaEntity cinema = new CinemaEntity(str[0], cvo); 
					cinemaDB.insertCinema(cinema);
				}
			}catch(IOException e){
				e.printStackTrace();
			}finally {
				try{
					if(br!=null){
						br.close();
					}
				}catch(IOException e){
					e.printStackTrace();
				}
			}
			return goCinemaAdm();	
		}
				
/*	**********************************************************************************/		
		@RequestMapping("movieIsRun.do")
		public @ResponseBody List<Movie_CinemaEntity> movieIsRun(@RequestParam("movieCd") String movieCd){
			return movie_cinemaDB.getMovie_CinemaList(movieCd);
		}
		
/*	**********************************************************************************/
		
		/*	Booking 관련*/

		// 전체출력
		@RequestMapping("/goBookingAdm.do")
		public ModelAndView goBookingAdm(){
			List<BookingEntity> bookingList = bookingDB.getBookingSelectAll();
			return new ModelAndView("/admin/bookingAdmin", "bookingList", bookingList);
		}
		
		// 삭제
		@RequestMapping("/bookingDelete.do")
		public String deleteBooking(@RequestParam String[] ch) {
			bookingDB.deleteBooking(ch);
			return "redirect:/goBookingAdm.do";
		}
		
		// 추가
		@RequestMapping("/bookingInsert.do")
		public ModelAndView insertBooking() {
			return new ModelAndView("admin/bookingInsert");
		}
		
		@RequestMapping("/bookingInput.do")
		public String inputBooking(@RequestParam("bookingno") Integer bookingno,
				@ModelAttribute BookingVO booking) {
			if (bookingno == null) {
				return "/admin/bookingInsert";
			} else {
				BookingEntity be = new BookingEntity(bookingno, booking);
				bookingDB.insertBooking(be);
				return "redirect:/goBookingAdm.do";
			}
		}
		
		// 수정
		@RequestMapping("/bookingFind.do")
		public String findBooking(Model model, @RequestParam List<Integer> ch) {
			model.addAttribute("bookingFind", bookingDB.findBooking(ch));
			return "admin/bookingUpdate";
		}

		@RequestMapping("/bookingUpdate.do")
		public String updateBooking(@ModelAttribute BookingEntity booking) {
			List<BookingEntity> be = booking.getBookingList();
			for(BookingEntity bo : be){
				bookingDB.updateBooking(bo);
			}
			return "redirect:/goBookingAdm.do";
		}
		
		@RequestMapping(value="/BookingUpload.do", method=RequestMethod.POST)
		public ModelAndView bookingUpload(HttpServletRequest request, @ModelAttribute UploadFile uploadFile, BindingResult result) throws UnsupportedEncodingException{
			fileValidator.validate(uploadFile, result);
			if(result.hasErrors()){
				return new ModelAndView("/admin/bookingAdmin");
			}
			
			MultipartFile file = uploadFile.getFile();
			try {
				System.out.println(findMultipartFileEncoding(file));
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String filename=file.getOriginalFilename();
			UploadFile fileobj = new UploadFile();
			fileobj.setFilename(filename);
			fileobj.setDesc(uploadFile.getDesc());

			InputStream in = null;
			BufferedReader br = null;
			
			try{
				in=file.getInputStream();
				br = new BufferedReader(new InputStreamReader(in));
				
				String line = null;
				br.readLine();	//첫 줄 스킵
				while((line = br.readLine()) != null){
					String[] str = line.split("\t");
					BookingVO bvo = new BookingVO();
					bvo.setMemberno(Integer.parseInt(str[0]));
					bvo.setPhonenumber(str[1]);
					bvo.setTimeno(Integer.parseInt(str[2]));
					bvo.setMovieCd(str[3]);
					bvo.setCinemaID(str[4]);
					bvo.setScreenID(str[5]);
					BookingEntity booking = new BookingEntity(Integer.parseInt(str[0]), bvo); 
					bookingDB.insertBooking(booking);
				}
			}catch(IOException e){
				e.printStackTrace();
			}finally {
				try{
					if(br!=null){
						br.close();
					}
				}catch(IOException e){
					e.printStackTrace();
				}
			}
			return goBookingAdm();	
		}

	/*	**********************************************************************************/
		
		/*	Time 관련*/
		
		// 전체출력
		@RequestMapping("/goTimeAdm.do")
		public ModelAndView goTimeAdm(){
			List<TimeEntity> timeList = timeDB.getTimeSelectAll();
			return new ModelAndView("/admin/timeAdmin", "timeList", timeList);
		}

		// 삭제
		@RequestMapping("/timeDelete.do")
		public String deleteTime(@RequestParam String[] ch) {
			timeDB.deleteTime(ch);
			return "redirect:/goTimeAdm.do";
		}
		
		// 추가
		@RequestMapping("/timeInsert.do")
		public ModelAndView insertTime() {
			return new ModelAndView("admin/timeInsert");
		}
		
		@RequestMapping("/timeInput.do")
		public String inputTime(@RequestParam("timeno") Integer timeno,@ModelAttribute TimeVO time) {
			if (timeno == null) {
				return "/admin/timeInsert";
			} else {
				TimeEntity ti = new TimeEntity(timeno, time);
				timeDB.insertTime(ti);
				return "redirect:/goTimeAdm.do";
			}
		}
		
		// 수정
		@RequestMapping("/timeFind.do")
		public String findTime(Model model, @RequestParam List<Integer> ch) {
			model.addAttribute("timeFind", timeDB.findTime(ch));
			return "admin/timeUpdate";
		}

		@RequestMapping("/timeUpdate.do")
		public String updateTime(@ModelAttribute TimeEntity time) {
			List<TimeEntity> te = time.getTimeList();
			for(TimeEntity to : te){
				timeDB.updateTime(to);
			}
			return "redirect:/goTimeAdm.do";
		}		
		
		@RequestMapping(value="/TimeUpload.do", method=RequestMethod.POST)
		public ModelAndView timeUpload(HttpServletRequest request, @ModelAttribute UploadFile uploadFile, BindingResult result) throws UnsupportedEncodingException{
			fileValidator.validate(uploadFile, result);
			if(result.hasErrors()){
				return new ModelAndView("/admin/timeAdmin");
			}
			
			MultipartFile file = uploadFile.getFile();
			try {
				System.out.println(findMultipartFileEncoding(file));
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String filename=file.getOriginalFilename();
			UploadFile fileobj = new UploadFile();
			fileobj.setFilename(filename);
			fileobj.setDesc(uploadFile.getDesc());

			InputStream in = null;
			BufferedReader br = null;
			
			try{
				in=file.getInputStream();
				br = new BufferedReader(new InputStreamReader(in));
				
				String line = null;
				br.readLine();	//첫 줄 스킵
				while((line = br.readLine()) != null){
					String[] str = line.split("\t");
					TimeVO tvo = new TimeVO();
					tvo.setS_date(Date.valueOf(str[1]));
					tvo.setE_date(Date.valueOf(str[2]));
					tvo.setStartTime(str[3]);
					tvo.setCount(Integer.parseInt(str[4]));
					tvo.setCinemaID(str[5]);
					tvo.setScreenID(str[6]);
					tvo.setMovieCd(str[7]);
					TimeEntity time = new TimeEntity(Integer.parseInt(str[0]), tvo); 
					timeDB.insertTime(time);
				}
			}catch(IOException e){
				e.printStackTrace();
			}finally {
				try{
					if(br!=null){
						br.close();
					}
				}catch(IOException e){
					e.printStackTrace();
				}
			}
			return goTimeAdm();	
		}
		/*	**********************************************************************************/
		
	 	@RequestMapping("/goScreenAdm.do")
		public ModelAndView goScreenAdm(){
			List<ScreenEntity> screenlist = screenDB.getSelectAll();
			return new ModelAndView("/admin/screenAdmin", "screenlist", screenlist);
		}
		
		@RequestMapping(value="/ScreenUpload.do", method=RequestMethod.POST)
		public ModelAndView screenUpload(HttpServletRequest request, @ModelAttribute UploadFile uploadFile, BindingResult result) throws UnsupportedEncodingException{
			fileValidator.validate(uploadFile, result);
			if(result.hasErrors()){
				return new ModelAndView("/admin/screenAdmin");
			}
			
			MultipartFile file = uploadFile.getFile();
			try {
				System.out.println(findMultipartFileEncoding(file));
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String filename=file.getOriginalFilename();
			UploadFile fileobj = new UploadFile();
			fileobj.setFilename(filename);
			fileobj.setDesc(uploadFile.getDesc());

			InputStream in = null;
			BufferedReader br = null;
			
			try{
				in=file.getInputStream();
				br = new BufferedReader(new InputStreamReader(in));
				
				String line = null;
				br.readLine();	//첫 줄 스킵
				while((line = br.readLine()) != null){
					String[] str = line.split("\t");
					ScreenEntity se = new ScreenEntity(str[0], str[1]);
					screenDB.getScreenInsert(se);
				}
			}catch(IOException e){
				e.printStackTrace();
			}finally {
				try{
					if(br!=null){
						br.close();
					}
				}catch(IOException e){
					e.printStackTrace();
				}
			}
			return goScreenAdm();	
		}
		
		@RequestMapping(value="/SeatUpload.do", method=RequestMethod.POST)
		public ModelAndView seatUpload(HttpServletRequest request, @ModelAttribute UploadFile uploadFile, BindingResult result) throws UnsupportedEncodingException{
			fileValidator.validate(uploadFile, result);
			if(result.hasErrors()){
				return new ModelAndView("/admin/screenAdmin");
			}
			
			MultipartFile file = uploadFile.getFile();
			try {
				System.out.println(findMultipartFileEncoding(file));
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String filename=file.getOriginalFilename();
			UploadFile fileobj = new UploadFile();
			fileobj.setFilename(filename);
			fileobj.setDesc(uploadFile.getDesc());

			InputStream in = null;
			BufferedReader br = null;
			
			try{
				in=file.getInputStream();
				br = new BufferedReader(new InputStreamReader(in));
				
				String line = null;
				br.readLine();	//첫 줄 스킵
				while((line = br.readLine()) != null){
					String[] str = line.split("\t");
					SeatVO seatVO = new SeatVO(str[3], Integer.parseInt(str[4]), str[5]);
					SeatEntity se = new SeatEntity(Integer.parseInt(str[0]), str[1], str[2], seatVO);
					seatDB.getSeatInsert(se);
				}
			}catch(IOException e){
				e.printStackTrace();
			}finally {
				try{
					if(br!=null){
						br.close();
					}
				}catch(IOException e){
					e.printStackTrace();
				}
			}
			return goMemberAdm();	
		}
		
		@RequestMapping(value="/Movie_CinemaUpload.do", method=RequestMethod.POST)
		public ModelAndView movie_cinemaUpload(HttpServletRequest request, @ModelAttribute UploadFile uploadFile, BindingResult result) throws UnsupportedEncodingException{
			fileValidator.validate(uploadFile, result);
			if(result.hasErrors()){
				return new ModelAndView("/admin/movieAdmin");
			}
			
			MultipartFile file = uploadFile.getFile();
			try {
				System.out.println(findMultipartFileEncoding(file));
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String filename=file.getOriginalFilename();
			UploadFile fileobj = new UploadFile();
			fileobj.setFilename(filename);
			fileobj.setDesc(uploadFile.getDesc());

			InputStream in = null;
			BufferedReader br = null;
			
			try{
				in=file.getInputStream();
				br = new BufferedReader(new InputStreamReader(in));
				
				String line = null;
				br.readLine();	//첫 줄 스킵
				while((line = br.readLine()) != null){
					String[] str = line.split("\t");
					Movie_CinemaVO movie_cinemaVO = new Movie_CinemaVO(str[3]);
					Movie_CinemaEntity mce = new Movie_CinemaEntity(str[0], str[1], 
							str[2], movie_cinemaVO);
					movie_cinemaDB.insertMovie_Cinema(mce);
				}
			}catch(IOException e){
				e.printStackTrace();
			}finally {
				try{
					if(br!=null){
						br.close();
					}
				}catch(IOException e){
					e.printStackTrace();
				}
			}
			return goMovieAdm();	
		}
		
		@RequestMapping("/MovieCineAdmin.do")
		public ModelAndView viewMovieCine(@RequestParam("ch") List<String> nums){
			List<List<Movie_CinemaEntity>> moviecinelist = new ArrayList<List<Movie_CinemaEntity>>();
			for(String movieCd : nums)	{
				moviecinelist.add(movie_cinemaDB.getMovie_CinemaList(movieCd));
			}			
			return new ModelAndView("/admin/movieCinemaAdmin","moviecinelist",moviecinelist);
		}
}
