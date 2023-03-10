package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.SmartAnswerDto;
import mysql.db.DbConnect;

public class SmartAnswerDao {

	DbConnect db=new DbConnect();
	
public void insertAnswer(SmartAnswerDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into smartanswer values(null,?,?,?,now())";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNum());
			pstmt.setString(2, dto.getNickname());
			pstmt.setString(3, dto.getContent());
			
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			db.dbClose(pstmt, conn);
		}
	
	}
	
	
	public List<SmartAnswerDto> getAllAnswers(String num){
		
		List<SmartAnswerDto> list=new ArrayList<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from smartanswer where num=? order by idx";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,  num);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				SmartAnswerDto dto=new SmartAnswerDto();
				
				dto.setIdx(rs.getString("idx"));
				dto.setNum(rs.getString("num"));
				dto.setNickname(rs.getString("nickname"));
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
		
		String sql="delete from smartanswer where idx=?";
		
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
	
	
	
	public SmartAnswerDto getAnswerData(String idx) {
		
		SmartAnswerDto dto=new SmartAnswerDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from smartanswer where idx=?";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setIdx(rs.getString("idx"));
				dto.setNum(rs.getString("num"));
				dto.setNickname(rs.getString("nickname"));
				dto.setContent(rs.getString("content"));
				dto.setWriteday(rs.getTimestamp("writeday"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	
	
	public void updateAnswer(SmartAnswerDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update smartanswer set nickname=?,content=? where idx=?";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNickname());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getIdx());
			
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			db.dbClose(pstmt, conn);
		}
	}
	
	
	
}

