<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>사업자 정보 입력</title>
        <link rel="stylesheet" href="css/basic.css">
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="js/postcode.js"></script>
        <script src="js/jquery-3.4.1.js"></script>
        <script src="js/jquery.form.js"></script>


        <script>
            var sessionid = "Kang";
            $(function() { //폼전송
            	$("#fileselect").focusout(function() {
					
				});
                $("#imgsubmit").submit(function() {
                	alert("k......");
                	var formdata = new FormData();
                	file = $("#fileselect")[0].files[0];
                	formdata.append("file1", file);
                    $.ajax({
                            url: "upload_result.jsp",
                            data: formdata,
                            processData: false,
                            contentType: false,
                            type: 'POST',
                            success: function(result) {
                            	result2 = result.trim();
                                alert("이미지 업로드 성공");
                                //파일전송완료 후 result 업로드 이미지 파일 경로
                                console.log("result: " + result2);
                            $("#imgpreview").empty();
                            $("#imgpreview").append("<img src=img/" + result2 + ">");
                            }
                        })
                        return false;
                }); //submit function
            }); //$(function(){});
        </script>
    </head>

    <body>
        <table border="1">
            <!-- <form id="joinmem" action="joinmem.jsp"> -->
            <tr class="header">
                <td colspan="3">제목</td>
            </tr>
            <tr class="input">
                <td>사업자번호:</td>
                <td><input type="text" name="regNum" id="regNum">
                    <!-- 사업자 번호 입력창 -->
                </td>
            </tr>
            <tr>
                <td colspan="3 ">중복확인 내용(사업자번호 입력창 넘어갈시 자동)</td>
            </tr>
            <tr>
                <td>사업장이름:</td>
                <td><input type="text" name="Storename" id="Storename">
                    <!-- 사업장 이름 입력창 -->
                </td>
            </tr>
            <tr>
                <td>주소</td>
                <td>
                    <button type="button" onclick="execDaumPostcode()" value="우편번호 찾기 ">우편번호 찾기</button>
                    <!-- 
                        주소 찾기
                        주소입력 api 실행 버튼
                     -->
                </td>
            </tr>
            <tr>
                <td>
                    <!--  <input type="text " name="Saddress1 " id="Saddress1 "> -->
                    <input type="text" id="postcode" placeholder="우편번호">
                    <!-- 우편번호 입력창(주소입력 api에서 가져오기) -->
                </td>
                <td>
                    <!--  <input type="text " name="Saddress2 " id="Saddress2 "> -->
                    <input type="text" id="roadAddress" placeholder="도로명주소">
                    <!-- 주소 입력창(주소입력 api에서 가져오기) -->
                </td>
                <td>
                    <!-- <input type="text " name="Saddress3 " id="Saddress3 "> -->
                    <span id="guide " style="color: #999; display: none"></span>
                    <input type="text" id="detailAddress" placeholder="상세주소">
                    <!-- 상세주소 사용자 입력 -->
                </td>
            </tr>
            <tr>
                <td>업종:</td>
                <!-- 업종 선택 창(단순 텍스트 or dropdown메뉴(업종 지정)) -->
                <td>
                    <select name="category">
 					 <option>카페</option>
 					 <option>음식</option>
 					 <option>기타</option>
				</select>
                </td>
            </tr>
            <tr>
                <td>기타 업종:</td>
                <!-- 업종 입력 창(dropdown메뉴 내 없을 시(?)) -->
                <td>
                    <input type="text">
                </td>
            </tr>
            <tr>
                <td>사업장 사진:</td>
                <td id="imgpreview">
					미리보기?? (ajax append -> upload버튼 disabled 사진 삭제하면 upload버튼 다시 살리기)
                    <!-- <img src="첨부한 파일의 주소 " alt="??? "> -->
                    <!-- 첨부 전 일시 출력되는 이미지 확인 필요 -->
                </td>
                <td>
                    <form id="imgsubmit" name="form1" enctype="multipart/form-data">
                        <input id="fileselect" type="file" name="file1"><br>
                        <input id="upload" type="submit" value="업로드">
                    </form>
                  	<!-- 사진 첨부하기? -->
                    <!-- 사진 첨부를 위한 창 띄우기, 첨부한 사진을 Spic에 입력하기-->
                </td>
                <!-- <td>
                    <button type="button">
						사진 삭제하기???
						첨부 사진을 삭제하기 위한 버튼, confirm 창 한번 띄울것
					</button>
                </td> -->

            </tr>
            <tr>
                <td>사업장규모:</td>
                <td>
                    <input type="text" name="Ssize" id="Ssize">상시 근로인원, 월매출등
                    <!-- 휴대폰번호 입력창 -->
                </td>
            </tr>
            <tr>
                <td>사업장 소개</td>
            </tr>
            <tr>
                <td colspan="3 "><input type="text" name="Sinfo" id="Sinfo">사업장 소개 및 영업시간 등 상세
                    <!-- 사업장 소개 자유형식 내용 늘어날 시 텍스트박스 자동 확장 or 스크롤바 생성 -->
                </td>
            </tr>
            <tr>
                <td>
                    <button type="submit">
						사업자 등록 완료
						<!-- 사업자등록 버튼, 입력 데이터 db전송 -->
						<!-- 등록이 되어있는 사업자가 해당 창을 방문할 경우 수정완료라고 변경 가능? -->
					</button>
                </td>
                <td>
                    <button type="button" onclick="close">
						등록 취소
						<!-- 등록 닫기 혹은 이전으로 돌아가기 -->
					</button>
                </td>
            </tr>


            <tr>
                <td>
                    빈 칸
                </td>
            </tr>
            <!-- </form> -->

        </table>

    </body>

    </html>