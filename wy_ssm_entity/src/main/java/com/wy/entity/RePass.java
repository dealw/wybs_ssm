package com.wy.entity;

import java.io.Serializable;

public class RePass implements Serializable {
    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    private String oldpass;
    private String newpass;
    private String confirmpass;
    private String realpass;

    public String getRealpass() {
        return realpass;
    }

    public void setRealpass(String realpass) {
        this.realpass = realpass;
    }

    public String getOldpass() {
        return oldpass;
    }

    public void setOldpass(String oldpass) {
        this.oldpass = oldpass;
    }

    public String getNewpass() {
        return newpass;
    }

    public void setNewpass(String newpass) {
        this.newpass = newpass;
    }

    public String getConfirmpass() {
        return confirmpass;
    }

    public void setConfirmpass(String confirmpass) {
        this.confirmpass = confirmpass;
    }
}
