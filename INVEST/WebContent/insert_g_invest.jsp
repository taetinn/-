<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>그룹 투자 확인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		String m = request.getParameter("mno");//mno
		String g = request.getParameter("gno");//gno
		String ica = request.getParameter("ica");
		String iname = request.getParameter("iname");
		String ibuy = request.getParameter("ibuy");
		//이미 있는 주식이면 g_invest테이블은 업데이트 하지 않기. iname으로 판별.
		int cno = Integer.parseInt(ica);
		int mno = Integer.parseInt(m);
		int gno = Integer.parseInt(g);
		int bfunds = Integer.parseInt(ibuy);
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "DB201412171",
				"201412171");
		PreparedStatement s = conn.prepareStatement("select * from g_investment where gno=?");
		s.setInt(1, gno);
		ResultSet r = s.executeQuery();
		int i = 0;
		int check = 0;
		while (r.next()) {
			if (iname.equals(r.getString("giname"))) {
				check = 1;
				i=r.getInt("gino");
				break;
			}
		}
		
		if (check == 0) {
			s=conn.prepareStatement("select * from g_investment");
			r=s.executeQuery();
			while(r.next()){
				i++;
			}
			i++;
			s = conn.prepareStatement("insert into g_investment values (?,?,?,?)");
			s.setInt(1, i);
			s.setString(2, iname);
			s.setInt(3, gno);
			s.setInt(4, cno);
			/*CNO,MNO,INO,INAME*/
			r = s.executeQuery();
		}
		//g_dividend 테이블에 정보 넣기 mno gno gino gmfunds. 이미 있으면 gmfunds만 업데이트
		s = conn.prepareStatement("select * from g_dividend where mno=?");
		s.setInt(1, mno);
		r = s.executeQuery();
		check = 0;
		int bb = 0;
		while (r.next()) {
			if (i == r.getInt("gino")) {
				check = 1;
				bb = r.getInt("gmfunds");
				break;
			}
		}
		if (check == 0) {
			s = conn.prepareStatement("insert into g_dividend values(?,?,?,?)");
			s.setInt(1, mno);
			s.setInt(2, gno);
			s.setInt(3, i);
			s.setInt(4, bfunds);
			r = s.executeQuery();
		}
		if (check == 1) {

			s = conn.prepareStatement("update g_dividend set gmfunds=? where mno=? and gino=?");
			s.setInt(1, bfunds + bb);//
			s.setInt(2, mno);
			s.setInt(3, i);
			r = s.executeQuery();
		}
		//g_buy 테이블에도 정보 넣기. gbno gino gbdate gbfunds gbpres;
		java.text.DateFormat dateFormat = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String date = dateFormat.format(new java.util.Date());
		s = conn.prepareStatement("select * from g_buy where gino=?");
		s.setInt(1, i);
		r = s.executeQuery();
		int max = 0;
		while (r.next()) {
			max++;
		}
		max++;

		s = conn.prepareStatement("insert into g_buy values(?,?,?,?)");
		s.setInt(1, max);//gbno
		s.setInt(2, i);
		s.setString(3, date);
		s.setInt(4, bfunds);
		r = s.executeQuery();

		r.close();
		s.close();
		conn.close();
	%>
	완료 되었습니다.
	<a href="front.jsp?mno=<%=mno%>">홈으로 가기</a>
</body>
</html>