<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link href="css/result.bootstrap.min.css" rel="stylesheet">
        <link href="css/result.style.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link rel=StyleSheet href='css/calendar.css' type=text/css title=style>
        <!-- Datepicker -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <!-- Datepicker -->
        <link rel="stylesheet" href="/resources/demos/style.css">
        <style>
            select {
                width: auto;
                height: auto;
                text-indent: 0;
                white-space: normal;
                padding: .4em 1em;
            }
        </style>
    </head>

    <body>
        <%@include file = "menu.jsp" %>
            <br /><br />
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <form action="search.jsp" class="form-inline">
                             <p>시작날짜 : <input type="text" class="datepicker2" id = "startdate" name="start"></p>
                <p>  ~  </p>
                <p>종료날짜 : <input type="text" class="datepicker2" id = "enddate" name="end"></p>
                <p>업종 : <select name="type" id="datepicker">
               <option class="form-control mr-sm-2" value="">업종</option>
               <option class="form-control mr-sm-2" value="cafe">카페</option>
               <option class="form-control mr-sm-2" value="factory">피시방</option>
               <option class="form-control mr-sm-2" value="design">서점</option>
               	</select></p>&nbsp;
                <p>지역 : <input type="text" id = "location" name="location"> <input type="text" id = "location2" name="location2">
                <p><input class="btn btn-primary my-2 my-sm-0" type="submit" id="search" value="검색">
                </p>
                        </form>
                    </div>
                </div>
                <br /><hr><br />
                
                <c:forEach items="${list}" var="dto">
                <div class="row">
                    <div class="col-md-4">
                        <h2>
                            <div class="col-md-12">
                                <img alt="Bootstrap Image Preview" src="${dto.img}" class="rounded-circle">${dto.img}
                            </div>
                        </h2>
                        <p>
                            ${dto.mid}
                        </p>
                        <p>
                           <form action="reservation/reservation.jsp" method="post">
                           <input type="hidden" name="wnum" value="${dto.wnum}">
                           <input class="btn" type="submit" value="예약하기 »">
                           </form>
                        </p>
                    </div>
                </div>
                </c:forEach>
            </div>
            <script src="js/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/scripts.js"></script>
            <script src="js/result.jquery.min.js"></script>
            <script src="js/result.bootstrap.min.js"></script>
            <script src="js/result.scripts.js"></script>
            <script language="JavaScript1.2" src="js/calendar.js"></script>
            <script language="JavaScript1.2" src="js/data.js"></script>
            <!-- Datepicker -->
            <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
            <!-- Datepicker -->
            <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
            <!-- Datepicker -->
            <script>
                $(function() {
                    $(".datepicker2").datepicker({dateFormat: 'yy-mm-dd'});
                });
            </script>
    </body>

    </html>