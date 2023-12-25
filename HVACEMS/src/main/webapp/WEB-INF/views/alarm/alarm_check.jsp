<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

    
<script>
	alert("알람을 삭제했습니다.");
	
	window.onload=function(){
		CloseWindow();
		window.opener.location.reload();
	}
</script>