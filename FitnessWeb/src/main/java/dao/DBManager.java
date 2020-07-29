package dao;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBManager {
	
	private static SqlSessionFactory sqlSessionFactory; //한번만 받아오도록
	
	static {
		try(InputStream is = Resources.getResourceAsStream("mybatis-config.xml")){
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);

		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
}
