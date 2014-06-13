/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sql.tables;

import java.io.Serializable;

/**
 *
 * @author User
 */
public class Products implements Serializable{
    
    Long productid;
    String title;
    String description;
    String price;
    
    public Products(String title_, String desc_, String price_){
        this.title=title_; 
        this.description=desc_;
        this.price=price_;
    }

    public Long getProductid() {
        return productid;
    }

    public String getTitle() {
        return title; 
    }

    public void setProductid(Long productid) {
        this.productid = productid;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public String getPrice() {
        return price;
    }
}
