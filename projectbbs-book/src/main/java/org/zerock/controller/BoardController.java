package org.zerock.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.inject.Inject;

import org.junit.runner.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {

	@Inject
	private BoardService service;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGet(BoardVO board, Model model) throws Exception {

		log.info("register get..........");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception {

		log.info("request post...........");
		log.info(board.toString());

		service.regist(board);

		rttr.addFlashAttribute("msg", "success");
		// model.addAttribute("result", "success");

		return "redirect:/board/listAll";

	}

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception {

		log.info("load all list...................");
		model.addAttribute("list", service.listAll());
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, Model model) throws Exception {

		model.addAttribute(service.read(bno));
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modify(int bno, Model model) throws Exception {
		log.info("modify call...................");
		model.addAttribute(service.read(bno));
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
		log.info("modify post call...................");

		service.modify(board);
		rttr.addAttribute("msg", "SUCCESS");

		return "redirect:/board/listAll";
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("bno")int bno, RedirectAttributes rttr) throws Exception {
		
		log.info("remove call...................");

		service.remove(bno);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/board/listAll";
	}


}
