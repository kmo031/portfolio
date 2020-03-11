package org.sangmin.service;
 
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import lombok.extern.log4j.Log4j;

@Log4j
public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{
  
	 @Override
	    public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler,
	         Map<String, Object> attributes) throws Exception {    
	    
	        // 위의 파라미터 중, attributes 에 값을 저장하면 웹소켓 핸들러 클래스의 WebSocketSession에 전달된다
	        log.info("Before Handshake");
	          
	          
	        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
	        log.info("URI:"+request.getURI());
	  
	        HttpServletRequest req =  ssreq.getServletRequest();
	 
	        /*String userId = req.getParameter("userid");
	        log.info("param, id:"+userId);
	        attributes.put("userId", userId);*/
	  
	        // HttpSession 에 저장된 이용자의 아이디를 추출하는 경우
	        String id = (String)req.getSession().getAttribute("userName");
	        attributes.put("userId", id);
	        log.info("HttpSession에 저장된 id:"+id);
	         
	        return super.beforeHandshake(request, response, wsHandler, attributes);
	    }
	  
	    @Override
	    public void afterHandshake(ServerHttpRequest request,
	            ServerHttpResponse response, WebSocketHandler wsHandler,
	            Exception ex) {
	        log.info("After Handshake");
	  
	        super.afterHandshake(request, response, wsHandler, ex);
	    }
  
}


