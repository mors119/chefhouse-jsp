package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnection;
import dto.ListDTO;

public class ListDAO extends JDBConnection {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	// list 전체 조회 ( content 없음 )
	public List<ListDTO> ListAll() {

		List<ListDTO> list = new ArrayList<>();

		try {
			conn = getConn();

			String sql = "SELECT NO, TITLE, WRITER, DATE, COUNT FROM LIST";

			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {

				ListDTO dto = new ListDTO();

				dto.setNo(rs.getInt("NO"));
				dto.setTitle(rs.getString("TITLE"));
				dto.setWriter(rs.getString("WRITER"));
				dto.setDate(rs.getString("DATE"));
//				dto.setContent(rs.getString("CONTENT"));
				dto.setCount(rs.getInt("COUNT"));

				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close(conn, ps, rs);
		}

		return list;
	}

	// view page clicked list one
	public ListDTO ListOne(int listno) {

		ListDTO dto = null;

		try {
			conn = getConn();

			String sql = "";
			sql = "SELECT                                                                    ";
			sql += "    current_row.*,                                                       ";
			sql += "    COALESCE(previous_row.NO, 0) AS `prev`,                                ";
			sql += "    COALESCE(next_row.NO, 0) AS `next`,                                    ";
			sql += "    COALESCE(previous_row.TITLE, '이전 글이 없습니다.') AS `prevTitle`,   		 ";
			sql += "    COALESCE(next_row.TITLE, '다음 글이 없습니다.') AS `nextTitle`         	 ";
			sql += "FROM                                                                     ";
			sql += "    (SELECT NO,                                                          ";
			sql += "            TITLE,                                                       ";
			sql += "            WRITER,                                                      ";
			sql += "            DATE,                                                        ";
			sql += "            CONTENT,                                                     ";
			sql += "            COUNT                                                        ";
			sql += "     FROM LIST                                                           ";
			sql += "     WHERE NO = ?) AS current_row                                        ";
			sql += "LEFT JOIN                                                                ";
			sql += "    (SELECT NO, TITLE                                                    ";
			sql += "     FROM LIST                                                           ";
			sql += "     WHERE NO < ?                                                        ";
			sql += "     ORDER BY NO DESC                                                    ";
			sql += "     LIMIT 1) AS previous_row ON 1 = 1                                   ";
			sql += "LEFT JOIN                                                                ";
			sql += "    (SELECT NO, TITLE                                                    ";
			sql += "     FROM LIST                                                           ";
			sql += "     WHERE NO > ?                                                        ";
			sql += "     ORDER BY NO ASC                                                     ";
			sql += "     LIMIT 1) AS next_row ON 1 = 1                                       ";
			sql += "ORDER BY                                                                 ";
			sql += "    current_row.NO DESC													 ";

			ps = conn.prepareStatement(sql);

			ps.setInt(1, listno);
			ps.setInt(2, listno);
			ps.setInt(3, listno);

			rs = ps.executeQuery();

			while (rs.next()) {

				dto = new ListDTO();

				dto.setNo(rs.getInt("NO"));
				dto.setTitle(rs.getString("TITLE"));
				dto.setWriter(rs.getString("WRITER"));
				dto.setDate(rs.getString("DATE"));
				dto.setContent(rs.getString("CONTENT"));
				dto.setCount(rs.getInt("COUNT"));
				dto.setPrev(rs.getInt("PREV"));
				dto.setNext(rs.getInt("NEXT"));
				dto.setPrevTitle(rs.getString("PREVTITLE"));
				dto.setNextTitle(rs.getString("NEXTTITLE"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, ps, rs);
		}
		return dto;
	}

	public int PlusCount(int no) {
		int result = 0;

		try {
			conn = getConn();

			String sql = "UPDATE LIST SET COUNT = COUNT + 1 WHERE NO = ?";

			ps = conn.prepareStatement(sql);

			ps.setInt(1, no);

			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println(result);
			close(conn, ps, rs);
		}
		return result;
	}
}
