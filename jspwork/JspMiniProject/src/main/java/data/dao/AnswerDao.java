package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import data.dto.AnswerDto;
import mysql.db.DbConnect;

public class AnswerDao {

	DbConnect db=new DbConnect();
	
	public void insertAnswer(AnswerDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into answer values(null,?,?,?,now())";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNum());
			pstmt.setString(2, dto.getMyid());
			pstmt.setString(3, dto.getContent());
			
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			db.dbClose(pstmt, conn);
		}
	
	}
	
	
	public List<AnswerDto> getAllAnswers(String num){
		
		List<AnswerDto> list=new ArrayList<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from answer where num=? order by idx";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,  num);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				AnswerDto dto=new AnswerDto();
				
				dto.setIdx(rs.getString("idx"));
				dto.setNum(rs.getString("num"));
				dto.setMyid(rs.getString("myid"));
				dto.setContent(rs.getString("content"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	
	}
	
	
	public void deleteAnswer(String idx) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from answer where idx=?";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			
			pstmt.execute();
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}

	
	
	
			
}
