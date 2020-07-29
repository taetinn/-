package exam.xml;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.File;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.junit.jupiter.api.Test;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import lombok.extern.java.Log;

class PersonHandler extends DefaultHandler{
	
	private List<PersonDto> list;
	private PersonDto dto;
	private StringBuilder sb; // for buffer
	
	public PersonHandler() { //기본 생성자
		list = new ArrayList<>();
		sb = new StringBuilder();
	
	}
	
	public List<PersonDto> getList() {
		return list;
	}

	// 기본으로 필요한 메소드들
	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		if(qName.contentEquals("person")) {
			dto = new PersonDto();
			
			String strId = attributes.getValue("id"); //값을 문자열로 받아옴
			dto.setId(Integer.parseInt(strId));
			
		}
	}

	@Override
	public void endElement(String uri, String localName, String qName) throws SAXException {
		if (qName.equals("name")) {
			dto.setName(sb.toString().trim());
			sb.setLength(0);
		} else if (qName.equals("company")) {
			dto.setCompany(sb.toString().trim());
			sb.setLength(0);
		} else if (qName.equals("person")) {
			list.add(dto);
		}
	}

	@Override
	public void characters(char[] ch, int start, int length) throws SAXException {
	
		sb.append(ch,start,length);

	}
	
}

@Log
public class SaxParserTest {
	
	@Test
	void testParseFile() {
		
		String path = DomParserTest.class.getResource(".").getPath();
		log.info("path: " + path);
		
		// 읽어들일 XML파일 객체 준비
		File file = new File(path, "personList.xml");
		log.info(file.getPath());
		assertTrue(file.exists());
		
		//SAX Parser Object setting
		SAXParserFactory factory = SAXParserFactory.newInstance();
		SAXParser parser = null;
		
		PersonHandler handler = new PersonHandler();
		
		try {
			parser = factory.newSAXParser();
			parser.parse(file,handler); // (파싱할대상, 어떻게 할지)
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//Get Parsing Result from Handler
		List<PersonDto> list = handler.getList();
		
		//Output parsing result
		for(PersonDto dto:list) {
			System.out.println(dto);
		}
	}
	
	@Test
	void testParseMovieCompany() {
		
		String str = "http://kobis.or.kr/kobisopenapi/webservice/rest/company/searchCompanyList.xml?key=430156241533f1d058c603178cc3ca0e";
		
		HttpURLConnection con = null;
		try {
			URL url = new URL(str);
			con = (HttpURLConnection) url.openConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// SAX 파서 객체 준비하기
		SAXParserFactory factory = SAXParserFactory.newInstance();
		SAXParser parser = null;
		
		CompanyHandler handler = new CompanyHandler();
		
		try {
			parser = factory.newSAXParser();
			// 파싱 수행하기
			parser.parse(con.getInputStream(), handler);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//get Parsing result from handler
		List<CompanyDto> list = handler.getList();
		
		//Parsing result output
		for(CompanyDto dto :list) {
			System.out.println(dto);
		}
		
	} // testParseMovieCompany()
	
	
}
