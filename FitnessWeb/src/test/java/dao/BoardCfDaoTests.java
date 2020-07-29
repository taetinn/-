package dao;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import lombok.extern.java.Log;
import vo.BoardVo;

@Log
@TestMethodOrder(OrderAnnotation.class)
public class BoardCfDaoTests {
	//insert delete update select 
	BoardCfDao dao;
	
	@BeforeEach
	void init() {
		dao = BoardCfDao.getInstance();
		
	}
	
	@Order(3)
	@Test
	void testUpdate() {
		BoardVo vo = dao.getBoardByNum(5);
		assertNotNull(vo);
		assertEquals("Kim5", vo.getName());
		
		vo.setName("Hong5");
		dao.update(vo);
		
		vo = dao.getBoardByNum(5);
		assertNotNull(vo);
		assertEquals("Hong5", vo.getName());
		
		
		
	}
	
	@Order(2)
	@Test
	void testInsert() {
		dao.deleteAll();
		assertEquals(0,dao.getTotal());
		
		dao.insertDummyRows(5);
		assertEquals(5, dao.getTotal());
		
	}
	
	@Order(4)
	@Test
	void testGetTotalCountfmCf() {
		String category = "name";
		String search = "Kim";
		
		assertEquals(4, dao.getTotalCountfmCf(category, search));
	}
	
	
	@Order(1)
	@Test
	void testDeleteAll() {
		dao.deleteAll();
		assertEquals(0, dao.getTotal());
	}
}
