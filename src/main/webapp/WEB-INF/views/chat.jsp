<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="./includes/header.jsp"%>

<style>

	
</style>


<div class="container" style="height : 400px;"> 

	<div class="card col-md-12" style="height : 90%; padding: 0px;">
	
		<div class="card-header"><strong>정보를 공유하는 채팅방</strong></div>
	    <div class="card-body" id="data" style="height : 100%; overflow-y: scroll;">
	  
	    </div>  
	    
	    <div class="card-footer">
	    	<div class="row">
		    	 <input class="col-10" type="text" id="message" tabindex="1" />
		    	 <input type="button" class="col-2" id="sendBtn" value="전송" /> 
	    	 </div>
	    </div>
	</div> 
</div>





<script type="text/javascript" src="<c:url value="/resources/js/sockjs-0.3.4.js"/>"></script>

<script type="text/javascript">

    $(document).ready(function() {
    	

        $("#sendBtn").click(function() {

            sendMessage();

        });
        
        $("#message").keydown(function(key){
        	if(key.keyCode == 13){ //엔터키이면
        		sendMessage();
        	}
        });

    });

    var sock;

    //웸소켓을 지정한 url로 연결한다.

    sock = new SockJS("<c:url value="/chat"/>");


    //자바스크립트 안에 function을 집어넣을 수 있음.

    //데이터가 나한테 전달되읐을 때 자동으로 실행되는 function

    sock.onmessage = onMessage;


    //데이터를 끊고싶을때 실행하는 메소드

    sock.onclose = onClose;


    /* sock.onopen = function(){

        sock.send($("#message").val());

    }; */

    function sendMessage() {

        /*소켓으로 보내겠다.  */

        sock.send($("#message").val());
        
        $("#message").focus();
        $("#message").val("");
        
        //입력시 스크롤 최하단으로 이동
        const $messageTextBox = $('#data');
        $messageTextBox.scrollTop($messageTextBox[0].scrollHeight);


    }

    //evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)

    function onMessage(evt) {

        var data = evt.data;

        $("#data").append(data + "<br/>");

        //sock.close();

    }


    function onClose(evt) {

        $("#data").append("연결 끊김");

    }

</script>


<%@include file="./includes/footer.jsp"%>