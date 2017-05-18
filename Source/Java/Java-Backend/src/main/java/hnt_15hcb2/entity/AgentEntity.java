package hnt_15hcb2.entity;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Table(name = "Agent")
public class AgentEntity {

    @NotNull
    @Size(max = 10)
    @Column(name = "AgentID")
    private String AgentID;

    @Size(max = 255)
    @Column(name = "AgentName")
    private String AgentName;

    @Size(max = 255)
    @Column(name = "Address")
    private String Address;

    @Size(max = 255)
    @Column(name = "Phone")
    private String Phone;

    @Size(max = 255)
    @Column(name = "Email")
    private String Email;

    @Column(name = "Status")
    private boolean Status;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "MasterID")
    private MasterEntity masterEntity;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "agentEntity")
    private Set<MerchantEntity> merchantEntity;

    public String getAgentID() {
        return AgentID;
    }

    public void setAgentID(String agentID) {
        AgentID = agentID;
    }

    public String getAgentName() {
        return AgentName;
    }

    public void setAgentName(String agentName) {
        AgentName = agentName;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
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

    public MasterEntity getMasterEntity() {
        return masterEntity;
    }

    public void setMasterEntity(MasterEntity masterEntity) {
        this.masterEntity = masterEntity;
    }

    public Set<MerchantEntity> getMerchantEntity() {
        return merchantEntity;
    }

    public void setMerchantEntity(Set<MerchantEntity> merchantEntity) {
        this.merchantEntity = merchantEntity;
    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        AgentEntity agentEntity = (AgentEntity) obj;
        if (this.AgentName.trim().equals(agentEntity.getAgentName()))
            return true;
        return false;
    }

    @Override
    public String toString() {
        return this.AgentName;
    }
}