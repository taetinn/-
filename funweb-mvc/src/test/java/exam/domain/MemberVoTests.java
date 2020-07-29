package exam.domain;

import static org.junit.Assert.assertNotSame;
import static org.junit.jupiter.api.Assertions.assertEquals;

/*JUnit이 하나의 테스트 클래스를 갖ㅕ와 테스트를 수행하는 순서
 * 1. 테스트클래스에서 JUnit관련 annotation이 붙은 메소드를 모두
 * 2. BeforeAll static메소드가 있으면 실행
 * 3. 테스트클래스의 객체를 만든다.
 * 4. @BeforeEach메소드가 잇으면 실행
 * 5. @test 메소드를 호출하곳테스트 결과를 저장.
 * 6. @AfterEach 메소드가 이스면 실행
 * 7. 나머지 @Test메소드에 대해 3~6번 바ㄴ복
 * 8. @AgterAll 잇으면 실헹
 * 9. 모든결과를 종합해섭 ㅗ여준다.
 *  * 
 *  */
import java.time.LocalDateTime;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import lombok.extern.java.Log;

@DisplayName("Test about MemberVo") //클래스 앞에 붙이면 클래스에 대한 설명
@Log
public class MemberVoTests {
	
	
	private MemberVo member;//테스트 대상
	
	
	@BeforeAll //all로 끝나면 static method 여야함
	static void initAll() {
		log.info("@BeforeAll - initAll()");
	}
	@BeforeEach
	void init() {
		log.info("@BeforeEach - init()");
		
		
		//픽스처 준비
		//픽스처(Fixture) : 테스트 수행을 위해 필요한 정보, 객체
		member = new MemberVo("admin","1234","admin","admin@admin.com",LocalDateTime.now(),"seoul","02-1111-1111","010-9999-9999");

	}
	
	@DisplayName("Test Example")
	@Test
	void testExam() {
		log.info("@Test - testExam()");
	}
	
	@DisplayName("MemberVo 객체 복사 테스트")
	@Test
	void testClone() throws CloneNotSupportedException{
		log.info("@Test - testClone(");
		
		MemberVo memberClone = (MemberVo)member.clone(); //복제
		
		//memberClone.setName("hong"); //실패 체크용
		
		//assert 류의 검증메소드 사용으로 테스트케이스 작성
		//자동 판단 :same : 주소 equals : 내용
		assertNotSame(member, memberClone);
		assertEquals(member.getId(),memberClone.getId());
		assertEquals(member.toString(),memberClone.toString());
	}
	
	@AfterEach
	void tearDown() { //정리 메소드
		log.info("@AfterEach - tearDown()");
	}
	
	 // 실행에서 제외
	@DisplayName("Test2 Example")
	@Test
	void testExam2() {
		log.info("@Test - testExam2()");
	}
	
	@AfterAll
	static void tearDownAll() {
		log.info("@AfterAll - tearDownAll");
	}
	


}
