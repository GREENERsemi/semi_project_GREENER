package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class NicknameCheckServlet
 */
@WebServlet("/nicknameCheck.me")
public class NicknameCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NicknameCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userNickname = request.getParameter("userNickname");
		
		System.out.println("userNickname = " + userNickname);
		
		int result = new MemberService().checkNickname(userNickname);
		
		response.setCharacterEncoding("UTF-8");
		if(result > 0) {
			response.getWriter().print("이미 존재하는 닉네임입니다");
		} else {
			response.getWriter().print("사용 가능한 닉네임입니다");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}