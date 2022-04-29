
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class TestJndi
 */
@WebServlet("/TestJndi")
public class TestJndi extends HttpServlet {

	private static DataSource ds;
	private static Connection con;

	private static final String GET_ALL_STMT = "SELECT * FROM CATINFO";

	static {
		try {
			Context ctx = new javax.naming.InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/jndi");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestJndi() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");

		try (PreparedStatement pstmt = con.prepareStatement(GET_ALL_STMT); ResultSet rs = pstmt.executeQuery();) {
			while(rs.next()) {
				PrintWriter out = response.getWriter();
				System.out.println(rs.getString("shelterName"));
				out.println(rs.getString("shelterName"));
//				out.print(rs.getInt("shelterName"));
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
