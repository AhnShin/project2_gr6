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

			System.out.println("doPost 실행  : " + keyword);
			System.out.println("doPost 실행  : " + year_start);
			System.out.println("doPost 실행  : " + year_end);
			System.out.println("doPost 실행  : " + genre_check);
			System.out.println("doPost 실행  : " + national_check);

			// 네이버에서 받아온다
			String clientId = "xIdeEHqkKNgob9uRf2QR";// 애플리케이션 클라이언트 아이디값";
			String clientSecret = "tCC_GmXQDC";// 애플리케이션 클라이언트 시크릿값";
			try {
				String text = URLEncoder.encode(keyword, "UTF-8");
				String apiURL = "";
				if(national_check.equals("NU")) {
					apiURL = "https://openapi.naver.com/v1/search/movie?query=" + text + "&yearfrom=" + year_start
							+ "&yearto=" + year_end +"&genre="+genre_check+"&display=30"; // json 결과
				}else {
					apiURL = "https://openapi.naver.com/v1/search/movie?query=" + text + "&yearfrom=" + year_start
							+ "&yearto=" + year_end +"&genre="+genre_check+ "&country="+national_check+"&display=30"; // json 결과
				}

				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("X-Naver-Client-Id", clientId);
				con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if (responseCode == 200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
				} else { // 에러 발생
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
