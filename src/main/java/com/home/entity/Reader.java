package com.home.entity;

import java.io.Serializable;

//读者信息
public class Reader implements Serializable {
    private Integer id;//编号
    private Integer reader_id;//登陆名/读者id
    private String reader_name;//姓名
    private Integer password;//默认密码
    private String sex;//性别
    private String birthday;// 出生年月
    private String address;//地址
    private String telephone;//电话
    private Integer card_state;//读者等级/可借阅书籍


    public Integer getReader_id() {
        return reader_id;
    }

    public void setReader_id(Integer reader_id) {
        this.reader_id = reader_id;
    }

    public String getReader_name() {
        return reader_name;
    }

    public void setReader_name(String reader_name) {
        this.reader_name = reader_name;
    }

    public Integer getPassword() {
        return password;
    }

    public void setPassword(Integer password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Integer getCard_state() {
        return card_state;
    }

    public void setCard_state(Integer card_state) {
        this.card_state = card_state;
    }

    @Override
    public String toString() {
        return "Reader{" +
                "id=" + id +
                ", reader_id=" + reader_id +
                ", reader_name='" + reader_name + '\'' +
                ", password=" + password +
                ", sex='" + sex + '\'' +
                ", birthday='" + birthday + '\'' +
                ", address='" + address + '\'' +
                ", telephone='" + telephone + '\'' +
                ", card_state=" + card_state +
                '}';
    }
}
