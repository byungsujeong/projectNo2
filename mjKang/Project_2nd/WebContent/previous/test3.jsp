<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='UTF-8'>

<head>
<meta charset='UTF-8' />

<link rel="stylesheet" href="css/basic.css">
<link href='fullcalendar/core/main.css' rel='stylesheet' />
<link href='fullcalendar/daygrid/main.css' rel='stylesheet' />

<script src='fullcalendar/core/main.js'></script>
<script src='fullcalendar/interaction/main.js'></script>
<script src='fullcalendar/daygrid/main.js'></script>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>

<script>
    		var sessionid = "aang";
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
            	
                plugins: ['interaction', 'dayGrid', 'timeGrid'],
                selectable: true,
                header: {
                    left: 'prev,next today',
                    center: 'title', //연월
                    right: 'addEventButton'//일정 입력 버튼?
                },
                customButtons: {
                    addEventButton: {
                      text: '휴무입력',
                      click: function() {
                        var dateStr = document.getElementById("start-date").value; //드래그 후 시작값 가져오기
                        //console.log(dateStr);
                        //var dateStr = prompt('형식에 맞게 날짜를 입력하세요.(YYYY-MM-DD)');
                        var date = new Date(dateStr + 'T00:00:00'); // will be in local time
                        //console.log(date);
                        var content = "휴무";
                        if (!isNaN(date.valueOf())) { // valid?
                          calendar.addEvent({
                            title: content,
                            start: date, //선택한 날짜 가져와서 해당날짜에 추가됨
                            allDay: true //false시 반나절기입됨.
                          });
                        //var onstate = 1; //휴무상태 data 생성? 여기서? RestInsert.jsp에서? 뭐가 더 효율적?
                          alert('Great. Now, update your database...');
                          //ajax db입력 라인
                           $.ajax({
                        	  url: "RestInsert.jsp",
                        	  data:{
                        		  id : sessionid, //세션 아이디 가져오기
                        		  checkdate : dateStr, //선택한 날짜
                        	//	  state : onstate, //휴무 on -> 필요한가? 날짜가 있으면 일정이 있다는 이야기인데
                        		  content : content //
                        	  },
                        	  success: function(result) {
								alert("db저장 완료");
								console.log(result);
							}
                        	  }); 
                          document.getElementById("start-date").value = null;
                          //db에 반영 어찌할까,
                        }else {
                          alert('휴무일을 선택해주세요.');
                        }
                        
                      }
                    }
                  },
                
                dateClick: function(info) { //날짜 클릭시 선택날짜 확인
                    alert('clicked ' + info.dateStr);
                    document.getElementById("start-date").value = info.dateStr;
                	//document.getElementById("calendar-date").innerHTML = info.dateStr; //해당 날짜 가져오기
                	//해당 날짜 선택시 on/off 선택 -> off시 db에 1로 표기
                },
            /*    , select: function(info) { //날짜 드래그시 선택 날짜 구간 확인
                    alert('selected ' + info.startStr + ' to ' + info.endStr);
                	document.getElementById("start-date").value = info.startStr; //해당 날짜 가져오기
                	document.getElementById("end-date").value = info.endStr; //해당 날짜 가져오기
                }
                 */ /* 미사용 코드 */
            	   
                 //캘린더 db입력 코드 시작
                $.ajax({
            	url: "http://localhost:8888/Project_2nd/data/test.xml",
            	dataType: "xml",
            	success: function(result) {
					if($(result).find("record").length>0){
						$(result).find("record").each(function() {
							var id = $(this).find("id").text();
							var checkdate = $(this).find("checkdate").text();
							var content = $(this).find("content").text();
				             var date = new Date(checkdate + 'T00:00:00'); // will be in local time 변환
				             
				        	 if (!isNaN(date.valueOf())) { // valid?
				                 calendar.addEvent({
				                   title: content,
				                   start: date, //선택한 날짜 가져와서 해당날짜에 추가됨
				                   allDay: true //false시 반나절기입됨.
				                	})
								}
				             })
							}
            			}
                 	}); //캘린더 db ajax
              //캘린더 db입력 코드 끝
              
               
                 
              
            });
            
            };
            /* 
        	//캘린더 불러올때, 이미 일정이 추가되어있으면 휴무라고 기입된 이벤트 추가되어있어야함. 
        	ajax로 id보내고, result를 가지고, 아래 for문 시행?
        	for문 안에(?)
        	세션id 해당 스케쥴 db 출력, 휴무 컬럼 1일경우(예약된 경우도 기입됨, 색변경?) if문 시행
        	data = db에 있는 날짜, title = db에 있는 내용
        	 var content = db content가져오기
             var dateStr = db날짜 가져오기
             var date = new Date(dateStr + 'T00:00:00'); // will be in local time 변환
        	 if (!isNaN(date.valueOf())) { // valid?
                 calendar.addEvent({
                   title: content,
                   start: date, //선택한 날짜 가져와서 해당날짜에 추가됨
                   allDay: true //false시 반나절기입됨.
                 });
        	 넣어서 생성시 db데이터와 크로스체크하여 데이터 생성
        	*/
        	//세션id해당 json 생성하기
        	
        	/* $.ajax({ //여기는 json data가져오기, big30 data4.jsp 참조
           	  url: "CalendarList.jsp",
           	  data:{
           		  id : sessionid //세션 아이디 가져오기
           	  },
           	  success: function(result) {
					//result = 일정배열
           		  alert("db저장 완료");
					console.log(result);
				}
           	  }); */
        	
            calendar.render();
        });
    </script>
</head>

<body>
	<!-- 드래그 선택기능 kill and 휴무일 day by day 입력 -->

	<div id="calendar" style="width: 50%; height: 50%; float: left"></div>
	<div style="font-size: 50px; float: left">
		<div style="float: left">휴무 시작일:</div>
		<div style="float: left">
			<input type="text" id="start-date">
		</div>
		<!-- 여기에 데이트픽커 넣기? -->
		<br>
		<div style="float: left">휴무 종료일:</div>
		<div style="float: left">
			<input type="text" id="end-date">
		</div>
	</div>

	<!-- ajax 사용 휴무여부 나타내기? -->
	<!-- ajax로 변경 확인 및 캘린더 반영 즉시 확인 -->
</body>

</html>