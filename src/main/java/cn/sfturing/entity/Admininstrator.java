package cn.sfturing.entity;

/**
 * @author eRunn
 * @create 2019-03-13 1:22
 */
public class Admininstrator {
    private int id;
    private String userName;
    private String password;
    /**
     * 0为超管，1为医生
     */
    private int  role;

    public Admininstrator(int id, String userName, String password) {
        this.id = id;
        this.userName = userName;
        this.password = password;
    }

    public Admininstrator() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
}
