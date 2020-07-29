package exam.dao;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.sql.SQLException;
import java.time.LocalDateTime;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.function.Executable;

import exam.domain.MemberVo;
import lombok.extern.java.Log;

@Log
public class MemberDaoTests {
	
	//fixture
	private MemberDao dao;
	private MemberVo mem1,mem2,mem3;
	
	@BeforeEach
	void init() {
			
		dao = MemberDao.getInstance();
			
		mem1 = new MemberVo("admin","1234","admin","admin@admin.com",LocalDateTime.now().withNano(0),"seoul","02-1111-1111","010-1111-1111");
		mem2 = new MemberVo("hong","1234","hong","hong@hong.com",LocalDateTime.now().withNano(0),"Busan","02-2222-2222","010-2222-2222");
		mem3 = new MemberVo("Kim","1234","Kim","Kim@Kim.com",LocalDateTime.now().withNano(0),"Ulsan","02-3333-3333","010-3333-3333");
		
	}
	
	
	//테스트 일관성 유지를 위한 작업 필요
	//db test : getCount, deleteAll method
	
	@DisplayName("insert, select method test")
	@Test
	void addAndGet() throws SQLException {
		//condition
		dao.deleteAll();
		assertEquals(0, dao.getCount());
		
		//behavior
		dao.insert(mem1);
		dao.insert(mem2);
		assertEquals(2,dao.getCount());
		
		MemberVo memGet1 = dao.getMemberById(mem1.getId());
		

		//result
		assertNotNull(memGet1);
		assertEquals(mem1.getName(),memGet1.getName());
		assertEquals(mem1.getPasswd(),memGet1.getPasswd());
		
		
		//positive test - 존재하는 아이디로 레코드 가져오기
		MemberVo memGet2 = dao.getMemberById(mem2.getId());
		assertNotNull(memGet2);
		assertEquals(mem2.toString(), memGet2.toString());
		
		
		//negative test : 존재하지 않는 아이디로 가져올 때는 null return
		/*
		 * MemberVo memGet3 = dao.getMemberById("unknown_id"); assertNull(memGet3);
		 */
		//아이디없을떄 null이 반납되어야 테스트 성공
		
	}
	
	@Test
	void getMemberFailure() {
		// 조건
		dao.deleteAll();
		assertEquals(0, dao.getCount());
		
		// 부정테스트(negative test)
		// 존재하지 않는 id로 레코드 가져오기 하면
		// 예외가 발생해야 테스트 성공해야함
		
		// 예외객체의 타입 검사
		Throwable exception = assertThrows(SQLException.class, new Executable() {
			
			@Override
			public void execute() throws Throwable {
				dao.getMemberById("unknown_id");
			}
		});
		
		// 예외객체의 메시지 검사
		assertEquals("id에 해당하는 MemberVo 존재 x", exception.getMessage());
	}
	
	@Test
	void testUpdate() {
		// 조건
		dao.deleteAll();
		assertEquals(0, dao.getCount());
	}
	
	@Test
	void testIsIdDuplicated() {
		// 조건
		dao.deleteAll();
		assertEquals(0, dao.getCount());
		
		//negative test
		assertFalse(dao.isIdDuplicated(mem1.getId()));
		
		//positive test
		dao.insert(mem1);
		assertEquals(1,dao.getCount());
		
		assertTrue(dao.isIdDuplicated(mem1.getId()));		
	}
	
	@DisplayName("count method test")
	@Test
	void count() { //통과 시count, deleteAll, insert 검증 
		dao.deleteAll();
		assertEquals(0, dao.getCount());
		
		dao.insert(mem1);
		assertEquals(1,dao.getCount());
		
		dao.insert(mem2);
		assertEquals(2,dao.getCount());
		
		dao.insert(mem3);
		assertEquals(3,dao.getCount());
		
	}
}
