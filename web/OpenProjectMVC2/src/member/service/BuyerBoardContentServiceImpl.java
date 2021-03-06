package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import board.model.Board;
import jdbc.ConnectionProvider;
import login.LoginInfo;
import member.dao.MemberDao;
import member.model.Member;
import service.Service;

public class BuyerBoardContentServiceImpl implements Service {

MemberDao dao;
	
	@Override
	public String getViewPage(
			HttpServletRequest request, 
			HttpServletResponse response) {
//		title content
		
		LoginInfo info=(LoginInfo)request.getAttribute("info");
		System.out.println("정보확인:"+info);
		Member member=(Member)request.getAttribute("member");
		System.out.println("member정보확인:"+member);
		List<Member> list=(List)request.getAttribute("list");
		System.out.println("list정보확인:"+list);
		System.out.println("--------------------");
		
		String uid=(String)request.getParameter("uid");
		System.out.println("uid:"+uid);
		
		
		String title=(String)request.getParameter("title");
		String content=(String)request.getParameter("content");
		System.out.println("title:"+title);
		System.out.println("content:"+content);
		System.out.println("--------------------");
		
//		board.setTitle(title);
//		board.setContent(content);
//		board.setUserId(uid);
//		
		//System.out.println("게시물 등록 완료");
		BoardDao dao=BoardDao.getInstance();
		
		int idx=Integer.parseInt(request.getParameter("idx"));
		
//		List<Board> listAll=new ArrayList<>();
		Board board=new Board();
		Connection conn;
		try {
			conn = ConnectionProvider.getConnection();
			//dao.insertBoard(conn, board);
			//listAll=dao.selectAllList(conn);
			board=dao.selectByIdx(conn, idx);
			int cntAll=dao.selectTotalCount(conn);
			request.setAttribute("cntAll",cntAll);
			request.setAttribute("board",board);
			
			System.out.println("선택된 board:"+board);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		request.setAttribute("board",board);
		System.out.println("board:"+board);
		
		// view 로 전달할 결과 데이터
//		MemberListView listView = null;
//		
//		Connection conn = null;
//		
//		try {
//			conn = ConnectionProvider.getConnection();
//			dao = MemberDao.getInstance();
//			
//			// 전체 게시물 개수 구하기
//			int totalCnt =  dao.selectTotalCount(conn);
//			
//			// 한 페이지 당 노출할 게시물의 개수
//			final int MEMBER_CNT_PER_PAGE = 2;
//			
//			// 현재 페이지 번호
//			int currentPageNumber = 1;
//			String page = request.getParameter("page");
//			if(page != null) {
//				try {
//					currentPageNumber = Integer.parseInt(page);
//				} catch (NumberFormatException e) {
//					System.out.println("숫자 타입의 문자열이 전달되지 않아 예외 발생");
//				}
//			}
//			
//			// 게시물의 첫번째 행의 index
//			int startRow = 0;
//			
//			// 한 페이지에 누출할 리스트
//			List<Member> memberList = null;
//			
//			if(totalCnt > 0) {
//				startRow = (currentPageNumber-1)*MEMBER_CNT_PER_PAGE;
//				
//				System.out.println(startRow);
//				
//				memberList = dao.selectList(conn, startRow, MEMBER_CNT_PER_PAGE);
//			} else {
//				currentPageNumber = 0;
//				memberList = Collections.emptyList();
//			}
//			
//			
//			listView = new MemberListView(
//					totalCnt, 
//					currentPageNumber, 
//					memberList, 
//					MEMBER_CNT_PER_PAGE, 
//					startRow);
//			
//			System.out.println(listView);
//			
//			
//			
//			
//		} catch (SQLException e) {
//			System.out.println("SQL 오류 발생");
//			e.printStackTrace();
//		}
//		
//		
//		request.setAttribute("listView", listView);
//		return "/buyContent.jsp";//@@@@@@@@@@@@@@@@@@@@@@@임시
		return "/deleteContent.jsp";//@@@@@@@@@@@@@@@@@@@@@@@임시
	}

}









