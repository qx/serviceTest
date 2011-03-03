package junit.test;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.myshop.bean.user.Buyer;
import cn.myshop.service.user.BuyerService;





public class BuyerTest {
	private static BuyerService buyerService;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
		ApplicationContext act = new ClassPathXmlApplicationContext("beans.xml");
		buyerService = (BuyerService) act.getBean("buyerServiceBean");
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Test
	public void save() {
		buyerService.save(new Buyer("oyzk3", "12345","3721@qq.com"));
	}
}
