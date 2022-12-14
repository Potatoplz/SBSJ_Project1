package kr.co.sbsj.delivery;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import kr.co.sbsj.util.dto.MemberDTO;

@Controller
@RequestMapping( value = "/delivery" )
public class DeliveryController {

	private final static Logger logger = LoggerFactory.getLogger(DeliveryController.class);

	@Autowired
	private DeliveryService service;

	@RequestMapping( value = "/delete", method = RequestMethod.GET )
	public void delete( DeliveryDTO dto, HttpSession session, PrintWriter out ) {
		dto.setMember_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );

		int successCount = 0;
		successCount = service.delete( dto );
		out.print(successCount);
		out.close();
	}//delete

	@RequestMapping( value = "/insert", method = RequestMethod.POST )
	public void insert( DeliveryDTO dto, HttpSession session, PrintWriter out ) {
		dto.setMember_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );

		int successCount = 0;
		successCount = service.insert( dto );
		out.print(successCount);
		out.close();
	}//insert

	@RequestMapping(value = "/form", method = RequestMethod.GET)
    public String form( String [] arr_cart_id,String [] md_id,String [] buy_qty, Model model, HttpSession session ) {
        List<DeliveryDTO> list = null;
        list = service.list( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );
        model.addAttribute("list", list);
        if(arr_cart_id == null) {
            arr_cart_id = new String[1];
            arr_cart_id[0] = "0";
         }
        if(md_id == null) {
        	md_id = new String[1];
        	md_id[0] = "0";
         }
        if(buy_qty == null) {
        	buy_qty = new String[1];
        	buy_qty[0] = "0";
         }
        model.addAttribute( "arr_cart_id", new Gson().toJson(arr_cart_id) );
        model.addAttribute( "md_id",  new Gson().toJson(md_id) );
        model.addAttribute( "buy_qty",  new Gson().toJson(buy_qty) );
        return "delivery/form";//jsp file name
    }//form
	@RequestMapping(value = "/form2", method = RequestMethod.GET)
	public String form2( Model model, HttpSession session ) {
		List<DeliveryDTO> list = null;
		list = service.list( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );
		model.addAttribute("list", list);
		return "delivery/form2";//jsp file name
	}//form

}//class

