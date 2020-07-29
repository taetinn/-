package exam.xml;

import java.util.ArrayList;
import java.util.List;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class CompanyHandler extends DefaultHandler {

	private List<CompanyDto> list = new ArrayList<>();
	private CompanyDto dto;
	private StringBuilder sb = new StringBuilder();
	
	public List<CompanyDto> getList() {
		return list;
	}

	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		if(qName.equals("company")) {
			dto = new CompanyDto();
		}
	}

	@Override
	public void characters(char[] ch, int start, int length) throws SAXException {
		sb.append(ch,start,length);
	}
	
	@Override
	public void endElement(String uri, String localName, String qName) throws SAXException {
		
		if(qName.equals("companyCd")) {
			dto.setCompanyCd(sb.toString().trim());
			sb.setLength(0); //버퍼 지우기, 비우기
		} else if(qName.equals("companyNm")){
			dto.setCompanyNm(sb.toString().trim());
			sb.setLength(0); //버퍼 지우기, 비우기
		} else if(qName.equals("company")) {
			list.add(dto);
		}
	}
}



