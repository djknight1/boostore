package web.client;

import dao.impl.OrderDaoImpl;
import domain.Cart;
import domain.Order;
import domain.User;
import service.impl.BusinessServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class OrderServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            User user = (User) request.getSession().getAttribute("user");
            if (user == null) {
                request.setAttribute("message", "�Բ������ȵ�¼");
                request.getRequestDispatcher("/message.jsp").forward(request, response);
                return;
            }

            Cart cart = (Cart) request.getSession().getAttribute("cart");
            BusinessServiceImpl service = new BusinessServiceImpl();
            List<Order> userOrders = (new OrderDaoImpl()).getAllOrder(user.getId());

            Order orders = service.createOrder(cart, user);
            userOrders.add(orders);
            request.getSession().setAttribute("userOrders", userOrders);

            request.setAttribute("message", "����������");
            request.getSession().removeAttribute("cart");//��չ��ﳵ���������Լ�����ȥ�ģ���Ϊ�㹺����������չ��ﳵ��ǰ�˵���鿴���ﳵ�ֳ�����
            request.getRequestDispatcher("/client/clientlistorder.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "��������ʧ��");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }

}
