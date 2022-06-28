<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, board.model.vo.*"%>
<%
	ChallengeBoard cb = (ChallengeBoard)request.getAttribute("cb");
	Image tImg = (Image)request.getAttribute("tImg");
	System.out.println("tFileNo = " + request.getAttribute("tFileNo"));
	Image cImg = (Image)request.getAttribute("cImg");
	System.out.println("cFileNo = " + request.getAttribute("cFileNo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#contentImgArea1:hover, #contentImgArea2:hover, #contentImgArea3:hover {cursor:pointer;}
</style>
</head>
<body>

<%@ include file = "../common/Navbar.jsp" %>

<div class="container">
  <div class="row">
    <div class="col-3">
		<section id="forms">
		<br>
		  <h3 class="fw-bold pt-3 pt-xl-5 pb-2 pb-xl-3">이 달의 챌린지</h3>
		
		    <article class="my-3" id="overview">
		      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
		         <div class="card mb-4 rounded-3 shadow-sm col-sm-10">
				 	<div class="card-header py-2">
				      <h6 class="my-0 fw-normal">용기내 챌린지</h6>
				    </div>
				    <div class="card-body" style="font-size: 14px;">
				    	음식 포장에 무분별하게 사용되는 일회용품을 줄이기 위해 다회용 용기에 음식을 포장해오는 챌린지
				    </div>
				</div>
		         <div class="card mb-4 rounded-3 shadow-sm col-sm-10">
				 	<div class="card-header py-2">
				      <h6 class="my-0 fw-normal">플로깅 챌린지</h6>
				    </div>
				    <div class="card-body" style="font-size: 14px;">
				    	스웨덴어 ‘Plocka upp(줍다)’과 영어 ‘Jogging(달리기)’의 합성어로 조깅을 하면서 쓰레기를 줍는 챌린지
				    </div>
				</div>
		         <div class="card mb-4 rounded-3 shadow-sm col-sm-10">
				 	<div class="card-header py-2">
				      <h6 class="my-0 fw-normal">제로웨이스트 챌린지</h6>
				    </div>
				    <div class="card-body" style="font-size: 14px;">
						일상 속 일회용 쓰레기를 제로에 가깝게 최소화하는 챌린지
				    </div>
				</div>
		         <div class="card mb-4 rounded-3 shadow-sm col-sm-10">
				 	<div class="card-header py-2">
				      <h6 class="my-0 fw-normal">캔크러시 챌린지</h6>
				    </div>
				    <div class="card-body" style="font-size: 14px;">
				    	알루미늄 캔의 재활용률을 높이기 위해 이물질이 들어가지 않도록 알루미늄 캔을 발로 밟아 찌그러뜨려서 분리 배출하는 챌린지
				    </div>
				</div>
		      </div>
			</article>
		</section>
    </div>
    <div class="col-8">
          <div class="mb-2">
          <br>
    		<form action="<%= request.getContextPath() %>/chalUpdate.bo" method="post" encType="multipart/form-data">
           <h3 class="fw-bold pt-3 pt-xl-5 pb-2 pb-xl-3"><img src="icon/pencil-square.svg" width="30px" height="30px"> 글쓰기 </h3>
           <input type="hidden" name="bNo" value="<%= cb.getBoardNo()%>">
           <!--           <div class="mb-3 bg-light pt-md-5 px-md-5"> -->
			<h6 class="text-end" style="font-size: 14px;">*  필수 입력</h6>
<!-- 			* 챌린지  -->
			<div class="input-group mb-2" style="width: 50%;">
			  <label class="input-group-text" for="inputGroupSelect01">챌린지 선택</label>
			  <select class="form-select" id="inputGroupSelect01" name="challenge">
			    <option selected>* 참여한 챌린지를 선택해 주세요</option>
			    <option value="1" <%= cb.getChalName().equals("용기내 챌린지")? "selected":"" %>>용기내 챌린지</option>
			    <option value="2" <%= cb.getChalName().equals("플로깅 챌린지")? "selected":"" %>>플로깅 챌린지</option>
			    <option value="3" <%= cb.getChalName().equals("제로웨이스트 챌린지")? "selected":"" %>>제로웨이스트 챌린지</option>
			    <option value="4" <%= cb.getChalName().equals("캔크러시 챌린지")? "selected":"" %>>캔크러시 챌린지</option>
			  </select>
			</div>
	        <div class="mb-1">
	            <input class="form-control form-control" name="title" maxlength='20' type="text" value="<%= cb.getBoardTitle() %>" required style="width: 70%;">
	        </div>          	
	        <div class="mb-1">
	            <input class="form-control form-control-md" name="place" type="text" value="<%= cb.getChalPlace() %>" style="width: 70%;">
	        </div>          	
			<div class="mb-4">
				<table style="border-spacing: 15px; border-collapse: separate;">
					<tr>
						<th>사진 미수정 시 원본은 유지됩니다. </th>
					</tr>
					<tr>
						<td>
							<input type="hidden" name="tFileNo" value="<%= request.getAttribute("tFileNo") %>">
							<div class="img-thumbnail" id="contentImgArea1">썸네일 및 첫 번째 사진
						      <img id="titleImg" width="250" height="250">
							</div>
						</td>
						<td>
						<input type="hidden" name="cFileNo" value="<%= request.getAttribute("cFileNo") %>">
							<div class="img-thumbnail" id="contentImgArea2">두 번째 사진
								<img id="contentImg1" width="250" height="250"> 
							</div>
						</td>
						<td>
							<div class="img-thumbnail" id="contentImgArea3">세 번째 사진
								<img id="contentImg2" width="250" height="250"> 
							</div>
						</td>
					</tr>
				</table>
				
				<div id="fileArea">
					<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="LoadImg(this,1)">
					<input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="LoadImg(this,2)">
					<input type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="LoadImg(this,3)">
				</div>

			</div>
	        <div class="mb-4">
		       	<label class="form-label">* 내용 </label>
			    <textarea class="form-control" name="content" style="height: 700px; resize: none;" required><%= cb.getBoardContent() %></textarea>
	        </div>
	        <div class="mb-4 text-end"> 
	        	<input type="button" class="btn btn-outline-secondary" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/chalList.bo'" value="취소">
	        	<input type="submit" class="btn btn-outline-danger" id="submit" value="완료">          	
          	</div>
     		</form>
          </div>
     </div>
    </div>
  </div>
  
<%@ include file = "../common/FooterTopBtn.jsp" %>

<script>
	$(function(){
		$("#fileArea").hide();
		
		$("#contentImgArea1").click(function(){
			$("#thumbnailImg1").click();
		});
		$("#contentImgArea2").click(function(){
			$("#thumbnailImg2").click();
		});
		$("#contentImgArea3").click(function(){
			$("#thumbnailImg3").click();
		});
	});

	// 미리보기
	function LoadImg(value, num){
		if(value.files && value.files[0]){
			var reader = new FileReader();
			
			reader.onload = function(e){
				switch(num){
				case 1: $('#titleImg').attr("src", e.target.result); break;
				case 2: $('#contentImg1').attr("src", e.target.result); break;
				case 3: $('#contentImg2').attr("src", e.target.result); break;
				}
			}
				
			reader.readAsDataURL(value.files[0]);
		}
	}
	
	
 	// 사진을 클릭하면 미리보기 삭제 
// 	function deleteFile(num){
// 		switch(num){
// 		case 1: $('#contentImg1').attr('src',""); break;
// 		case 2: $('#contentImg2').attr('src',""); break;
// 		case 3: $('#contentImg3').attr('src',""); break;
// 		}
// 	}
	
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>