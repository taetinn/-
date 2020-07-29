package exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import exam.vo.AttachfileVo;

public class AttachfileDao {
	
	private static AttachfileDao instance = new AttachfileDao();
	
	public static AttachfileDao getInstance() {
		return instance;
	}

	private AttachfileDao() {
	}
	
	public AttachfileVo getAttachfileByUuid(String uuid) {
		AttachfileVo vo = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtils.getConnection();
			
			String sql = "SELECT * FROM attachfile WHERE uuid = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uuid);
			// 실행
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo = new AttachfileVo();
				vo.setUuid(rs.getString("uuid"));
				vo.setFilename(rs.getString("filename"));
				vo.setUploadpath(rs.getString("uploadpath"));
				vo.setImage(rs.getString("image"));
				vo.setBno(rs.getInt("bno"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return vo;
	}
	
	public List<AttachfileVo> getAttachfilesByBno(int bno) {
		List<AttachfileVo> list = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtils.getConnection();
			
			String sql = "SELECT * FROM attachfile WHERE bno = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			// 실행
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				AttachfileVo vo = new AttachfileVo();
				vo.setUuid(rs.getString("uuid"));
				vo.setFilename(rs.getString("filename"));
				vo.setUploadpath(rs.getString("uploadpath"));
				vo.setImage(rs.getString("image"));
				vo.setBno(rs.getInt("bno"));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return list;
	}
	
	// 첨부파일정보 한개 추가
	public void insert(AttachfileVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "INSERT INTO attachfile (uuid, filename, uploadpath, image, bno) ";
			sql += "VALUES (?, ?, ?, ?, ?) ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getUuid());
			pstmt.setString(2, vo.getFilename());
			pstmt.setString(3, vo.getUploadpath());
			pstmt.setString(4, vo.getImage());
			pstmt.setInt(5, vo.getBno());
			// 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	} // insert
	
	
	// 첨부파일정보 여러개 추가
	public void insert(List<AttachfileVo> list) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "INSERT INTO attachfile (uuid, filename, uploadpath, image, bno) ";
			sql += "VALUES (?, ?, ?, ?, ?) ";
			
			pstmt = con.prepareStatement(sql);
			
			for (AttachfileVo vo : list) {
				pstmt.setString(1, vo.getUuid());
				pstmt.setString(2, vo.getFilename());
				pstmt.setString(3, vo.getUploadpath());
				pstmt.setString(4, vo.getImage());
				pstmt.setInt(5, vo.getBno());
				// 버퍼에 배치작업으로 추가해놓음
				pstmt.addBatch();
			} // for
			
			// 실행
			int[] rowCountArr = pstmt.executeBatch();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	} // insert
	
}









