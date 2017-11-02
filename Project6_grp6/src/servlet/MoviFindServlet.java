package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/find")
public class MoviFindServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task = request.getParameter("task");
		String path = "";
		if(task.equals("movieFind")) {
			path = "movie_Form.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String task = request.getParameter("task");
		String path = "";
		
		if(task.equals("postFindMovie")) {
			String keyword = request.getParameter("keyword");
			String year_start = request.getParameter("year_start");
			String year_end = request.getParameter("year_end");
			String genre_check = request.getParameter("genre_check");
			String national_check = request.getParameter("national_check");

			System.out.println("doPost ����  : " + keyword);
			System.out.println("doPost ����  : " + year_start);
			System.out.println("doPost ����  : " + year_end);
			System.out.println("doPost ����  : " + genre_check);
			System.out.println("doPost ����  : " + national_check);

			// ���̹����� �޾ƿ´�
			String clientId = "xIdeEHqkKNgob9uRf2QR";// ���ø����̼� Ŭ���̾�Ʈ ���̵�";
			String clientSecret = "tCC_GmXQDC";// ���ø����̼� Ŭ���̾�Ʈ ��ũ����";
			try {
				String text = URLEncoder.encode(keyword, "UTF-8");
				String apiURL = "";
				if(national_check.equals("NU")) {
					apiURL = "https://openapi.naver.com/v1/search/movie?query=" + text + "&yearfrom=" + year_start
							+ "&yearto=" + year_end +"&genre="+genre_check+"&display=30"; // json ���
				}else {
					apiURL = "https://openapi.naver.com/v1/search/movie?query=" + text + "&yearfrom=" + year_start
							+ "&yearto=" + year_end +"&genre="+genre_check+ "&country="+national_check+"&display=30"; // json ���
				}

				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("X-Naver-Client-Id", clientId);
				con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if (responseCode == 200) { // ���� ȣ��
					br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
				} else { // ���� �߻�
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				StringBuffer responseData = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					responseData.append(inputLine);
					System.out.println(inputLine);
				}
				br.close();
				response.setContentType("text/json;charset=utf-8");
				response.getWriter().print(responseData.toString());
				System.out.println(responseData.toString());
				return;
			} catch (Exception e) {
				System.out.println(e);
				e.printStackTrace();
			}
		} else if(task.equals("main")) {
			path = "index.jsp";
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		

	}
}
