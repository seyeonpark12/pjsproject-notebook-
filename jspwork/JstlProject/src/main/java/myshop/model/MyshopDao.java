package myshop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mysql.db.DbConnect;

public class MyshopDao {
	DbConnect db = new DbConnect();

	// insert
	public void insertShop(MyshopDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into myshop values(null, ?, ?, ?, ?, now())";// oracle과 다르게 맨앞은 null, 맨뒤날짜는 now()
		//번호 상품명 사진번호 가격 입고일 등록일
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSangpum());
			pstmt.setString(2, dto.getPhoto());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getIpgoday());

			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// 리스트로 출력, 전체 데이타 조회.
		public List<MyshopDto> getAllSangpums() {
			List<MyshopDto> list = new ArrayList<>();
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;// PreparedStatement는 sql을 실행하고 ResultSet 객체를 반환한다.
			ResultSet rs = null;

			String sql = "select * from myshop order by num";

			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					MyshopDto dto = new	 MyshopDto();
					dto.setNum(rs.getString("num"));
					dto.setSangpum(rs.getString("sangpum"));
					dto.setPhoto(rs.getString("photo"));
					dto.setPrice(rs.getInt("price"));
					dto.setIpgoday(rs.getString("ipgoday"));
					dto.setWriteday(rs.getTimestamp("writeday"));
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			return list;
		}
		
		// num에 의한 하나의 dto 반환
		public MyshopDto getSangpum(String num) {
			MyshopDto dto = new MyshopDto();
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = "select * from myshop where num=?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					dto.setNum(rs.getString("num"));
					dto.setSangpum(rs.getString("sangpum"));
					dto.setPhoto(rs.getString("photo"));
					dto.setPrice(rs.getInt("price"));
					dto.setIpgoday(rs.getString("ipgoday"));
					dto.setWriteday(rs.getTimestamp("writeday"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			return dto;
		}
		
		//updateMyshop()
		public void updateMyshop(MyshopDto dto) {
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			String sql = "update myshop set sangpum=?, photo=?, price=?, ipgoday=? where num=?";

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, dto.getSangpum());
				pstmt.setString(2, dto.getPhoto());
				pstmt.setInt(3, dto.getPrice());
				pstmt.setString(4, dto.getIpgoday());
				pstmt.setString(5, dto.getNum());

				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		// delete
		public void deleteMyshop(String num) {
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;

			String sql = "delete from myshop where num=?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, num);
				pstmt.execute();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				db.dbClose(pstmt, conn);
			}
		}
}
