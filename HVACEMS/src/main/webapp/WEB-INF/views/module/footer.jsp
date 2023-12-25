<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


  <!-- Control Sidebar -->
    <!-- Control sidebar content goes here -->
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
    <!-- To the right -->
    <!-- Default to the left -->
</div>
<!-- ./wrapper -->



<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>
<!-- common.js  -->
<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>



<script>
function pageName(menuName){
	console.log(menuName);
	if(menuName === null || menuName === "") alert("aaaaaa"); //menuName = "HOME";
	$('.pageNames').text(menuName);
}
</script>
<script>
function goPage(url,menuCode){
	$('iframe[name="ifr"]').attr("src",url);
	
	//alert(mCode);
	 var renewURL = location.href;
    //현재 주소 중 .do 뒤 부분이 있다면 날려버린다.
    renewURL = renewURL.substring(0, renewURL.indexOf(".do")+3);
    
    if (menuCode != 'M000000') {
        renewURL += "?menuCode=" + menuCode;
    }
    //페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
    history.pushState(menuCode, null, renewURL);
}

goPage('<%=request.getContextPath()%>${menu.menuUrl}','${menu.menuCode}');
</script>
<script>
var pm = $('.pushmenuBtn').PushMenu(autoCollapseSize)
</script>

<!-- 알림 배너 템플릿 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.8/handlebars.min.js" ></script>
<script type="text/x-handlebars-template" id="alarm-banner-template">
<div id="alarm-banner-content" class="rollingbanner" style="background-color:rgba(170, 0, 0, 1)"><!-- "배너 전체 선언자" -->
   <div class="wrap"><!-- "배너 뷰포트" -->
      <div class="roller"><!-- 배너 내용 래퍼 -> clone으로 복제할 요소 -->
         <ul class="bannercontent"><!-- "배너 데이터 리스트" -->
			{{#each .}}
          
               <li class="kapi bannercontent">
                  <span>{{hvacNum }}구역 {{breakName }}&nbsp;{{prettifyDate alarmDate }}&nbsp;&nbsp;</span>
               </li>
           {{/each}}
         </ul>
      </div>
   </div>
</div>
</script>

<!-- 알림 종 템플릿 -->
<script type="text/x-handlebars-template" id="alarm-bell-template">
{{#each .}}
	<div class="dropdown-divider"></div>
	<button onclick="removeAlarm({{alarmNum }});" class="dropdown-item dropdown-footer" style="text-align: right; font-size: 0.5em;">알람삭제</button>
	<a href="javascript:readAlarm({{alarmNum }}); location.href='<%=request.getContextPath() %>/home.do?menuCode=M040100'" class="dropdown-item"> 
		<i class="fas fa-bullhorn mr-2"></i>
		<span style="{{styleGray alarmRead }}">
			{{hvacNum }}구역 {{breakName }}</span>
			<span class="float-right text-muted text-sm" style="{{styleGray alarmRead }}">
		{{prettifyDate alarmDate }}</span><br>
	</a>
{{/each}}
</script>

<!-- 날짜 포맷 -->
<script>
Handlebars.registerHelper({
	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth()+1;
		var date = dateObj.getDate();
		var hours = dateObj.getHours() < 10 ? '0' + dateObj.getHours() : dateObj.getHours();
		var minutes = dateObj.getMinutes() < 10 ? '0' + dateObj.getMinutes() : dateObj.getMinutes();
		var seconds = dateObj.getSeconds() < 10 ? '0' + dateObj.getSeconds() : dateObj.getSeconds();
		return year + "/" + month + "/" + date + " " + hours + ":" + minutes + ":" + seconds;
	},
	"styleGray":function(alarmRead){
		let style="";
		if(alarmRead == 0){
			style="color:gray;";
		}else{
			style="font-weight: bold;";
		}
		
		return style;
	}
});
</script>

<!-- 알림 배너 롤링 -->
<script>

function rolling(){
	  // Handlebars 템플릿이 렌더링되고 나서 roller 요소를 찾습니다.
    let roller = document.querySelector('.roller');
    roller.id = 'roller1';

    let clone = roller.cloneNode(true);
    clone.id = 'roller2';
    document.querySelector('.wrap').appendChild(clone);
    clone.style.position = 'absolute';
    clone.style.top = '0';

    //원본, 복제본 배너 위치 지정
    document.querySelector('#roller1').style.left = '0px';
    document.querySelector('#roller2').style.left = document.querySelector('.roller ul').offsetWidth+'px';

    //클래스 할당
    roller.classList.add('original');
    clone.classList.add('clone');

    //인터벌 메서드로 애니메이션 생성
    let rollerWidth = document.querySelector('.roller ul').offsetWidth;//회전 배너 너비값
    let betweenDistance = 1;//이동 크기 - 정수여야 함
    originalID = window.setInterval(betweenRollCallback, parseInt(1000/100), betweenDistance, document.querySelector('#roller1'));
    cloneID = window.setInterval(betweenRollCallback, parseInt(1000/100), betweenDistance, document.querySelector('#roller2'));

    //인터벌 애니메이션 함수(공용)
    function betweenRollCallback(d, roller){
        let left = parseInt(roller.style.left);
        roller.style.left = (left - d)+'px';//이동
        //조건부 위치 리셋
        if(rollerWidth + (left - d) < 0){
            roller.style.left = rollerWidth+'px';
        }
    }
}

<!-- 알림 배너 새로고침 -->
function alarm_banner(){
	
	var alarm_func = Handlebars.compile(document.querySelector("#alarm-banner-template").innerHTML);
			
	$.ajax({
		url:"<%=request.getContextPath()%>/api/alarm/banner",
		type:"get",
		success:function(alarms_json){
			let alarm_banner_html = alarm_func(alarms_json);
			
			if(alarms_json.length!=0) {
				document.querySelector("div#alarm-banner").innerHTML=alarm_banner_html;
				rolling();
			}else{
				document.querySelector("div#alarm-banner").innerHTML="";
			}
		}
	});

}

alarm_banner();
setInterval(alarm_banner,5000);
</script>

<!-- 알림 종 새로고침 -->
<script>
function alarm_bell(){
	var alarm_func = Handlebars.compile(document.querySelector("#alarm-bell-template").innerHTML);
			
	$.ajax({
		url:"<%=request.getContextPath()%>/api/alarm/bell",
		type:"get",
		success:function(alarms_json){
			let alarm_bell_html = alarm_func(alarms_json);
			
			if(alarms_json) {
				document.querySelector("div#alarm-bell").innerHTML=alarm_bell_html;
			}else{
				document.querySelector("div#alarm-bell").innerHTML="";
			}
		}
	});
}

alarm_bell();
setInterval(alarm_bell, 1000);
</script>

</script>

<!-- 알림 읽기 -->
<script>
function readAlarm(alarmNum) {
	var form = $('form[role="form"]');	
	$.ajax({
		url:"<%=request.getContextPath()%>/monitor/alarm/read.do?alarmNum="+alarmNum,
		type:"post",
		success:function(page){
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		},
		complete:function(){
			var input = document.createElement("input");
			input.type = "hidden";
			input.name = "alarmNum";
			input.value = alarmNum;
			form.append(input);
			form.submit();
		}
	});
}
</script>

<!-- 알림 삭제 -->
<script>
function removeAlarms() {
	const alarmCount = document.getElementById("alarmCount");
	if (alarmCount == 0) {
		alert("삭제할 알림이 없습니다.");
		return;
	}
	var form = $('form[role="form"]');	
	if (!confirm("정말로 삭제하시겠습니까?")) return;
	
	$.ajax({
		url:"<%=request.getContextPath()%>/monitor/alarm/checks.do?",
		type:"post",
		success:function(page){
			alert("삭제되었습니다.");
			// currentPage=page;
			location.reload();
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		},
		complete:function(){
			form.submit();
		}
	});
}

function removeAlarm(alarmNum) {
	var form = $('form[role="form"]');	
	if (!confirm("정말로 삭제하시겠습니까?")) return;
	
	$.ajax({
		url:"<%=request.getContextPath()%>/monitor/alarm/check.do?alarmNum="+alarmNum,
		type:"post",
		success:function(page){
			alert("삭제되었습니다.");
			// currentPage=page;
			location.reload();
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		},
		complete:function(){
			var input = document.createElement("input");
			input.type = "hidden";
			input.name = "alarmNum";
			input.value = alarmNum;
			form.append(input);
			form.submit();
		}
	});
	
}
</script>

</body>
</html>


