package com.controller;

import static com.util.Encoder.isoToUTF;
import static com.util.Encoder.stringEncodingChecker;

import java.io.UnsupportedEncodingException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.biz.MemberDB;
import com.entity.MemberEntity;

@Controller
public class MemberController {
	MemberDB memberDB;
	
	@Autowired
	public MemberController(MemberDB memberDB) {
		super();
		this.memberDB= memberDB;
	}
	
	@RequestMapping(value="/memberlogin.do")
	public ModelAndView goMemberLogin(){
		return new ModelAndView("/member/login");
	}
	
	@RequestMapping(value="/memberjoin.do")
	public ModelAndView goMemberJoin(){
		return new ModelAndView("/member/join");
	}
	
	@RequestMapping(value="/mybookingstat.do")
	public ModelAndView goBookingStat(){
		return new ModelAndView("/reservation/mybookingstat");
	}
	
	@RequestMapping(value="/memberupdate.do")
	public ModelAndView goMemberUpdate(){
		return new ModelAndView("/member/memberupdate");
	}
		
	/* 추가 (희정) */
	@RequestMapping(value="/about.do")
	public ModelAndView goAbout(){
		return new ModelAndView("/etc/about");
	}
	@RequestMapping(value="/movie.do")
	public ModelAndView goMovie(){
		return new ModelAndView("/etc/movie");
	}
	@RequestMapping(value="/team.do")
	public ModelAndView goTeam(){
		return new ModelAndView("/etc/team");
	}

		
	@RequestMapping(value="/loginproc.do")
	public ModelAndView doMemLogin(HttpSession session, @RequestParam("id") String id, @RequestParam("pw") String pw){
		try{
			MemberEntity me = memberDB.getMyIdFind(id);
			if(id.equals(me.getId())){
				if(pw.equals(me.getPw())){
					session.setAttribute("me", me);
					if((me.getId()).equals("admin")){
						// 관리자 페이지로 이동
						return new ModelAndView("/admin/adminindex");
					} else {
						return new ModelAndView("redirect:/index.html");
					}
				} else {
					return new ModelAndView("/member/login", "error_message", "아이디/비밀번호가 일치하지 않습니다.");
				}
			} else {
				return new ModelAndView("/member/login", "error_message", "아이디/비밀번호가 일치하지 않습니다.");
			}
		} catch(Exception e){
			return new ModelAndView("/member/login", "error_message", "아이디/비밀번호가 일치하지 않습니다.");
		}
	}
	
	@RequestMapping(value="/memberlogout.do")
	public ModelAndView doMemberLogout(HttpSession session){
		session.invalidate();
		return new ModelAndView("redirect:/index.html");
	}
	
	@RequestMapping(value="/memberinsert.do")
	public ModelAndView doMemberInsert(@ModelAttribute MemberEntity me){
		memberDB.getMemberInsert(me);
		return new ModelAndView("redirect:/index.html");
	}	
	
	@RequestMapping(value="/updateproc.do")
	public ModelAndView doMemberUpdate(HttpServletRequest request){
		int memberno = Integer.parseInt(request.getParameter("no"));
		String id = request.getParameter("id");
		String pw = "";
		if(request.getParameter("newpw").isEmpty()){
			pw = request.getParameter("currentpw");
		} else {
			pw = request.getParameter("newpw");
		}
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		Date birth = Date.valueOf(request.getParameter("birth"));
		String addr = isoToUTF(request.getParameter("addr"));
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		
		MemberEntity me = new MemberEntity(memberno,id,pw,name,sex,birth,addr,tel,email);
		int n = memberDB.getMemberUpdate(me);
		if (n > 0) {
			System.out.println("Update Success");
			return new ModelAndView("/member/memberupdate");
		} else {
			System.out.println("Update Failed");
			return new ModelAndView("/member/memberupdate");
		}
	}
	
	@RequestMapping(value="/memberdelete.do")
	public ModelAndView doMemberDelete(HttpSession session, @RequestParam("no") int memberno){
		session.invalidate();
		int n = memberDB.getMemberDelete(memberno);
		if (n > 0) {
			System.out.println("Delete Success");
			return new ModelAndView("redirect:/index.html");
		} else {
			System.out.println("Delete Failed");
			return new ModelAndView("redirect:/index.html");
		}
	}
	
}
