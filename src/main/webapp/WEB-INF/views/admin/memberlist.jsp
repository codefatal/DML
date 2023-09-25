<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Daily Muscle Life | 회원 관리 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<!-- 템플릿의 기본 css -->
<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet" />

<!-- 템플릿의 상세내용의 css -->
<link href="${pageContext.request.contextPath}/css/scss.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/mypage.css" rel="stylesheet" />

<!-- JQuery 사용 -->
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
	
<!-- 템플릿 아이콘 사용 -->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
	
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- ck에디터적용코드  -->
<script language="javascript"
	src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
	crossorigin="anonymous"></script>
	<!-- 템플릿에서 메뉴 클릭 시 서브메뉴 출력 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	
	<!-- 차트 기능 사용 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
<style>
	a {
		text-decoration: none;
	}
	
	table {
		border-collapse: collapse;
		width: 1000px;
		margin-top: 20px;
		text-align: center;
	}
	
	td, th {
		border: 1px solid black;
		height: 50px;
	}
	
	th {
		font-size: 17px;
		background-color: #ccc;
	}
	
	thead {
		font-weight: 700;
	}
	
	.table_wrap {
		margin: 50px 0 0 50px;
	}
	
	.bno_width {
		width: 12%;
	}
	
	.writer_width {
		width: 20%;
	}
	
	.regdate_width {
		width: 15%;
	}
	
	.updatedate_width {
		width: 15%;
	}
	
	.top_btn {
		font-size: 20px;
		padding: 6px 12px;
		background-color: #fff;
		border: 1px solid #ddd;
		font-weight: 600;
	}
	
	.pageInfo {
		list-style: none;
		display: inline-block;
		margin: 50px 0 0 100px;
	}
	
	.pageInfo li {
		float: left;
		font-size: 20px;
		margin-left: 18px;
		padding: 7px;
		font-weight: 500;
	}
	
	a:link {
		color: black;
		text-decoration: none;
	}
	
	a:visited {
		color: black;
		text-decoration: none;
	}
	
	a:hover {
		color: black;
		text-decoration: underline;
	}
	
	.active {
		background-color: #cdd5ec;
	}
	
	.search_area {
		display: inline-block;
		margin-top: 30px;
		margin-left: 260px;
	}
	
	.search_area input {
		height: 30px;
		width: 250px;
	}
	
	.search_area button {
		width: 100px;
		height: 36px;
	}
	
	.search_area select {
		height: 35px;
	}
	
</style>

</head>
<body class="sb-nav-fixed">
	<jsp:include page="./frame/nav.jsp"></jsp:include>
	<div id="layoutSidenav">

		<jsp:include page="./frame/asidebar.jsp"></jsp:include>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<div class="Menu_container">
							<ul class="Menu_list">
								<li style="font-weight: bold;"><a>멤버 리스트</a></li>
							</ul>
						</div>
					<jsp:include page="./frame/adminmenu.jsp"></jsp:include>
					<table border=1>
						<tr>
							<th>리스트번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>생년월일</th>
							<th>성별</th>
							<th>키</th>
							<th>몸무게</th>
							<th>활성화유무</th>
							<th>권한</th>
							<th>정지</th>
						</tr>
						<c:forEach items="${memberlist }" var="member">
						<tr>
							<td><c:out value="${member.rownum}"/></td>
							<td><c:out value="${member.memberId}"/></td>
							<td><c:out value="${member.mname}"/></td>
							<td><c:out value="${member.mbirthday}"/></td>
							<td><c:out value="${member.gender}"/></td>
							<td><c:out value="${member.height}"/></td>
							<td><c:out value="${member.weight}"/></td>
							<td><c:out value="${member.userEnabled}"/></td>
							<td><c:out value="${member.authorities}"/></td>
							<td><button class="suspended_btn"
								onClick="location.href='${pageContext.request.contextPath}/admin/suspended/active'">
									정지</button></td>
						</tr>
						</c:forEach>
					</table>
					<div class="search_wrap">
						<div class="search_area">
							<select name="type">
								<option value="I"
									<c:out value="${pageMaker.cri.type eq 'I'?'selected':'' }"/>>아이디</option>
								<option value="N"
									<c:out value="${pageMaker.cri.type eq 'N'?'selected':'' }"/>>이름</option>
							</select> 
							<input type="text" name="keyword" class="searchInput" value="${pageMaker.cri.keyword }">
							<button>Search</button>
						</div>
					</div>
					<div class="pageInfo_wrap">
						<div class="pageInfo_area">
							<ul id="pageInfo" class="pageInfo">
								<!-- 이전페이지 버튼 -->
								<c:if test="${pageMaker.prev}">
									<li class="pageInfo_btn previous"><a
										href="${pageMaker.startPage-1}">Previous</a></li>
								</c:if>
								<!-- 각 번호 페이지 버튼 -->
								<c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a
										href="${num}">${num}</a></li>
								</c:forEach>
								<!-- 다음페이지 버튼 -->
								<c:if test="${pageMaker.next}">
									<li class="pageInfo_btn next"><a
										href="${pageMaker.endPage + 1 }">Next</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<form id="moveForm" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">	
						<input type="hidden" name="type" value="${pageMaker.cri.type }">	
				    </form>
				</div>
			</main>
			<jsp:include page="./frame/footer.jsp"></jsp:include>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script>
	
		let moveForm = $("#moveForm");

		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "${pageContext.request.contextPath}/admin/memberlist");
			moveForm.submit();
		});
		
		$(".search_area button").on("click", function(e) {
			e.preventDefault();
		    doSearch();
		});
		
		$(".searchInput").on("keypress", function(e) {
			if (e.which === 13) {
		        e.preventDefault();
		        doSearch();
		    }
		});
		
		function doSearch() {
			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();
			
			if(!keyword){
				alert("키워드를 입력하세요.");
				return false;
			}		
			
			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		}
	</script>
</body>
</html>