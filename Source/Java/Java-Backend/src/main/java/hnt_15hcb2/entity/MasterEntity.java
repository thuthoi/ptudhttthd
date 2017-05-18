package hnt_15hcb2.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;

/**
 * Created by htnha on 18/05/2017.
 */
@Entity
@Table(name = "Master")
public class MasterEntity {

    @NotNull
    @Size(max = 10)
    @Column(name = "MasterID", nullable = false)
    private String MasterID;

    @Size(max = 255)
    @Column(name = "MasterName")
    private String MasterName;

    @Size(max = 255)
    @Column(name = "Phone")
    private String Phone;

    @Size(max = 255)
    @Column(name = "Email")
    private String Email;

    @Column(name = "Status")
    private boolean Status;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "masterEntity")
    private Set<AgentEntity> agentEntity;

    public String getMasterID() {
        return MasterID;
    }

    public void setMasterID(String masterID) {
        MasterID = masterID;
    }

    public String getMasterName() {
        return MasterName;
    }

    public void setMasterName(String masterName) {
        MasterName = masterName;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean status) {
        Status = status;
    }

    public Set<AgentEntity> getAgentEntity() {
        return agentEntity;
    }

    public void setAgentEntity(Set<AgentEntity> agentEntity) {
        this.agentEntity = agentEntity;
    }
}
