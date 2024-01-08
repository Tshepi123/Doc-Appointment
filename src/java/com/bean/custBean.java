package com.bean;

public class custBean {
    private int id;
    private String name;
    private String surname;
    private String middleName;
    private String birthDate;
    private String tel;
    private String address;
    private String email;
    private String password;
    
    
    public custBean() {
        super();
    }
    
    public custBean(String name, String surname, String middleName, String birthDate, String tel, String address, String email, String password) {
        super();
        this.name = name;
        this.surname = surname;
        this.middleName = middleName;
        this.birthDate = birthDate;
        this.tel = tel;
        this.address = address;
        this.email = email;
        this.password = password;
        
    }
    
    // Getters and Setters (shortcut select above and press ctrl + shift + alt + e)

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

