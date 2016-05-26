var httpRequest = null;

function createXMLHttpRequest() {
   //������ ����
   if (window.XMLHttpRequest) {
      httpRequest = new XMLHttpRequest();
   } else {
      return null;
   }
}

function resultProcess() {
   if (httpRequest.readyState == 4) { //���ۿϷ�
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
   // �ʼ� �Է� ��� üũ
   if(id==""){
      alert("���̵� �Է��Ͽ� �ֽʽÿ�.");
      event.preventDefault();//submit ��� 
   }else if(idcheck != "[��� ������ ���̵� �Դϴ�.]"){
	   alert("������� ���̵� �Դϴ�.");
	   event.preventDefault();
   }else if(pw1==""){
      alert("��й�ȣ�� �Է��Ͽ� �ֽʽÿ�.");
      event.preventDefault();
   } else if(pw1!=pw2){
      alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
      event.preventDefault();
   }else if(!fnCheckPassword(id, pw1)){
	   event.preventDefault();
   }else if(name==""){
      alert("������ �Է��Ͽ� �ֽʽÿ�.");
      event.preventDefault();
   }  else if(sex==null){
      alert("������ ���õ��� �ʾҽ��ϴ�.");
      event.preventDefault();
   } else if(birth==""){
      alert("��������� �Է����� �ʾҽ��ϴ�.");
      event.preventDefault();
   } else if(addr==""){
      alert("�ּҸ� �Է��Ͽ� �ֽʽÿ�.");
      event.preventDefault();
   } else if(tel==""){
      alert("��ȭ��ȣ�� �Է��Ͽ� �ֽʽÿ�.");
      event.preventDefault();
   } else if(email==""){
      alert("�̸����� �Է��Ͽ� �ֽʽÿ�.");
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
        alert('��й�ȣ�� ���ڿ� ������ �������� 8~12�ڸ��� ����ؾ� �մϴ�.'); 
        return false;
    }
  
    var chk_num = upw.search(/[0-9]/g); 
    var chk_eng = upw.search(/[a-z]/ig);
    if(chk_num < 0 || chk_eng < 0)
    { 
        alert('��й�ȣ�� ���ڿ� �����ڸ� ȥ���Ͽ��� �մϴ�.'); 
        return false;
    }
    
    if(/(\w)\1\1\1/.test(upw))
    {
        alert('��й�ȣ�� ���� ���ڸ� 4�� �̻� ����Ͻ� �� �����ϴ�.'); 
        return false;
    }
    if(upw.search(uid)>-1)
    {
        alert('ID�� ���Ե� ��й�ȣ�� ����Ͻ� �� �����ϴ�.'); 
        return false;
    }

    return true;
}

$(document).ready(function(){
   /* ȸ�� Ż�� �̺�Ʈ */
   $("#memberdelete").click(function(){
      var memberno=$("#myNo").attr("value");
      var q1 = confirm("���� Ż���Ͻðڽ��ϱ�?");
      if (q1==true){
         var q2 =   confirm("��¥��?");
         if(q2==true){
            $.post("memberdelete.do",
                  {
                     no: memberno
                  },
                  function(data, status){
                     alert("Ż���ϼ̽��ϴ�. �� ������.");
                     location.href=data;
            });
         }
      }
   });
})


