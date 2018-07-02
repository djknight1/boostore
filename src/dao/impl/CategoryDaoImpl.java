package dao.impl;

import dao.CategoryDao;
import domain.Category;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.JdbcUtils;

import java.sql.SQLException;
import java.util.List;

public class CategoryDaoImpl implements CategoryDao {

    /* (non-Javadoc)
     * @see dao.impl.CategoryDao#add(domain.Category)
     */
    @Override
    public void add(Category category) {
        try {
            /* 添加分类 */
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "insert into category(id,name,description) values(?,?,?)";
            Object params[] = {category.getId(), category.getName(), category.getDescription()};
            runner.update(sql, params);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /* (non-Javadoc)
     * @see dao.impl.CategoryDao#find(java.lang.String)
     */
    @Override
    /* 找到具体id的分类 */
    public Category find(String id) {
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from category where id=?";
            Category category = runner.query(sql, id, new BeanHandler<Category>(Category.class));
            return category;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /* (non-Javadoc)
     * @see dao.impl.CategoryDao#getAll()
     */
    @Override
    /* 找到所有的分类 */
    public List<Category> getAll() {
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from category";
            List<Category> category = runner.query(sql, new BeanListHandler<Category>(Category.class));
            return category;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

}
