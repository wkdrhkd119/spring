package spring.model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.utility.blog.DBClose;
import spring.utility.blog.DBOpen;

@Repository
public class MemberDAO_old {
	
	public String getGrade(String id){
		String grade = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select grade from member where id=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				grade = rs.getString("grade");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt, rs);
		}
		
		return grade;
	}
	
	public boolean loginCheck(String id, String passwd){
		boolean flag=false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from member ");
		sql.append(" where id=? and passwd=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				int cnt = rs.getInt(1);
				if(cnt>0) flag=true;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt, rs);
		}
		
		
		return flag;
	}
	
	public boolean delete(String id){
		boolean flag = false;
		//String fname = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from member where id=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0) flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt);
		}
		
		return flag;
	}
	
	public String getFname(String id){
		String fname = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select fname from member ");
		sql.append(" where id= ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				fname = rs.getString("fname");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt, rs);
		}
		
		return fname;
	}
	
	public boolean update(MemberDTO dto){
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update member set tel= ?, email= ?, zipcode= ?,  ");
		sql.append(" address1= ?, address2= ?, job= ? where id = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTel());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress1());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setString(6, dto.getJob());
			pstmt.setString(7, dto.getId());
			
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0) flag=true;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt);
		}
		
		return flag;
	}
	
	public boolean updatePw(String id, String passwd){
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update member set passwd = ? where id = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, passwd);
			pstmt.setString(2, id);
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0) flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt);
		}
		
		return flag;
	}
	
	public boolean updateFile(String id, String fname){
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update member ");
		sql.append(" set fname = ? where id = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setString(2, id);
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0) flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt);
		}
		
		
		return flag;
	}
	
	public MemberDTO read(String id){
		MemberDTO dto = new MemberDTO();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select id, mname, tel, email, zipcode, ");
		sql.append(" address1, address2, job, mdate, fname  ");
		sql.append(" from member where id = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto.setId(rs.getString("id"));
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setJob(rs.getString("job"));
				dto.setMdate(rs.getString("mdate"));
				dto.setFname(rs.getString("fname"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt, rs);
		}
		
		return dto;
	}
	
	public List<MemberDTO> list(Map map){
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT id, mname, tel, email, zipcode, address1, address2, job, mdate, fname, r ");
		sql.append(" from(  ");
		sql.append(" 	SELECT id, mname, tel, email, zipcode, address1, address2, job, mdate, fname, rownum r ");
		sql.append(" 	from(  ");
		sql.append(" 		SELECT id, mname, tel, email, zipcode, address1, address2, job, mdate, fname ");
		sql.append(" 		FROM member  ");
		if(word.trim().length()>0)
			sql.append(" 		WHERE "+col+" LIKE '%'||?||'%' ");
		sql.append(" 		ORDER BY id ASC ");
		sql.append(" 	) ");
		sql.append(" )where r>=? and r<=? ");
	
		
		
		
		try {
			int i = 1;
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(i++, word);
			
			pstmt.setInt(i++, sno);
			pstmt.setInt(i++, eno);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setFname(rs.getString("fname"));
				
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt, rs);
		}
		
		
		return list;
	}
	
	public int total(String col, String word){
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from member ");
		if(word.trim().length()>0)
			sql.append(" where "+col+" like '%'||?||'%' ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(1, word);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt, rs);
		}
		
		
		return total;
	}
	
	public boolean create(MemberDTO dto){
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into member ");
		sql.append(" (id, passwd, mname, tel, email, zipcode, ");
		sql.append("  address1, address2, job, mdate, fname, grade) ");
		sql.append(" values(?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, 'H') ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getJob());
			pstmt.setString(10, dto.getFname());
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0) flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt);
		}
		
		return flag;
	}
	
	public boolean duplicateEmail(String email){
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(email) from member ");
		sql.append(" where email = ? ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
						
			rs = pstmt.executeQuery();
			if(rs.next()){
				int cnt = rs.getInt(1);
				if(cnt>0) flag=true;	//중복된 email입니다.
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return flag;
	}
	
	
	public boolean duplicateId(String id){
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(id) from member ");
		sql.append(" where id = ? ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
						
			rs = pstmt.executeQuery();
			if(rs.next()){
				int cnt = rs.getInt(1);
				if(cnt>0) flag=true;//중복된 아이디입니다.
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return flag;
	}

}
