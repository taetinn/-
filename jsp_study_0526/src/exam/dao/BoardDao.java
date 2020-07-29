package exam.dao;

public class BoardDao {
	
	//singleton pattern
	private static BoardDao instance = new BoardDao();
	
	
	public static BoardDao getInstance() {
		return instance;
	}


	private BoardDao() {
		
	}
}
