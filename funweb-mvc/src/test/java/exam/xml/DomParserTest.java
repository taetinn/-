package exam.xml;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.junit.jupiter.api.Test;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import lombok.extern.java.Log;

@Log
public class DomParserTest {
	
	@Test
	void testParse() {
		log.info("@Test - testParse() 호출됨");
		
		// DOM(Document Object Model) 파서
		String path = DomParserTest.class.getResource(".").getPath();
		log.info("path: " + path);
		
		// 읽어들일 XML파일 객체 준비
		File file = new File(path, "personList.xml");
		log.info(file.getPath());
		assertTrue(file.exists());
		
		List<PersonDto> personList = new ArrayList<>();
		
		// DOM 파서 객체 준비하기
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = null;
		Document document = null;
		
		try {
			builder = factory.newDocumentBuilder();
			// 파일내용을 파싱해서 Document 객체로 리턴해줌
			// DOM 파서 장점: 미리 파싱후 결과를 객체로 메모리에 보관
			//                파싱후에 접근속도가 빠르다.
			// DOM 파서 단점: XML내용이 많으면 메모리를 많이 사용함.
			document = builder.parse(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//log.info(document.toString());
		
		
		// document 객체에서 필요한 부분을
		// 자바의 객체와 List 컬렉션으로 변환
		
		NodeList personNodeList = document.getElementsByTagName("person"); ///노드르 ㄹ다 가져와야하므로 태그이름으록 가져온다.
		for (int i=0; i<personNodeList.getLength(); i++) {
			PersonDto dto = new PersonDto();
			Node personNode = personNodeList.item(i);
			
			// 속성 값 가져오기
			NamedNodeMap attrMap = personNode.getAttributes();
			Node idNode = attrMap.getNamedItem("id");
			int id = Integer.parseInt(idNode.getNodeValue());
			dto.setId(id); // dto에 id값 설정
			
			// personNode의 자식요소들
			NodeList childNodeList = personNode.getChildNodes();
			for (int j=0; j<childNodeList.getLength(); j++) {
				Node childNode = childNodeList.item(j);
				
				// 태그이름 확인해서 값 가져오기
				if (childNode.getNodeName().equals("name")) {
					//String text = childNode.getChildNodes().item(0).getNodeValue();
					String text = childNode.getFirstChild().getNodeValue();
					dto.setName(text);
				}else if(childNode.getNodeName().equals("company")) {
					String text = childNode.getFirstChild().getNodeValue();
					dto.setCompany(text);
				}
				
				
			} // inner for
			
			//한개가 채워진 dto를 personList에 추가
			personList.add(dto);
		} // outer for
		
		
		//output personList
		for(PersonDto dto:personList) {
			System.out.println(dto);
		}
	}
	
	@Test
	void testURLConnection() {
		String str = "http://kobis.or.kr/kobisopenapi/webservice/rest/company/searchCompanyList.xml?key=430156241533f1d058c603178cc3ca0e";
		
		HttpURLConnection con = null;
		
		try {
			URL url = new  URL(str);
			con = (HttpURLConnection) url.openConnection(); //연결 메소드
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//문자입력스트림 set
		BufferedReader reader = null;
		
		try {
			reader = new BufferedReader(new InputStreamReader(con.getInputStream(),"utf-8"));
			
			String line = "";//받아온 inputstream 출력
			while((line = reader.readLine())!=null) {
				System.out.println(line);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 

	} //testURLConnection
	
	@Test
	void testParseMovieCompany() {
		List<CompanyDto> list = new ArrayList<>();
		String str = "http://kobis.or.kr/kobisopenapi/webservice/rest/company/searchCompanyList.xml?key=430156241533f1d058c603178cc3ca0e";
		
		HttpURLConnection con = null;
		try {
				URL url = new URL(str);
				con  = (HttpURLConnection) url.openConnection();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		//돔 파서를 위한 객체 및 참조변수 준비
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = null;
		Document document = null;
		
		try {
			builder = factory.newDocumentBuilder();
			document = builder.parse(con.getInputStream()); //document: 필요없는 정보까지 다 파싱해서 가지고있음.
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//compnay 태그이름 기준으로 NodeList get
		NodeList companyNodeList = document.getElementsByTagName("company");
		
		for (int i=0; i<companyNodeList.getLength(); i++) {
			CompanyDto dto = new CompanyDto();
			Node companyNode = companyNodeList.item(i);
			NodeList childNodeList = companyNode.getChildNodes();
			
			for (int j=0; j<childNodeList.getLength(); j++) {
				Node childNode = childNodeList.item(j);
				
				if (childNode.getNodeName().equals("companyCd")) {
					String companyCd = childNode.getFirstChild().getNodeValue();
					dto.setCompanyCd(companyCd.trim());
				} else if (childNode.getNodeName().equals("companyNm")) {
					String companyNm = childNode.getFirstChild().getNodeValue();
					dto.setCompanyNm(companyNm.trim());
				} else if(childNode.getNodeName().equals("filmoNames")) {
					if(childNode.getFirstChild() != null) { // filmoNames에 노드는이는데 자식 노드가 없는경우 대비
						String strFilmoNames = childNode.getFirstChild().getNodeValue();
						String[] strArr = strFilmoNames.split(","); //,기준으로 배열에 나눠 넣음
						
						//String[] -> List 변환
						List<String> filmoNames = Arrays.asList(strArr);
						dto.setFilmoNames(filmoNames);
					}
				} else {
					continue;
				}
			} // 안쪽 for문
			list.add(dto);
		} //outer for
		System.out.println("Parsing complete");
		
		System.out.println("Parsing Result");
		for(CompanyDto dto : list) {
			System.out.println(dto);
		}
	}//testParseMovieCompany
	}








