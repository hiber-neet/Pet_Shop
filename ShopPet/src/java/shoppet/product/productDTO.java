/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.product;

import java.io.Serializable;

/**
 *
 * @author nhutm
 */
public class productDTO implements Serializable{
    private String id;
    private String Name;
    private String type;
    private String img;
    private float size;
    private int price;
    private int quantity;
    private String category;

    public productDTO() {
    }

    public productDTO(String id, String Name, String type, String img, float size, int price, int quantity, String category) {
        this.id = id;
        this.Name = Name;
        this.type = type;
        this.img = img;
        this.size = size;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public float getSize() {
        return size;
    }

    public void setSize(float size) {
        this.size = size;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "productDTO{" + "id=" + id + ", Name=" + Name + ", type=" + type + ", img=" + img + ", size=" + size + ", price=" + price + ", quantity=" + quantity + ", category=" + category + '}';
    }

   
}
