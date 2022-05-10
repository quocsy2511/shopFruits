/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;


/**
 *
 * @author Owner
 */


public class OrderDTO {
    private int orderID;
    private String orderDate;
    private double total;
    private String email;

    public OrderDTO() {
        this.orderID = 0;
        this.orderDate = "";
        this.total = 0;
        this.email = "";
    }

    public OrderDTO(int orderID, String orderDate, double total, String email) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.total = total;
        this.email = email;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    
}
