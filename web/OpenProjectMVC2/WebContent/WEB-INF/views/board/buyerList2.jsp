<%@page import="board.model.BoardListView"%>
<%@page import="board.model.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<Board> listAll = (List) request.getAttribute("listAll");
request.setAttribute("listAll", listAll);

%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>BBS List</title>
  <!-- Bootstrap -->
  <link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <style>
    #container {
      width: 80%;
      margin: 0 auto;     /* 가로로 중앙에 배치 */
      padding-top: 5%;   /* 테두리와 내용 사이의 패딩 여백 */
    }
     
    #list {
      text-align: center;
    }
   
    #write {
      text-align: right;
    }
     
    /* Bootstrap 수정 */
    .table > thead {
      background-color: #b3c6ff;
    }
    .table > thead > tr > th {
      text-align: center;
    }
    .table-hover > tbody > tr:hover {
      background-color: #e6ecff;
    }
    .table > tbody > tr > td {
      text-align: center;
    }
    .table > tbody > tr > #title {
      text-align: left;
    }
     
    div > #paging {
      text-align: center;
    }
     
    .hit {
      animation-name: blink;
      animation-duration: 1.5s;
      animation-timing-function: ease;
      animation-iteration-count: infinite;
      /* 위 속성들을 한 줄로 표기하기 */
      /* -webkit-animation: blink 1.5s ease infinite; */
    }
     
    /* 애니메이션 지점 설정하기 */
    /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
    @keyframes blink {
      from {color: white;}
      30% {color: yellow;}
      to {color: red; font-weight: bold;}
      /* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
    }
  </style>
</head>
<body>
<c:if test="${empty info}">
<script>
alert('로그인 하세요');
location.href='<%=request.getContextPath()%>/member/memberLogin.do';

</script>
</c:if>
  <div id="container">
    <div align="right">
      <!-- Login 검증 -->
      <!-- jstl의 if문은 else가 없어서 따로 검증해야함. -->
      <c:if test="${info != null}">
        <%-- <%@include file="loginOk.jsp" %> --%>
      </c:if>
      <c:if test="${info == null}">
        <%-- <%@include file="login.jsp" %> --%>
      </c:if>
    </div>
   
    <div id="list">
      <b>게시판 (전체 글: ${cntAll})</b>
    </div>
     
   <%--  <div id="write">
      <a href="/bbs/writeForm.bbs?pageNum=${pageNum}">글쓰기</a>
    </div> --%>
     
    <div>
      
      <!-- public BoardListView(
			int BoardTotalCount, 
			int currentPageNumber, 
			List<Board> BoardList,
			int BoardCountPerpage, 
			int startRow, 
			int endRow) { -->
     <!-- -----------------------------------------------------------------------------------------------07/24 추가 -->
  <%--    <hr> <div class="paging">
					<c:forEach begin="1" end="${listView.totalCnt}" var="i">

						<a
							class="paging_num ${i == listView.startPage ? 'now_page' : ''}"
							href="buyerBoard.do?page=${i}">${i}</a>
							href="memberList.do?page=${i}">${i}</a>

					</c:forEach>
				</div> --%>
     <!-- -----------------------------------------------------------------------------------------------07/24 추가 -->
     
      
      
        
     <div>
     <table>
     <!-- <h1>확인</h1> -->
     <%
     BoardListView listView=(BoardListView)request.getAttribute("listView");
     %>
     <%-- ${listView}<hr> --%>
     <c:if test="${not empty listView}">
      <table class="table table-striped table-bordered table-hover">
              <thead>
      
     	 <tr>
            <th width="10%">글번호</th>
            <th width="10%">아이디</th>
            <th width="50%">제목</th>
            <th width="15%">작성일자</th>
            <th width="10%">조회수</th>
            <th width="10%">기타</th>
          </tr>
          </thead>
         <tbody>
 
     	<c:forEach var="board" items="${listView.boardList}" varStatus="status">
      	 <tr>
              <td>${board.idx}</td>
              <td>${board.userId}</td>
              <td><a href="boardContentDetails.do?idx=${board.idx}">${board.title}</a></td>
              <td>${board.regDate}</td>
              <td>${board.viewCount}</td>
              <td><a href="editBoardContent.do?idx=${board.idx}">수정</a> <a href="javascript:memberDel(${board.idx})">삭제</a></td>
            <tr>
     	</c:forEach>
     	</tbody>
     	</table>
     </c:if>
     <div>
       <span><button class="btn btn-outline-primary" style="float:right" onclick="moveToBoard()">글쓰기</button></span>
          <div><button class="btn btn-outline-primary" style="float:left">검색</button><input type="text"></div>
          
          
          <span>
          <ul style="text-align:center;margin:2% 30%;" class="pagination">
          <c:forEach begin="1" end="${listAll.size()/5+1}" var="i">
          <li><a href="buyerBoard.do?page=${i}">${i} </a></li>
          </c:forEach>
          </ul>
          </span>
          </div>
          
     <%-- <tr>
     <c:forEach begin="1" end="${listAll.size}" var="i">
     <td><a href="buyerBoard.do?page=${i}">${i}</a></td>
      </c:forEach>
     </tr>
     </table>
      </div>
     <hr> --%>
       	<script>
       	function moveToBoard(){
       		location.href='temp.do';
       	}
		function memberDel(idx) {
			if (confirm('선택한 게시글을 삭제하시겠습니까?')) {
				location.href = 'deletBoardContent.do?idx=' + idx;
			}

		}
	</script>
       
      <!-- Paging 처리 -->
    </div>
  </div>
</body>
</html>


