package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	/* 
	String dbURL = "jdbc:mysql://jspdb.ca9opcv9urn1.us-east-2.rds.amazonaws.com:3306/webkakao";
	String dbID = "admin";
	String dbPassword = "han2187979";
	*/
	
	public UserDAO() {
		try {
			//직접쿼리는 한글들어감  웹에서 들어갈시 깨짐 -> 
			String dbURL = "jdbc:mysql://localhost:3306/Webkakao";
			String dbID = "root";
			String dbPassword = "0000";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "select userPassword from user where userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword))
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 틀림
			}
			return -1; // 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // db오류
	}
	public int join(UserDTO user) {
		String SQL = "insert into user values(?, ?, ?, ?, NULL)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getUserPassword());
			pstmt.setString(4, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		return -1; //DB 오류
	}

	
	public String getProfile(String userID) {
		String SQL = "SELECT *FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.getString("userProfile").equals("NULL"))
					return "./resources/images/avatar.jpg";
				else 
					return "./resources/images/" + rs.getString("userProfile");
				}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				if (rs != null)
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		return "./resources/images/avatar.jpg";
	}
	
	public int registerCheck(String userID) {

		String SQL = "SELECT * FROM user WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next() || userID.equals("")) {
				return 0; //이미 존재하는 회원
			}
			else {
				return 1; //가입 가능한 회원 ID
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; //DB오류
	}
	
	public ArrayList<UserDTO> getSpecificUserInfo (String userID) {
		String SQL = ("select * from user where userID =?");
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()){
				UserDTO user = new UserDTO();
				user.setUserID(rs.getString("userID"));
				user.setUserName(rs.getString("userName"));
				user.setUserEmail(rs.getString("userEmail"));
				user.setUserProfile(rs.getString("userProfile"));
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				if (rs != null)
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		return list;
	}
	
	public ArrayList<UserDTO> getUserInfo () {
		String SQL = ("select * from user");
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		try {
			pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()){
				UserDTO user = new UserDTO();
				user.setUserID(rs.getString("userID"));
				user.setUserName(rs.getString("userName"));
				user.setUserEmail(rs.getString("userEmail"));
				user.setUserProfile(rs.getString("userProfile"));
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				if (rs != null)
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		return list;
	}
	
	public int updateProfile(String userID, String userProfile) {
		String SQL = "UPDATE user SET userProfile = ? WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userProfile);
			pstmt.setString(2,userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		return -1; //DB 오류
	}
}
	
