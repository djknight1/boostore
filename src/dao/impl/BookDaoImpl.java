package dao.impl;

import dao.BookDao;
import domain.Book;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.JdbcUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class BookDaoImpl implements BookDao {


    /* (non-Javadoc)
     * @see dao.impl.BookDao#add(domain.Book)
     */
    public void add(Book book) {
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "insert into book(id,name,author,price,image,description,category_id) values(?,?,?,?,?,?,?)";
            Object params[] = {book.getId(), book.getName(), book.getAuthor(), book.getPrice(), book.getImage(), book.getDescription(), book.getCategory_id()};
            runner.update(sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /* (non-Javadoc)
     * @see dao.impl.BookDao#find(java.lang.String)
     */
    public Book find(String id) {
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from book where id=?";
            /* new BeanHandler把我们查询到的数据封装到想要的地方 */
            /* 这里的query加划线说明这个多个参数的query方法已过时 */
            Book book = runner.query(sql, id, new BeanHandler<Book>(Book.class));
            return book;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public List<Book> getPageData(int startindex, int pagesize) {
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from book limit ?,?";
            Object params[] = {startindex, pagesize};
            List<Book> list = runner.query(sql, params, new BeanListHandler<Book>(Book.class));
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Book> getAllBook() {
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select * from book";
        try {
            List<Book> list = runner.query(sql,new BeanListHandler<Book>(Book.class));
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            /* 什么意思？？？TODO */
            throw new RuntimeException(e);
        }
    }

    public int getTotalRecord() {
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select count(*) from book";
            /* ScalarHandler是把单个值封装 */
            long totalrecord = (Long) runner.query(sql, new ScalarHandler());
            System.out.println(totalrecord+"total");
            return (int) totalrecord;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /* (non-Javadoc)
     * @see dao.impl.BookDao#getAll()
     */
    public List<Book> getPageData(int startindex, int pagesize, String category_id) {
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from book where category_id=? limit ?,?";
            Object params[] = {category_id, startindex, pagesize};
            return (List<Book>) runner.query(sql, params, new BeanListHandler(Book.class));
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public int getTotalRecord(String category_id) {
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select count(*) from book where category_id=?";
            long totalrecord = (Long) runner.query(sql, category_id, new ScalarHandler());
            return (int) totalrecord;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public List<Book> getBookByCategory(String category_id) {
            try {
                QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
                String sql = "select * from book where category_id=?";
                List<Book> list = runner.query(sql,category_id ,new BeanListHandler<Book>(Book.class));
                return list;
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException(e);
            }
    }

}
