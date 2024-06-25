/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.order;

/**
 *
 * @author nhutm
 */
public class OrderDetailDTO {
    private String NameProduct;
    private int Quantity;
    private int totalPrice;
    private String IDProduct;
    public OrderDetailDTO() {
    }

    public OrderDetailDTO(String NameProduct, int Quantity, int totalPrice, String IDProduct) {
        this.NameProduct = NameProduct;
        this.Quantity = Quantity;
        this.totalPrice = totalPrice;
        this.IDProduct = IDProduct;
    }

    public String getNameProduct() {
        return NameProduct;
    }

    public void setNameProduct(String NameProduct) {
        this.NameProduct = NameProduct;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getIDProduct() {
        return IDProduct;
    }

    public void setIDProduct(String IDProduct) {
        this.IDProduct = IDProduct;
    }

  
    
}
