package beans;

import java.io.Serializable;

public class Product implements Serializable {
    private int id;
    private double price;
    private int quantity;
    private String imgURL;
    private String title;

    public Product(int id, double price, int quantity, String imgURL, String title) {
        this.id = id;
        this.price = price;
        this.quantity = quantity;
        this.imgURL = imgURL;
        this.title = title;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }
}
