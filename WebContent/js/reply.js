var httpRequest = null;

function createXMLHttpRequest() {
	//브라우저 셋팅
	if (window.XMLHttpRequest) {
		httpRequest = new XMLHttpRequest();
	} else {
		return null;
	}
}
//---------------------------------------------------------------
function getParameterValues(){
	var userName = "userName=" + escape(encodeURIComponent(document.getElementById("userName").value));
	var content = "content=" + escape(encodeURIComponent(document.getElementById("content").value));
	//유효성 검사
	if(!userName || !content){
		alert("값을 입력하세요.");
		document.getElementById("userName").focus();
		return;
	}
	return userName+"&"+content;
}

function getReply() {
	createXMLHttpRequest();
	httpRequest.onreadystatechange = callback;//서버에서 응답시 응답결과 반환
	//POST방식
	var url = "replyProc.jsp?";
	httpRequest.open("POST",url,true);
	httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	httpRequest.send(getParameterValues()); 
}

function clearResult(){
	document.getElementById("result").innerHTML="";
	document.getElementById("userName").focus();
}

//---------------------------------------------------------------
function callback() {
	if (httpRequest.readyState == 4) { //전송완료
		if (httpRequest.status == 200) {
			var li=document.createElement("li");
			li.innerHTML = httpRequest.responseText;
			var div=document.getElementById("result");
			div.appendChild(li);
		} else {
			alert("실패 : " + httpRequest.statusText);
		}
	}
}
