/* Editor: Chanho */
package com.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.biz.BoardService;
import com.entity.Board;

@Controller
public class BoardController {
	
	BoardService boardService;

	@Autowired
	public BoardController(BoardService boardService) {
		super();
		this.boardService = boardService;
	}

	@RequestMapping("/insert.do")
	public ModelAndView insert(){
		ModelAndView mav = new ModelAndView("/board/BoardInsert");
		return mav;
	}
	
	@RequestMapping(value="/insertProc.do", method=RequestMethod.POST)
	public ModelAndView insertProc(@ModelAttribute Board board){
		System.out.println("입력한다");
		Calendar now = Calendar.getInstance();
		String insertDate = String.valueOf(now.get(Calendar.YEAR))+"-"+String.valueOf(now.get(Calendar.MONTH)+1)+"-"+String.valueOf(now.get(Calendar.DAY_OF_MONTH))
											+" "+String.valueOf(now.get(Calendar.HOUR))+":"+String.valueOf(now.get(Calendar.MINUTE));
		System.out.println(insertDate);
		board.setInsertDate(insertDate);
		boardService.insertBoard(board);
		//////////////////////////���� �ϰ�///////////////////////////
		
		ModelAndView mav = new ModelAndView();
		//--����¡ ó��
	    int totalCount = boardService.getBoardListCount(); //@@@@@@@������ �� ��ü ����Ʈ�� �����ָ� �ǹǷ� �׳� ��ü count ���ش�.
	    
	    System.out.println("데이터 전체 갯수는: "+totalCount);
	    
	    Board boardpage = new Board();
	    boardpage.setTotalCount(totalCount); //����¡ ó���� ���� setter ȣ��
	    System.out.println("총 페이지 수 : "+boardpage.getFinalPageNo());
	    
	    mav.addObject("pageVO", boardpage);
	    //--����¡ ó��
	  
	    List<Board> boardList = boardService.listBoard(boardpage);
	  
	    mav.addObject("all", boardList);
	    
	    mav.setViewName("board/BoardAll");
		return mav;
	}
	
	@RequestMapping("/find.do")
	public ModelAndView findBoard(@RequestParam("boardno") int boardno){
		//��ȸ�� 1 ����
		boardService.plusHits(boardno);
		
		Board board = boardService.findBoard(boardno); 
		ModelAndView mav = new ModelAndView("board/BoardUpdate", "find", board);
		return mav;
	}
	
	@RequestMapping(value="/BoardUpdate.do")
	public ModelAndView updateEmp(@RequestParam("boardno") int boardno,
			@RequestParam("name") String name,
			@RequestParam("title") String title,
			@RequestParam("contents") String contents){
		
		Board board = new Board(boardno,name,title,contents);
		boardService.updateBoard(board);
		//////////////////////////���� �ϰ�///////////////////////////
		
		ModelAndView mav = new ModelAndView();
		//--����¡ ó��
	    int totalCount = boardService.getBoardListCount();
	    
	    Board boardpage = new Board();
	    boardpage.setTotalCount(totalCount); //����¡ ó���� ���� setter ȣ��
	    System.out.println("총 페이지 수 : "+boardpage.getFinalPageNo());
	    
	    mav.addObject("pageVO", boardpage);
	    //--����¡ ó��
	  
	    List<Board> boardList = boardService.listBoard(boardpage);
	  
	    mav.addObject("all", boardList);
	    
	    mav.setViewName("board/BoardAll");
		return mav;
	}
	
	@RequestMapping(value="/delete.do")
	public ModelAndView deleteProc(@RequestParam("boardno") int boardno){
		boardService.deleteBoard(boardno);
		////////////////////삭제하고///////////////////////////
		
		ModelAndView mav = new ModelAndView();
		//페이징 시작
	    int totalCount = boardService.getBoardListCount();
	    
	    System.out.println("������ �� ������ : "+totalCount);
	    
	    Board boardpage = new Board();
	    boardpage.setTotalCount(totalCount); //����¡ ó���� ���� setter ȣ��
	    System.out.println(boardpage.getFinalPageNo());
	    
	    mav.addObject("pageVO", boardpage);
	    //--����¡ ó��
	  
	    List<Board> boardList = boardService.listBoard(boardpage);
	  
	    mav.addObject("all", boardList);
	    
	    mav.setViewName("board/BoardAll");
	    
		return mav;
	}
	
	@RequestMapping(value = "/AllList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView page(@ModelAttribute("Board") Board board) {

		ModelAndView mav = new ModelAndView();
		//--����¡ ó��
	    int totalCount = boardService.getBoardListCount(); //�� ó�� ������ �Ѹ� ���ϱ� �׳� ��ü �����ָ� �ȴ�.
	    
	    System.out.println("������ �� ������ : "+totalCount);
	    
	    Board boardpage = new Board();
	    boardpage.setTotalCount(totalCount); //����¡ ó���� ���� setter ȣ��
	    System.out.println(boardpage.getFinalPageNo());
	    
	    mav.addObject("pageVO", boardpage);
	    //--����¡ ó��
	  
	    List<Board> boardList = boardService.listBoard(boardpage);
	  
	    mav.addObject("all", boardList);
	    
	    mav.setViewName("board/BoardAll");
	    return mav;
	}
	
	@RequestMapping(value = "/anotherList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView anotherpage(@ModelAttribute("Board") Board board, @RequestParam("number") int number) {

		ModelAndView mav = new ModelAndView();
		//--����¡ ó��
	    int totalCount = boardService.getBoardListCount(); //��ü
	    
	    System.out.println("������ �� ������ : "+totalCount);
	    
	    Board boardpage = new Board();
	    boardpage.setPageNo(number);
	    boardpage.setTotalCount(totalCount); //����¡ ó���� ���� setter ȣ��

	    System.out.println(boardpage.getFinalPageNo());

	    
	    mav.addObject("pageVO", boardpage);
	    //--����¡ ó�
	  
	    List<Board> boardList = boardService.listBoard(boardpage);
	  
	    mav.addObject("all", boardList);
	    
	    mav.setViewName("board/BoardAll");
	    return mav;
	}
	
	@RequestMapping(value = "/searchList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView searchpage(@ModelAttribute("Board") Board board, @RequestParam("searchf") String searchf,
									@RequestParam("searchv") String searchv) {

		ModelAndView mav = new ModelAndView();
		//--����¡ ó��
		Board boardpage = new Board();
		boardpage.setSearchFiled(searchf);
	    boardpage.setSearchValue(searchv);
		
		int totalCount = boardService.getSearchBoardListCount(boardpage); //�Խù� �Ѱ����� ���Ѵ�.
	    System.out.println("������ �� ������ : "+totalCount);
	    
	    boardpage.setTotalCount(totalCount); //����¡ ó���� ���� setter ȣ��
	    
	    mav.addObject("pageVO", boardpage);
	    //--����¡ ó��
	  
	    List<Board> boardList = boardService.listBoard(boardpage);
	  
	    mav.addObject("all", boardList);
	    
	    mav.setViewName("board/BoardAll");
	    return mav;
	}
	
}
