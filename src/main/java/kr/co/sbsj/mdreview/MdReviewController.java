package kr.co.sbsj.mdreview;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.util.dto.SearchDTO;


@Controller
@RequestMapping ( value = "/mdreview" )
public class MdReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(MdReviewController.class);
	
	@Autowired
	private MdReviewService service;
	
	@RequestMapping(value = "/review_list", method = RequestMethod.GET)
	public String review_list( Model model, String userWantPage, SearchDTO dto ) {
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.totalListCount( dto );
		
		if( totalCount > 10 ) {
			lastPageNum = ( totalCount / 10 ) + ( totalCount % 10 > 0 ? 1 : 0 ); //10으로 나눈 후 나머지가 있다면 1, 아니면 0을 더해라.
		}
		if(userWantPage.length() >= 2) {
			String frontNum = userWantPage.substring(0, userWantPage.length()-1); 
			startPageNum = Integer.parseInt(frontNum) * 10 + 1; 
			endPageNum = (Integer.parseInt(frontNum) + 1) * 10; 
			
			String backNum = userWantPage.substring(userWantPage.length()-1, userWantPage.length()); //10 누를때 11로 넘어가는 거 방지
			if(backNum.equals("0")) {
				startPageNum = startPageNum - 10;
				endPageNum = endPageNum - 10;
			}
		}
		
		if(endPageNum > lastPageNum) {
			endPageNum = lastPageNum;
		}
		
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("userWantPage", userWantPage);
		model.addAttribute("lastPageNum", lastPageNum);
	
		int limitNum = ( Integer.parseInt(userWantPage) -1 ) * 10;
		List<MdReviewDTO> list = null;
		list = service.pagingList( dto );
		model.addAttribute("list", list);
		//logger.info(list.toString());

		return "/mdreview/review_list";//jsp file name
	}//review_list
	
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String review_write( String md_id, Model model ) {
		model.addAttribute("md_id", md_id);
		return "/mdreview/review_write";//jsp file name
	}//review_write
	
	@RequestMapping(value = "/exchange", method = RequestMethod.GET)
	public String exchange( ) {
		return "/mdreview/exchange";//jsp file name
	}//review_write
	
	
}