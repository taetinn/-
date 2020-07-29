package exam.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// member 테이블의 레코드(행) 한개를 표현하는 클래스
//@Getter
//@Setter
//@ToString
@Data
@NoArgsConstructor //인자를 받지않는 기본생성자
@AllArgsConstructor //전체 인자를 받는 기본생성자
public class MemberVo implements Cloneable{
	
	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}
	private String id;
	private String passwd;
	private String name;
	private String email;
	private LocalDateTime regDate;
	private String address;
	private String tel;
	private String mtel;
	
}




