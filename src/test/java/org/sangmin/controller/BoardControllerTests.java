package org.sangmin.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class BoardControllerTests {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	/*
	 * @Test public void testList() throws Exception{ log.info(
	 * mockMvc.perform(MockMvcRequestBuilders.get("/board/board")) .andReturn()
	 * .getModelAndView() .getModelMap()); }
	 */
	
	//게시글 가져오기 테스트
	/*
	 * @Test public void testGet() throws Exception{
	 * 
	 * log.info(mockMvc.perform(MockMvcRequestBuilders .get("/board/detail")
	 * .param("id", "101")) .andReturn() .getModelAndView().getModelMap());
	 * 
	 * }
	 */
	
	//게시글 등록 테스트
	/*
	 * @Test public void testRegister() throws Exception{
	 * 
	 * String resultPage =
	 * mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
	 * .param("title", "컨트롤러 테스트 제목") .param("content", "컨트롤러 테스트")
	 * .param("writer_Id", "정상민 테스터") .param("type", "board")
	 * ).andReturn().getModelAndView().getViewName(); log.info(resultPage);
	 * 
	 * }
	 */
	//게시글 업데이트 테스트
	/*
	 * @Test public void testModify() throws Exception{
	 * 
	 * String resultPage =
	 * mockMvc.perform(MockMvcRequestBuilders.post("/board/modify") .param("id",
	 * "123") .param("title", "컨트롤러 수정 테스트 제목") .param("content", "컨트롤러 수정 테스트")
	 * ).andReturn().getModelAndView().getViewName(); log.info(resultPage);
	 * 
	 * }
	 */
	//삭제 테스트
	/*
	 * @Test public void testRemove() throws Exception{
	 * 
	 * String resultPage =
	 * mockMvc.perform(MockMvcRequestBuilders.post("/board/remove") .param("id",
	 * "123")) .andReturn().getModelAndView().getViewName();
	 * 
	 * log.info(resultPage);
	 * 
	 * }
	 */
	
	//페이징 테스트
	@Test
	public void pageTest() throws Exception{
		
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/board")
				.param("pageNum", "1")
				.param("amount", "50"))
				.andReturn().getModelAndView().getModelMap());
	}

}
