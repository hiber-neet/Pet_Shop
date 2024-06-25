/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppet.registration;

/**
 *
 * @author nhutm
 */
public class registrationDTO {
    private String Email;
    private String Fullname;
    private String Phone;
    private String Address;

    public registrationDTO() {
    }

    public registrationDTO(String Email, String Fullname, String Phone, String Address) {
        this.Email = Email;
        this.Fullname = Fullname;
        this.Phone = Phone;
        this.Address = Address;
    }
    
    
    
    
    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getFullname() {
        return Fullname;
    }

    public void setFullname(String Fullname) {
        this.Fullname = Fullname;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }
    
}
