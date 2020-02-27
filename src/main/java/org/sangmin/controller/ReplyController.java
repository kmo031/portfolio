package org.sangmin.controller;

import java.util.List;

import org.sangmin.domain.Criteria;
import org.sangmin.domain.ReplyDTO;
import org.sangmin.domain.ReplyPageDTO;
import org.sangmin.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
public class ReplyController {

	@Setter(onMethod_ = @Autowired)
	private ReplyService service;

	@PostMapping(value = "/new", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> create(@RequestBody ReplyDTO dto) {

		log.info("ReplyDTO : " + dto);

		int insertCount = service.register(dto);

		log.info("Reply INSERT COUNT : " + insertCount);

		// 3항연산자처리 입력이 제대로되었을경우만 성공 반환
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	// 특정 게시물의 댓글 목록 가져오기
	@GetMapping(value = "/pages/{id}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("id") int id) {
		log.info("특정 게시물 댓글목록 가져오기");

		Criteria cri = new Criteria(page, 10);
		log.info(cri);

		return new ResponseEntity<>(service.getList(cri, id), HttpStatus.OK);
	}

	// 댓글가져오기
	@GetMapping(value = "/{rno}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyDTO> get(@PathVariable("rno") int rno) {
		log.info("댓글가져오기");

		log.info("get : " + rno);

		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}

	// 댓글 삭제
	@DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("rno") int rno) {
		log.info("댓글삭제");

		log.info("remove : " + rno);

		return service.remove(rno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
					value="/{rno}",
					consumes = "application/json",
					produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyDTO dto, @PathVariable("rno") int rno){
		
		dto.setRno(rno);
		log.info("rno : " + rno);
		log.info("modify : " + dto);
		
		return service.modify(dto) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
