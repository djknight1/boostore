package domain;

public class CartItem {
	private Book book;
	private int quantity;
	private double price;
	private double CartItemID;
	private double CartId;   //购物车外键



	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return this.book.getPrice()*this.quantity;
	}
	public void setPrice(double price) {
		this.price = price;
	}

	public double getCartId() {
		return CartId;
	}

	public void setCartId(double cartId) {
		CartId = cartId;
	}

	public double getCartItemID() {
		return CartItemID;
	}

	public void setCartItemID(double cartItemID) {
		CartItemID = cartItemID;
	}
}
