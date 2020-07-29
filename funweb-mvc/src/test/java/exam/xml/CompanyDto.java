package exam.xml;

import java.util.List;

import lombok.Data;

@Data
public class CompanyDto {

	private String companyCd;
	private String companyNm;
	private List<String> filmoNames;
}
