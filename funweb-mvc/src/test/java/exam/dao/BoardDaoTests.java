package exam.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import lombok.extern.java.Log;

@TestMethodOrder(OrderAnnotation.class)
@Log
public class BoardDaoTests {
	
	private BoardDao dao;
	
	@BeforeEach
	void init() {
		dao = BoardDao.getInstance();
		
	}
		
	@Order(1)
	@Test
	void testInsertDummyRows() {
		dao.deleteAll();
		assertEquals(0, dao.getCount());
		
		dao.insertDummyRows(1000);
		assertEquals(1000, dao.getCount());
	}
	
	@Order(2)
	@Test
	void testGetBoardNum() {
		assertEquals(1001, dao.getBoardNum());
	}
}
	