//package action;
//
//import com.opensymphony.xwork2.ActionSupport;
//import dao.UserDAO;
//import entities.User;
//import org.apache.struts2.ServletActionContext;
//
//import javax.servlet.http.HttpSession;
//
//public class LoginAction extends ActionSupport {
//
//    private String username;
//    private String password;
//
//    public String execute() {
//
//        User u = UserDAO.getInstance().findByUsername(username);
//
//        if (u == null || !password.equals(u.getPassword())) {
//            addActionError("Invalid credentials");
//            return INPUT;                   // back to login.jsp
//        }
//
//        HttpSession session = ServletActionContext.getRequest().getSession();
//        session.setAttribute("userId", u.getId());
//        session.setAttribute("role",   u.getRole());  // "ADMIN" or "REPORT"
//
//        return SUCCESS;                    // go to main page
//    }
//
//    /* getters / setters */
//    public String getUsername() { return username; }
//    public void   setUsername(String username) { this.username = username; }
//    public String getPassword() { return password; }
//    public void   setPassword(String password) { this.password = password; }
//}
 

package action;

import com.opensymphony.xwork2.ActionSupport;
import dao.UserDAO;
import entities.User;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

public class LoginAction extends ActionSupport {

    private String username;
    private String password;

        // fields injected into JSON automatically
    private boolean ok;
    private String  msg;

    public String execute() {
        User u = UserDAO.getInstance().findByUsername(username);
        if (u != null && password.equals(u.getPassword())) {
            ServletActionContext.getRequest().getSession()
                                .setAttribute("role", u.getRole());
            
            msg = u.getRole();
            ok = true;
            return SUCCESS;     // "success"
        }
        ok  = false;
        msg = "Bad credentials";
        return SUCCESS;         // still "success": always return JSON
    }

    /* getters */
    public boolean isOk() { return ok; }
    public String  getMsg() { return msg; }

    /* getters / setters */
    public String getUsername() { return username; }
    public void   setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void   setPassword(String password) { this.password = password; }
}