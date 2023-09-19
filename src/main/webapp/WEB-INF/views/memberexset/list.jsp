<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Calendar"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Daily Muscle Life</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/scss.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ck에디터적용코드  -->
<script language="javascript"
	src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
<!-- 부투스트랩 js코드 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<style>
#datepicker {
	padding: 5px;
}

.exSetForDay_one {
	float: left;
	padding: 30px;
}

.floatLeft {
	float: left;
}
.floatRight{
	float: right;
}
</style>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/frame/nav.jsp"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="/WEB-INF/views/frame/asidebar.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Daily Muscle Life</h1>
					<!--   <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol> -->
					<jsp:include page="/WEB-INF/views/frame/menu9.jsp"></jsp:include>
					<div class="row">
						<div class="col-xl-10 BigDateHead">
							<div class="DateHead floatLeft h2">
								
									<%String Date = new java.text.SimpleDateFormat("yyyy.MM.dd").format(new java.util.Date());%>
									<%=Date%>
							</div>
							<div class="floatLeft h2">
								<h2>&nbsp${member.mname}님의 운동 리스트</h2>
							</div>
							<div class="forChangeDate floatRight col-xl-2">
							<img
								src="https://w7.pngwing.com/pngs/294/951/png-transparent-computer-icons-calendar-others-miscellaneous-text-calendar.png"
								width="30px" height="30px" id="changeDate">
							<button class="saveChangDate">저장</button>
						</div>
						</div>
						
					</div>

					<div class="test11"></div>
					<!-- 여기부터 모달창임 -->
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#exampleModal">
						Launch demo modal</button>
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form>
										<span>무게 : </span><input type="number" class="addExerciseWeight">								
										<span>횟수 : </span><input type="number" class="addExerciseNumber">									
										<span>세트 : </span><input type="number" class="addExerciseSet">							
									</form>
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
					</div>
					<div class="col-xl-12">
						<div>
							<ul class="nav nav-tabs col-xl-12" id="myTab" role="tablist">
								<li class="nav-item col-xl-2" role="presentation">
									<button class="nav-link active col-xl-12" id="home-tab"
										data-bs-toggle="tab" data-bs-target="#home" type="button"
										role="tab" aria-controls="home" aria-selected="true">전체
										운동</button>
								</li>
								<li class="nav-item col-xl-2" role="presentation">
									<button class="nav-link col-xl-12" id="profile-tab"
										data-bs-toggle="tab" data-bs-target="#profile1" type="button"
										role="tab" aria-controls="profile" aria-selected="false">등</button>
								</li>
								<li class="nav-item col-xl-2" role="presentation">
									<button class="nav-link col-xl-12" id="profile-tab"
										data-bs-toggle="tab" data-bs-target="#profile2" type="button"
										role="tab" aria-controls="profile" aria-selected="false">가슴</button>
								</li>
								<li class="nav-item col-xl-2" role="presentation">
									<button class="nav-link col-xl-12" id="profile-tab"
										data-bs-toggle="tab" data-bs-target="#profile3" type="button"
										role="tab" aria-controls="profile" aria-selected="false">어깨</button>
								</li>
								<li class="nav-item col-xl-2" role="presentation">
									<button class="nav-link col-xl-12" id="profile-tab"
										data-bs-toggle="tab" data-bs-target="#profile4" type="button"
										role="tab" aria-controls="profile" aria-selected="false">팔</button>
								</li>
								<li class="nav-item col-xl-2" role="presentation">
									<button class="nav-link col-xl-12" id="profile-tab"
										data-bs-toggle="tab" data-bs-target="#profile5" type="button"
										role="tab" aria-controls="profile" aria-selected="false">하체</button>
								</li>
							</ul>
						</div>
						<!-- Tab panes -->
						<div class="tab-content">
							<div class="tab-pane active" id="home" role="tabpanel"
								aria-labelledby="home-tab"></div>

							<div class="tab-pane" id="profile1" role="tabpanel"
								aria-labelledby="profile-tab">등 운동 하나씩</div>
							<div class="tab-pane" id="profile2" role="tabpanel"
								aria-labelledby="profile-tab">가슴 운동 하나씩</div>
							<div class="tab-pane" id="profile3" role="tabpanel"
								aria-labelledby="profile-tab">어깨 운동 하나씩</div>
							<div class="tab-pane" id="profile4" role="tabpanel"
								aria-labelledby="profile-tab">팔 운동 하나씩</div>
							<div class="tab-pane" id="profile5" role="tabpanel"
								aria-labelledby="profile-tab">하체 운동 하나씩</div>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>
	<script>
	window.onload = function() {
		const now = new Date();
		var onloadToday = new Date().toISOString().substring(0, 10).replace(/-/g,'');
		getMemberexset(onloadToday);
	}
	function addEventAfterDisplay(selectorStr, cbHandler){
		$(selectorStr).click(cbHandler);	
	}
	function displayHome(result){
		$(".exSetForDay").remove();
		htmlVal = '	<div class="exSetForDay">';
		for (var i = 0; i < result.length; i++) {
			htmlVal += '<div class="exSetForDay_one card col-xl-3 text-center" data-dayexset="'+result[i].dayExSet+'" data-ecode="'+result[i].ecode+'"><div>'+result[i].exName+'</div><div>'+result[i].exerciseWeight+'kg</div><div>'+result[i].exerciseNumber+
			'회</div><div>'+result[i].exerciseSet+
			'세트</div><div ><button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">수정</button><button type="button" class="deleteDayExSet">삭제</button></div></div>'
				/* 	+ result[i].exerciseSet+'</div><div>
					+ result[i].exerciseNumber+'</div><div>
					+ result[i].exerciseNumber+'</div> */
		}
		htmlVal += '</div>'
		console.log(result);
		//addEventAfterDisplay(".deleteDayExSet", deleteDayExSetHandler);
		$("#home").append(htmlVal);
		$(".deleteDayExSet").click(deleteDayExSetHandler);
	}
	/* 범준님 코드 가져옴 */
	function datepickerHandler(){
	 	$("#datepicker").datepicker({
	    	dateFormat: 'yy-mm-dd',
        	showOtherMonths: true,
        	showMonthAfterYear: true,
        	changeYear: true,
        	changeMonth: true,
        	showOn: "both",
        	buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 버튼 이미지 경로
        	buttonImageOnly: true,
        	buttonText: "선택",
        	yearSuffix: "년",
        	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 달력의 월 부분 Tooltip
        	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // 달력의 요일 텍스트
        	dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'], // 달력의 요일 Tooltip
       		onSelect: function(dateText, inst) {
           		/* var date=new Date($("#datepicker").datepicker({dateFormat:"yy-mm-dd"}).val());
           		var date1= new Intl.DateTimeFormat('kr').format(date);
           		date= date.getFullYear();
           		date1= date1.replaceAll(".", "");
           		console.log(date1); */
       			var selectDate = $.datepicker.formatDate("yymmdd",$("#datepicker").datepicker("getDate")); 
         		selectDate = $("#datepicker").val();
         		
         		selectDate1= selectDate.replaceAll("-", "");
         		console.log("selectDate1 : "+selectDate1);
         		console.log("selectDate : "+selectDate);
         		getMemberexset(selectDate1);
           		$(".DateHead").html(selectDate);
	   			},
   			onChangeMonthYear:function(year, month, inst){
    			setTimeout(function(){
        		var selectDate = $.datepicker.formatDate("yymmdd",$("#datepicker").datepicker("getDate")); 
         		selectDate = $("#datepicker").val();
         		selectDate= selectDate.replaceAll("-", "");
         		console.log("onChangeMonthYear : "+selectDate)
     			}, 0);
   			}
 	});
	$('#datepicker').datepicker('setDate', new Date());
}

	function getMemberexset(dateStr){
		console.log("dateStr "+dateStr);
			$.ajax({
				url : "${pageContext.request.contextPath}/memberexset/list.ajax",
				type : "get",
				data : {dayExSet : dateStr + "${member.memberId}"},
				success : function(result) {
					console.log("getMemberexset"+result);
					displayHome(result);
				//	addEventAfterDisplay(".dayExSetPart", displayDayExSetPartHandler);
						},
						dataType : "json"
					})
		}
	
		$("#changeDate").click(changeDateHandler);
		function changeDateHandler(){
			$("#datepicker").remove();
			htmlVal=`
				<input type="text" id="datepicker" 
				<%String datepickerToday = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());%>
				placeholder="<%=datepickerToday%>">
				`
				$(".forChangeDate").append(htmlVal);
				$("#datepicker").click(datepickerHandler);
			}
		
		function deleteDayExSetHandler(result){
			   console.log("deleteDayExSetHandler 돌아감?")
			   var test123 = $(this).parents(".exSetForDay_one").data("dayexset");
			   console.log(test123);
				$.ajax({
					url : "${pageContext.request.contextPath}/memberexset/delete",
					type : "post",
					data : {dayExSet : test123},
					success :  function(){
						console.log("success");
						location.reload(true);},
					error :  function(){
						console.log("error");},
					dataType : "json"
				})
		}
	</script>
</body>
</html>
