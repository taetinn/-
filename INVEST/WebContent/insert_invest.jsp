<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� Ȯ��</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		String ica = request.getParameter("ica");
		String iname = request.getParameter("iname");
		String ibuy = request.getParameter("ibuy");
		String m = request.getParameter("mno");
		//�̹� �ִ� �ֽ��̸� investment���̺��� ������Ʈ ���� �ʱ�. iname���� �Ǻ�.
		int cno = Integer.parseInt(ica);
		int mno = Integer.parseInt(m);
		int bfunds = Integer.parseInt(ibuy);
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "DB201412171",
				"201412171");
		PreparedStatement s = conn.prepareStatement("select * from investment where mno=?");
		s.setInt(1,mno);
		ResultSet r = s.executeQuery();
		int i = 0;
		int check = 0;
		while (r.next()) {
			if (iname.equals(r.getString("iname"))) {
				i = r.getInt("ino");
				check = 1;
				break;
			}
		}
		if (check == 0) {
			s=conn.prepareStatement("select * from investment");
			r=s.executeQuery();
			while(r.next()){
				i++;
			}
			i++;
			s = conn.prepareStatement("insert into investment values (?,?,?,?)");
			s.setInt(1, cno);
			s.setInt(2, mno);
			s.setInt(3, i);
			s.setString(4, iname);
			/*CNO,MNO,INO,INAME*/
			r = s.executeQuery();
		}
		//buy ���̺��� ���� �ֱ�. bno ino bdate bfunds bpres;
		java.text.DateFormat dateFormat = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String date = dateFormat.format(new java.util.Date());
		s = conn.prepareStatement("select * from buy where ino=?");
		s.setInt(1, i);
		r = s.executeQuery();
		int max = 0;
		while (r.next()) {
			max++;
		}
		max++;

		s = conn.prepareStatement("insert into buy values(?,?,?,?)");
		s.setInt(1, max);//bno
		s.setInt(2, i);
		s.setString(3, date);
		s.setInt(4, bfunds);
		r = s.executeQuery();

		r.close();
		s.close();
		conn.close();
	%>
	�Ϸ� �Ǿ����ϴ�.
	<a href="front.jsp?mno=<%=mno%>">Ȩ���� ����</a>
</body>
</html>