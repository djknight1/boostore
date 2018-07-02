package utils;


import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class JdbcUtils {

    private static DataSource ds;

    /* 静态块 读取c3p0默认配置文件 */
    static {
        ds = new ComboPooledDataSource();
    }

    /* 获得数据源 即获得连接池 */
    public static DataSource getDataSource() {
        return ds;
    }

    /* 取得连接 */
    public static Connection getConnection() throws SQLException {
        return ds.getConnection();
    }
}
