package memo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import mysql.db.DbConnect;

public class MemoDao {
   DbConnect db = new DbConnect();

   // insert
   public void insertMemo(MemoDto dto) {
      Connection conn = db.getConnection();
      PreparedStatement pstmt = null;

      String sql = "insert into memo values(null,?,?,?,now())";

      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, dto.getWriter());
         pstmt.setString(2, dto.getContent());
         pstmt.setString(3, dto.getAvata());
         pstmt.execute();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         db.dbClose(pstmt, conn);
      }

   }

   // select
   public List<MemoDto> getAllMemoDatas() {
      List<MemoDto> list = new Vector<>();
      Connection conn = db.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      String sql = "select * from memo order by num desc";

      try {
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();

         // while문에서 db데이타 읽어서 dto에 넣은 후
         // 다시 list에 추가한다
         while (rs.next()) {
            MemoDto dto = new MemoDto();
            dto.setNum(rs.getString("num"));
            dto.setWriter(rs.getString("writer"));
            dto.setContent(rs.getString("content"));
            dto.setAvata(rs.getString("avata"));
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
   
   
   //삭제
   public void deleteMemo(String num) {
	   
	   Connection conn=db.getConnection();
	   PreparedStatement pstmt=null;
	   
	   String sql="delete from memo where num=?";
	   
	   try {
		   
		   pstmt=conn.prepareStatement(sql);
		   pstmt.setString(1, num);
		   
		   pstmt.execute();
		   
	   }catch(SQLException e) {
		      
	   }finally {
		db.dbClose(pstmt, conn);
	}
   }
   
   
   //num에 해당하는 하나의 데이타 리턴
   public MemoDto getData(String num) {
	   
	   MemoDto dto=new MemoDto();
	   
	   Connection conn=db.getConnection();
	   PreparedStatement pstmt=null;
	   ResultSet rs=null;
	   
	   String sql="select * from memo where num=?";
	   
	   
	   try {
		   
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, num);
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			
			dto.setNum(rs.getString("num"));
            dto.setWriter(rs.getString("writer"));
            dto.setContent(rs.getString("content"));
            dto.setAvata(rs.getString("avata"));
            dto.setWriteday(rs.getTimestamp("writeday"));
		}
	} catch (SQLException e) {

		e.printStackTrace();
	}finally {
		db.dbClose(rs, pstmt, conn);
	}
	   
	   
	   return dto;
   }
   
   
   public void updatememo(MemoDto dto) {
	   
	   Connection conn=db.getConnection();
	   PreparedStatement pstmt=null;
	   
	   String sql="update memo set writer=?,content=?,avata=? where num=?";
	   
	   try {
		   
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, dto.getWriter());
		pstmt.setString(2, dto.getContent());
		pstmt.setString(3, dto.getAvata());
		pstmt.setString(4, dto.getNum());
		
		pstmt.execute();
		
	} catch (SQLException e) {

		e.printStackTrace();
	}finally {
		db.dbClose(pstmt, conn);
	}
	   
   }
   
   
}