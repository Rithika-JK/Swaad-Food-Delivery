package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.UserDAO;
import com.tap.model.User;
import com.tap.utility.DBConnection;

public class UserDAOImpl implements UserDAO{
	
	private static final String INSERT_QUERY ="INSERT INTO user(userName,email,password,address,role,lastLoginDate) VALUES(?,?,?,?,?,?)";
	
	private static final String SELECT_QUERY="SELECT * FROM user WHERE userId = ?";
	private static final String SELECT_QUERY_02="SELECT * FROM user";
	
	private static final String UPDATE_QUERY= "UPDATE USER SET userName=?, password=?, email=?, address=?, role=?, lastLoginDate=? WHERE userId=? ";

	private static final String DELETE_QUERY= " DELETE FROM USER WHERE userId=?";
	private static final String GET_USER_BY_EMAIL = "SELECT * FROM user WHERE email=?";

	private static final String EMAIL_EXISTS = "SELECT COUNT(*) FROM user WHERE email=?";

	private static final String UPDATE_LAST_LOGIN = "UPDATE user SET lastLoginDate=? WHERE userId=?";
	
	
	@Override
	public void addUser(User u) {
		Connection connection=DBConnection.getConnection();
		
		try {
			PreparedStatement pstmt=connection.prepareStatement(INSERT_QUERY);
			
			pstmt.setString(1, u.getUserName());
			pstmt.setString(2, u.getEmail());
			pstmt.setString(3, u.getPassword());
			pstmt.setString(4, u.getAddress());
			pstmt.setString(5, u.getRole());
			pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
		
			pstmt.executeUpdate();
			System.out.println(1);
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	//UPDATE USER
	
	
	@Override
	public void updateUser(User u) {
		Connection connection=DBConnection.getConnection();
		 
		try {
			PreparedStatement pstmt=connection.prepareStatement(UPDATE_QUERY);
			
			pstmt.setString(1, u.getUserName());
			pstmt.setString(2, u.getPassword());
			pstmt.setString(3, u.getEmail());
			pstmt.setString(4, u.getAddress());
			pstmt.setString(5, u.getRole());
			pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(7, u.getUserId());
			
			int i=pstmt.executeUpdate();
			System.out.println(i);
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	// DELETE USER
	
	@Override
	public void deleteUser(int id) {
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement pstmt=connection.prepareStatement(DELETE_QUERY);
			
			pstmt.setInt(1, id);
			
			int result=pstmt.executeUpdate();
			 System.out.println("Row affected: " + result);			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	
	
//GET USER	
	@Override
	public User getUser(int id) {
		Connection connection=DBConnection.getConnection();
		User u= null;
		try {
			PreparedStatement pstmt=connection.prepareStatement(SELECT_QUERY);
			pstmt.setInt(1, id);
			
			ResultSet res=pstmt.executeQuery();
			
			while(res.next()) {
				u=getUserByResultSet(res);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	
//GET ALL USER 
	
	@Override
	public List<User> getAllUser() {
		
		List<User> list=new ArrayList<User>();
		Connection connection=DBConnection.getConnection();
		try {
			Statement stmt=connection.createStatement();
		
		ResultSet res=stmt.executeQuery(SELECT_QUERY_02);
		
		while(res.next()) {
			
			User u= getUserByResultSet(res);
			list.add(u);
		}
		
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public User getUserByEmail(String email) {

	    Connection connection = DBConnection.getConnection();

	    User user = null;

	    try {

	        PreparedStatement pstmt =
	                connection.prepareStatement(GET_USER_BY_EMAIL);

	        pstmt.setString(1, email);

	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {

	            user = getUserByResultSet(rs);

	        }

	    } catch (SQLException e) {

	        e.printStackTrace();

	    }

	    return user;
	}
	@Override
	public boolean emailExists(String email) {

	    Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt =
	                connection.prepareStatement(EMAIL_EXISTS);

	        pstmt.setString(1, email);

	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {

	            return rs.getInt(1) > 0;

	        }

	    } catch (SQLException e) {

	        e.printStackTrace();

	    }

	    return false;
	}
	@Override
	public void updateLastLogin(int userId) {

	    Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt =
	                connection.prepareStatement(UPDATE_LAST_LOGIN);

	        pstmt.setTimestamp(1,
	                new java.sql.Timestamp(System.currentTimeMillis()));

	        pstmt.setInt(2, userId);

	        pstmt.executeUpdate();

	    } catch (SQLException e) {

	        e.printStackTrace();

	    }
	}
	


	public void updateUserWithoutPassword(User u) {

	    String query = "UPDATE user SET userName=?, email=?, address=?, role=? WHERE userId=?";

	    Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt = connection.prepareStatement(query);

	        pstmt.setString(1, u.getUserName());
	        pstmt.setString(2, u.getEmail());
	        pstmt.setString(3, u.getAddress());
	        pstmt.setString(4, u.getRole());
	        pstmt.setInt(5, u.getUserId());

	        pstmt.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
private static User getUserByResultSet(ResultSet res) throws SQLException{
	int userdId=res.getInt("userId");
	String  userName=res.getString("userName");
	String  password=res.getString("password");
	String  address=res.getString("address");
	String  email=res.getString("email");
	String  role=res.getString("role");
	Timestamp createdDate=res.getTimestamp("createdDate");
	Timestamp lastLoginDate=res.getTimestamp("lastLoginDate");
	
	User u = new User(userdId, userName, password, email, address, role, createdDate,lastLoginDate);
	
	return u;
}
public List<User> getAllUsers() {
    return getAllUser();
}
}
	
