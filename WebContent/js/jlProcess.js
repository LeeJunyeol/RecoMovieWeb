var httpRequest = null;

function createXMLHttpRequest() {
   //브라우저 셋팅
   if (window.XMLHttpRequest) {
      httpRequest = new XMLHttpRequest();
   } else {
      return null;
   }
}

function resultProcess() {
   if (httpRequest.readyState == 4) { //전송완료
      if (httpRequest.status == 200) {
         document.getElementById("result").innerHTML = httpRequest.responseText;
      } else {
         alert("fail : " + httpRequest.statusText);
      }
   }
}

function startMethod(){
   createXMLHttpRequest();
   var id = document.getElementById("inputId").value;   //html
   var url="http://localhost:8787/mrp4/id.do?id="+id;   //servlet
   httpRequest.onreadystatechange = resultProcess;
   httpRequest.open("GET", url,true);
   httpRequest.send(null);
}


function checkJoinStat(){
   var id=document.getElementById("inputId").value;
   var idcheck = $("#result").text();
   var pw1=document.getElementById("inputPw").value;
   var pw2=document.getElementById("inputPwchk").value;
   var name=document.getElementById("inputName").value;
   var sex=$("input:radio[name=sex]:checked").val();
   var birth=document.getElementById("inputBirth").value;
   var addr=document.getElementById("roadAddress").value;
   var tel=document.getElementById("telname").value;
   var email=document.getElementById("emailname").value;
   // 필수 입력 요소 체크
   if(id==""){
      alert("아이디를 입력하여 주십시오.");
      event.preventDefault();//submit 취소 
   }else if(idcheck != "[사용 가능한 아이디 입니다.]"){
	   alert("사용중인 아이디 입니다.");
	   event.preventDefault();
   }else if(pw1==""){
      alert("비밀번호를 입력하여 주십시오.");
      event.preventDefault();
   } else if(pw1!=pw2){
      alert("비밀번호가 일치하지 않습니다.");
      event.preventDefault();
   }else if(!fnCheckPassword(id, pw1)){
	   event.preventDefault();
   }else if(name==""){
      alert("성명을 입력하여 주십시오.");
      event.preventDefault();
   }  else if(sex==null){
      alert("성별이 선택되지 않았습니다.");
      event.preventDefault();
   } else if(birth==""){
      alert("생년월일을 입력하지 않았습니다.");
      event.preventDefault();
   } else if(addr==""){
      alert("주소를 입력하여 주십시오.");
      event.preventDefault();
   } else if(tel==""){
      alert("전화번호를 입력하여 주십시오.");
      event.preventDefault();
   } else if(email==""){
      alert("이메일을 입력하여 주십시오.");
      event.preventDefault();
   } else {
	   var registForm = document.memberJoinForm; 
	   registForm.submit();
   }
   
}

function fnCheckPassword(uid, upw)
{
    if(!/^[a-zA-Z0-9]{8,20}$/.test(upw))
    { 
        alert('비밀번호는 숫자와 영문자 조합으로 8~12자리를 사용해야 합니다.'); 
        return false;
    }
  
    var chk_num = upw.search(/[0-9]/g); 
    var chk_eng = upw.search(/[a-z]/ig);
    if(chk_num < 0 || chk_eng < 0)
    { 
        alert('비밀번호는 숫자와 영문자를 혼용하여야 합니다.'); 
        return false;
    }
    
    if(/(\w)\1\1\1/.test(upw))
    {
        alert('비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다.'); 
        return false;
    }
    if(upw.search(uid)>-1)
    {
        alert('ID가 포함된 비밀번호는 사용하실 수 없습니다.'); 
        return false;
    }

    return true;
}

$(document).ready(function(){
   /* 회원 탈퇴 이벤트 */
   $("#memberdelete").click(function(){
      var memberno=$("#myNo").attr("value");
      var q1 = confirm("정말 탈퇴하시겠습니까?");
      if (q1==true){
         var q2 =   confirm("진짜죠?");
         if(q2==true){
            $.post("memberdelete.do",
                  {
                     no: memberno
                  },
                  function(data, status){
                     alert("탈퇴하셨습니다. 또 오세요.");
                     location.href=data;
            });
         }
      }
   });
})


