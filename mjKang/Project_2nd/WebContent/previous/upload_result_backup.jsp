<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>

    <%
  //<!-- jsp 파일저장 이후 파일 경로 db에 저장하기 -->
    //<!-- 세션아이디받기 -->
    	String id = "Yang";
    	//id별 이미지 저장 경로 생성
        String upload_path = request.getRealPath("/")+"img"; //사업자 이미지 경로, 폴더 새로 설정?
        //String upload_path = request.getRealPath("/")+"uploadtest\\"+id;
        int size = 2 * 1024 * 1024; //업로드 파일 용량 2메가바이트 제한
        String filename = "";
        int filesize = 0;
        
   		MultipartRequest multi =null;
        String newfilename = "";
        try {
            
            multi = new MultipartRequest(request, upload_path, size, "utf-8", new DefaultFileRenamePolicy());
                
            Enumeration files = multi.getFileNames();
            String file1 = (String) files.nextElement();  

            filename = multi.getFilesystemName(file1);  
            //이름변경 시작

			if (filename != null) {

				File upfile1 = new File(upload_path + "/" + filename); //--'/'를빼고 작업했다 .그래서 경로가 제대로 나오지 않음
				File upfile2 = new File(upload_path + "/" +id+ filename);

				if (upfile1.renameTo(upfile2)) {
					//out.print("1: "+upfile1+"<br>");
					//out.print("2: "+upfile2+"<br>");
					//out.print("이름변경성공"+"<br>");
				} else {
					//out.print("이름변경실패"+"<br>");
				} 
				%>
				
				<%=upload_path+"\\"+upfile2.getName()%>
				
				<% 
				newfilename = upfile2.getName();
            	filesize = (int) upfile2.length(); //파일 크기 확인
				//out.print("업로드 된 파일명=" + newfilename+"<br>");
				//out.print("업로드 된 파일사이즈=" + filesize+"<br>");
			}
				
            //이름변경 종료
            
            //File f1 = multi.getFile(file1); //업로드 시점?
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        //<!-- 경로저장 db처리필요 filename 및 경로  혹은 db처리는 별도로?-->
    %>
 <html>
 <body>
 파일 이름 :    <%=newfilename%>
  파일 크기 :    <%=filesize%>
 파일저장경로:  <%=upload_path %>  
</body> 
</html>
    