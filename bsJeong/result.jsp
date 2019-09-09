<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <form class="form-inline">
                            <p>날짜 <input type="text" id="datepicker"></p>&nbsp;
                            <p>업종<select name="type" id="datepicker">
                            		<option class="form-control mr-sm-2" value="cafe">cafe</option>
                            		<option class="form-control mr-sm-2" value="factory">factory</option>
                            		<option class="form-control mr-sm-2" value="design">design</option>
                            	</select></p>&nbsp;
                            <p>지역 <select name="type" id="datepicker">
                            		<option class="form-control mr-sm-2" value="cafe">cafe</option>
                            		<option class="form-control mr-sm-2" value="factory">factory</option>
                            		<option class="form-control mr-sm-2" value="design">design</option>
                            	</select></p>&nbsp;
                            <p><button class="btn btn-primary my-2 my-sm-0" type="submit">
							검색
						</button></p>
                        </form>
                    </div>
                </div>
                <br /><hr><br />
                <div class="row">
                    <div class="col-md-4">
                        <h2>
                            <div class="col-md-12">
                                <img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" class="rounded-circle">
                            </div>
                        </h2>
                        <p>
                            직원이름1
                        </p>
                        <p>
                            <a class="btn" href="#">예약하기 »</a>
                        </p>
                    </div>
                    <div class="col-md-4">
                        <h2>
                            <div class="col-md-12">
                                <img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" class="rounded-circle">
                            </div>
                        </h2>
                        <p>
                            직원이름2
                        </p>
                        <p>
                            <a class="btn" href="#">예약하기 »</a>
                        </p>
                    </div>
                    <div class="col-md-4">
                        <h2>
                            <div class="col-md-12">
                                <img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" class="rounded-circle">
                            </div>
                        </h2>
                        <p>
                            직원이름3
                        </p>
                        <p>
                            <a class="btn" href="#">예약하기 »</a>
                        </p>
                    </div>
                </div>
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

                    $("#datepicker").datepicker();

                });
            </script>
    </body>

    </html>