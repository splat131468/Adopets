package web.member.service.impl;

import web.member.dao.CreditCardDAO_interface;
import web.member.dao.impl.CreditCardJDBCDAO;
import web.member.entity.CreditCardVO;

public class CreditCardService {

	private CreditCardDAO_interface dao;

	public CreditCardService() {
		dao = new CreditCardJDBCDAO();
	}
	
	public CreditCardVO addCreditCard(String cardNumber) {
		CreditCardVO creditCardVO = new CreditCardVO();

		creditCardVO.setCardNumber(cardNumber);;
		dao.insert(creditCardVO);

		return creditCardVO;
	}
	
}
