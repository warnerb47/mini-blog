package soapService.domaine;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="user")
public class User implements Serializable {

    private String name;
    private String login;
    private String password;
    private String _id;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getLogin() {
        return login;
    }
    public void setLogin(String login) {
        this.login = login;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String get_id() {
        return _id;
    }
    public void set_id(String _id) {
        this._id = _id;
    }
    public User(String name, String login, String password, String _id) {
        super();
        this.name = name;
        this.login = login;
        this.password = password;
        this._id = _id;
    }
    public User() {
        super();
    }

}
