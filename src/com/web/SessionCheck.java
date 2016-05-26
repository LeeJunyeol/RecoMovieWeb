package com.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.MemberEntity;

@WebServlet("/SessionCheck.do")
public class SessionCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SessionCheck() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		MemberEntity me = (MemberEntity) session.getAttribute("me");
		if(me!=null){
			out.print(me.getId());
		} else {
			out.print("sessionNull");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}


// 리턴하는 me.getmemerno를 me.getmemberid로 바꾸고 (o)
// sessioncheck에서 
// data==admin일때 메뉴 다르게 보이도록
// admin일때, sessionnull일때, else일때 세가지 경우.
