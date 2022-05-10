package maincontroller;

import dao.UserDAO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javatutorials.javamail.JavaMailUtil;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Owner
 */
public class LoginController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String AD = "AD";
    private static final String ADMIN_PAGE = "admin.jsp";
    private static final String US = "US";
    private static final String USER_PAGE = "HomeController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            UserDAO dao = new UserDAO();
            UserDTO loginUser = dao.checkLogin(email, password);
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            boolean check = googlerecaptcha.Googlerecaptcha.verify(gRecaptchaResponse);
            JavaMailUtil.sendMail(email);
            if (!check) {
                url = ERROR;
                request.setAttribute("ERROR_RECAPTCHA", "You must recaptcha");
            } else {
                if (loginUser != null) {
                    
                    String roleID = loginUser.getRoleID();
                    HttpSession session = request.getSession();
                    if (AD.equals(roleID)) {
                        session.setAttribute("LOGIN_USER", loginUser);
                        url = ADMIN_PAGE;
                    } else if (US.equals(roleID)) {
                        session.setAttribute("LOGIN_USER", loginUser);
                        url = USER_PAGE;
                    } else {
                        request.setAttribute("ERROR", "Your role is not support");
                    }
                } else {
                    request.setAttribute("ERROR", "Incorrect userID or password.");
                }
            }
            
           
        } catch (Exception e) {
            request.getRequestDispatcher(url).forward(request, response);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
