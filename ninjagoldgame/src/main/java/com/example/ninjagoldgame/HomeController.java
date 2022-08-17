package com.example.ninjagoldgame;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	private ArrayList<String> msg = new ArrayList<String>();

	@RequestMapping(value = "/ninja", method = RequestMethod.GET)
	public String home(Model model) {
		return "index.jsp";
	}

	@RequestMapping(value = "/process", method = RequestMethod.POST)
	public String processMoney(Model model, HttpSession session, @RequestParam String location) {

		// 1. generate session for the gold counter
		Integer currentCount = (Integer) session.getAttribute("currentCount");

		String textString = "";
		
		// 2. generate Random for each place
		// farm - add 10 - 20 to gold
		int farmRandom = (int) ((Math.random() * (20 - 10)) + 10);
		// cave - add 5-10 to gold
		int caveRandom = (int) ((Math.random() * (10 - 5)) + 5);
		// house - add 2-5 to gold
		int houseRandom = (int) ((Math.random() * (5 - 2)) + 2);
		// casino - add or remove 0-50 to gold
		int casinoRandom = (int) ((Math.random() * (50 - (-50)) + (-50)));
		if (currentCount == null) {
			session.setAttribute("currentCount", 0);
		}
		if (currentCount != null) {
			if (location.equals("Farm")) {
				currentCount += farmRandom;
				textString += "You Completed a Farm and earned " + currentCount + " gold";

			} else if (location.equals("Cave")) {
				currentCount += caveRandom;
				textString += "You Completed a Cave and earned " + currentCount + " gold";
			} else if (location.equals("House")) {
				currentCount += houseRandom;
				textString += "You Completed a House and earned " + currentCount + " gold";
			} else if (location.equals("Casino")) {
				currentCount += casinoRandom;
				if (currentCount > 0) {
					textString += "You Completed a Casino and earned " + currentCount + " gold";
					 

				} else {
					textString += "You faild a Casino and lost " + currentCount + " gold";
					 
				}
			}

			
		
			msg.add(textString);
			session.setAttribute("msg", msg);
			model.addAttribute("msg", msg);

			session.setAttribute("currentCount", currentCount);
			model.addAttribute("currentCount", currentCount);

		}

		return "redirect:/ninja";
	}

}
