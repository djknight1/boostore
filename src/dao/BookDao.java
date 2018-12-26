package dao;

import domain.Book;
import java.util.List;


public interface BookDao {

	void add(Book book);

	Book find(String id);
	
	public List<Book> getPageData(int startindex, int pagesize);
	public List<Book> getAllBook();

	public int getTotalRecord();

	public List<Book> getPageData(int startindex, int pagesize, String category_id);
	
	public int getTotalRecord(String category_id);
	public List<Book> getBookByCategory(String category_id);

}