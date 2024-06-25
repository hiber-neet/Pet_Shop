/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.order;

import java.util.List;

/**
 *
 * @author nhutm
 */
public class OrderDTO {
    private String OrderID;
    private List<OrderDetailDTO> productsOrder;
    private int total;

    public OrderDTO() {
    }

    public OrderDTO(String OrderID, List<OrderDetailDTO> productsOrder, int total) {
        this.OrderID = OrderID;
        this.productsOrder = productsOrder;
        this.total = total;
    }

    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String OrderID) {
        this.OrderID = OrderID;
    }

    public List<OrderDetailDTO> getProductsOrder() {
        return productsOrder;
    }

    public void setProductsOrder(List<OrderDetailDTO> productsOrder) {
        this.productsOrder = productsOrder;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    

   
}
