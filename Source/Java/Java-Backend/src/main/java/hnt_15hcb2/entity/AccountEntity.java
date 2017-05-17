package hnt_15hcb2.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * Created by htnha on 17/05/2017.
 */
@Entity
@Table(name = "Account")
public class AccountEntity {

    @NotNull
    @Size(max = 10)
    @Column(name = "UserID", nullable = false)
    private String UserID;

    @NotNull
    @Size(max = 255)
    @Column(name = "Username", nullable = false)
    private String Username;

    @NotNull
    @Size(max = 255)
    @Column(name = "Password", nullable = false)
    private String Password;

    @NotNull
    @Size(max = 255)
    @Column(name = "Role")
    private String Role;

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String userID) {
        UserID = userID;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getRole() {
        return Role;
    }

    public void setRole(String role) {
        Role = role;
    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        AccountEntity userEntity = (AccountEntity) obj;
        if (this.Username.trim().equals(userEntity.getUsername()))
            return true;
        return false;
    }

    @Override
    public String toString() {
        return this.Username;
    }
}