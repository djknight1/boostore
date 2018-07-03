package dao.impl;

import dao.OrderDao;
import domain.Book;
import domain.Order;
import domain.OrderItem;
import domain.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.JdbcUtils;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

/*
 	create table orders
	(
		id varchar(40) primary key,
		ordertime datetime not null,
		price double not null,
		state boolean,
		user_id varchar(40),
		constraint user_id_FK foreign key(user_id) references user(id)
	);
	
	create table orderitem
	(
		id varchar(40) primary key,
		quantity int,
		price double,
		order_id varchar(40),
		book_id varchar(40),
		constraint order_id_FK foreign key(order_id) references orders(id),
		constraint book_id_FK foreign key(book_id) references book(id)
	);
 */
public class OrderDaoImpl implements OrderDao {

    /* (non-Javadoc)
     * @see dao.impl.OrderDao#add(domain.Order)
     */
    public void add(Order order) {
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            //1. ��order�Ļ�����Ϣ���浽order��
            String sql = "insert into orders(orderId,ordertime,price,state,userid) values(?,?,?,?,?)";
            Object params[] = {order.getId(), order.getOrdertime(), order.getPrice(), order.isState(), order.getUser().getId()};
            runner.update(sql, params);
            //2. ��order�еĶ�����浽orderitem����
            Set<OrderItem> set = order.getOrderitems();
            for (OrderItem item : set) {
                sql = "insert into orderitem(orderItemId,quantity,price,orderId,bookId) values(?,?,?,?,?)";
                params = new Object[]{item.getId(), item.getQuantity(), item.getPrice(), order.getId(), item.getBook().getId()};
                runner.update(sql, params);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    /* (non-Javadoc)
     * @see dao.impl.OrderDao#find(java.lang.String)
     */
    public Order find(String id) {
        try {

            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            //1.�ҳ������Ļ�����Ϣ
            String sql = "select * from orders where orderId=?";
            Order order = (Order) runner.query(sql, id, new BeanHandler(Order.class));

            List<Object[]> result = runner.query(sql, id, new ArrayListHandler());
            String orderId = Arrays.toString(result.get(0));

            orderId = orderId.substring(1).split(",")[0];

            order.setId(orderId);
            System.out.println(orderId);
            System.out.println(id);

            //2.�ҳ����������еĶ�����

            sql = "select * from orderItem where orderId=?";
            List<OrderItem> list = runner.query(sql, id, new BeanListHandler<OrderItem>(OrderItem.class));

            List<Object[]> itemlist = runner.query(sql, id, new ArrayListHandler());
            String orderItemId = "";
            for (int i =0; i <itemlist.size();i++) {
                orderItemId = Arrays.toString(itemlist.get(i));
                orderItemId = orderItemId.substring(1).split(",")[0];
                list.get(i).setId(orderItemId);
            }

            for (OrderItem item : list) {
                /* �����˼�Ǵ�orderitem��book�������������� ��һ��������orderitem��id������Ҫ��ѯ��id �ڶ��������� */
                System.out.println(item.getPrice());

                sql = "select book.* from orderItem,book where orderItem.orderItemId=? and orderItem.bookId=book.id";
                Book book = (Book) runner.query(sql, item.getId(), new BeanHandler(Book.class));
                item.setBook(book);
            }

            //���ҳ��Ķ�����Ž�order
            order.getOrderitems().addAll(list);
            //3.�ҳ����������ĸ��û�
            sql = "select * from orders,user where orders.orderId=? and orders.userid=User.id";
            User user = (User) runner.query(sql, order.getId(), new BeanHandler(User.class));
            order.setUser(user);
            return order;

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /* (non-Javadoc)
     * @see dao.impl.OrderDao#getAll(boolean)
     */
    //��̨��ȡ���ж���
    public List<Order> getAll(boolean state) {
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from orders where state=?";
            List<Order> list = (List<Order>) runner.query(sql, state, new BeanListHandler(Order.class));

            List<Object[]> orders = runner.query(sql, state, new ArrayListHandler());
            String orderItemId = "";
            for (int i =0; i <orders.size();i++) {
                orderItemId = Arrays.toString(orders.get(i));
                orderItemId = orderItemId.substring(1).split(",")[0];
                list.get(i).setId(orderItemId);
            }


            for (Order order : list) {
                //�ҳ���ǰ���������ĸ��û�
                sql = "select user.* from orders,user where orderId=? and orders.userid=user.id";
                User user = (User) runner.query(sql, order.getId(), new BeanHandler(User.class));
                order.setUser(user);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    //ǰ��ҳ���л�ȡĳ���û������ж���
    public List<Order> getAll(boolean state, String userid) {
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from orders where state=? and orders.user_id=?";
            Object params[] = {state, userid};
            List<Order> list = (List<Order>) runner.query(sql, params, new BeanListHandler(Order.class));
            //�����и�user�ӵ�list��
            for (Order order : list) {
                sql = "select * from user where user.id=?";
                User user = (User) runner.query(sql, userid, new BeanHandler(User.class));
                order.setUser(user);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public List<Order> getAllOrder(String userid) {
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from orders where userid=?";
            String sql1 = "select * from orders where userid=?";
            List<Order> list = runner.query(sql, userid, new BeanListHandler<Order>(Order.class));
            List<Object[]> result = runner.query(sql1, userid, new ArrayListHandler());

            for (int i = 0; i< result.size();i++) {
                String str = Arrays.toString(result.get(i));
                /* TODO:�����Ϊʲô�������bug����ֱ��list.get(i).getId()�����NULL������ */
                str = str.substring(1).split(",")[0];
                list.get(i).setId(str);
            }


            for (Order order : list) {
                sql = "select * from user where id=?";
                User user = (User) runner.query(sql, userid, new BeanHandler<User>(User.class));
                order.setUser(user);
            }

            return list;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /* (non-Javadoc)
     * @see dao.impl.OrderDao#update(domain.Order)
     */
    public void update(Order order) {//����ֻ�ı䷢��״̬��ʵ���л����Ըı乺��������������Ϣ������������
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "update orders set state=? where orderId=?";
            Object params[] = {order.isState(), order.getId()};
            runner.update(sql, params);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
