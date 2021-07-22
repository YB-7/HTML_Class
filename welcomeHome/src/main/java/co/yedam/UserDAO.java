package co.yedam;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends DAO {
	public List<UserVO> getUsers() {
		connect();
		List<UserVO> userList = new ArrayList<>();
		try {
			psmt = conn.prepareStatement("select * from users");
			rs = psmt.executeQuery();
			while (rs.next()) {
				UserVO vo = new UserVO();
				vo.setUserName(rs.getString("user_name"));
				vo.setUserId(rs.getString("user_id"));
				vo.setUserPw(rs.getString("user_pw"));
				vo.setUserGen(rs.getString("user_gen"));
				vo.setUserHobby(rs.getString("user_hobby"));
				vo.setUserBirth(rs.getString("user_birth"));
				
				userList.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userList;
	}

	public void insertUser(UserVO vo) {
		// 사용자 입력값을 오라클DB에서 입력, 처리
		connect(); // 자식이니까 그대로 상속받아서 사용가능
		String sql = "insert into users(user_id,user_pw,user_name,user_gen,user_hobby,user_birth)"
				+ " values(?,?,?,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUserId());
			psmt.setString(2, vo.getUserPw());
			psmt.setString(3, vo.getUserName());
			psmt.setString(4, vo.getUserGen());
			psmt.setString(5, vo.getUserHobby());
			psmt.setString(6, vo.getUserBirth());
			int r = psmt.executeUpdate(); // 쿼리를 실행
			System.out.println(r + "건 입력");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
