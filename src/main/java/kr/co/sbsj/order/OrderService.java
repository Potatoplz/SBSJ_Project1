package kr.co.sbsj.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.sbsj.cs.NoticeDTO;
import kr.co.sbsj.md.CouponDTO;
import kr.co.sbsj.md.MdDTO;
import kr.co.sbsj.util.dto.MemberDTO;

@Service
public class OrderService {

	@Autowired
	private OrderDAO dao;

	@Transactional
	public int insert( OrderMainDTO dto, int buyNowYN ) {
		int successCount = 0;
		successCount = dao.insertOrderMain(dto);//insertOrderMain을 호출하는 시점에서는 dto에 order_no 값이 없다.
		//insertOrderMain을 수행하면서 selectKey가 dto에 order_no 값을 입력한다.
		if(successCount < 1) return successCount;

		if(buyNowYN == 0) {
			successCount = dao.insertOrderDetail(dto);//insertOrderDetail을 호출하는 시점에서는 dto에 order_no 값이 있다.
			if(successCount < 1) return successCount;

			successCount = dao.deleteCartByArray(dto.getArr_cart_id());
		} else if(buyNowYN == 1) {//장바구니 테이블에 데이터가 없는 바로 주문
			successCount = dao.insertBuyNowOrderDetail(dto);
		}
		if(successCount < 1) return successCount;

		successCount = dao.updateDeliveryAddrUsedDate(dto);
		if(successCount < 1) return successCount;

		return successCount;
	}//insert
	
	public int stockUpdate( OrderMainDTO dto ) {
		int stockCount = 0;
		stockCount = dao.stockUpdate(dto);
		return stockCount;
	}//stockUpdate

	public List<MdDTO> buyNowOrderList(MdDTO dto) {
		List<MdDTO> list = null;
		list = dao.buyNowOrderList(dto);
		return list;
	}//buyNowOrderList

	public List<MdDTO> orderList(String [] arr_cart_id) {
		List<MdDTO> list = null;
		list = dao.orderList(arr_cart_id);
		return list;
	}//orderList
	public MemberDTO memberdto( String member_id ) {
		MemberDTO dto = null;
		dto = dao.memberdto( member_id );
		return dto;
	}//list

	public List<CouponDTO> couponList(CouponDTO coupondto) {
		List<CouponDTO> couponList = null;
		couponList = dao.couponList(coupondto);
		return couponList;
	}

	public int updateCoupon(CouponDTO dto) {
		int couponCount = 0;
		couponCount = dao.updateCoupon(dto);
		return couponCount;
}
	public List<OrderMainDTO> subList(OrderMainDTO dto) {
		List<OrderMainDTO> subList = null;
		subList= dao.subList(dto);
		return subList;
	}
	
	public int subInsert(OrderMainDTO dto) {
		int successCount = 0;
		successCount = dao.subInsert(dto);
		return successCount;
	}//subInsert

	public int subsYnUpdate(OrderMainDTO dto) {
		int subsYnCnt = 0;
		subsYnCnt = dao.subsYnUpdate(dto);
		return subsYnCnt;
	}

}//class
