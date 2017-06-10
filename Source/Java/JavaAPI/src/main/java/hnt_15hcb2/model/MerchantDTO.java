package hnt_15hcb2.model;

import java.io.Serializable;

public class MerchantDTO implements Serializable {
    private String MerchantID;
    private String MerchantName;
    private String Address;
    private String Phone;
    private String Email;
    private boolean Status;
    private String MerchantTypeID;
    private String MerchantTypeName;
    private String MerchantRegionID;
    private String MerchantRegionName;
    private String AgentID;
    private String AgentName;

    public MerchantDTO() {

    }

    public String getMerchantID() {
        return MerchantID;
    }

    public void setMerchantID(String merchantID) {
        MerchantID = merchantID;
    }

    public String getMerchantName() {
        return MerchantName;
    }

    public void setMerchantName(String merchantName) {
        MerchantName = merchantName;
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

    public String getMerchantTypeID() {
        return MerchantTypeID;
    }

    public void setMerchantTypeID(String merchantTypeID) {
        MerchantTypeID = merchantTypeID;
    }

    public String getMerchantTypeName() {
        return MerchantTypeName;
    }

    public void setMerchantTypeName(String merchantTypeName) {
        MerchantTypeName = merchantTypeName;
    }

    public String getMerchantRegionID() {
        return MerchantRegionID;
    }

    public void setMerchantRegionID(String merchantRegionID) {
        MerchantRegionID = merchantRegionID;
    }

    public String getMerchantRegionName() {
        return MerchantRegionName;
    }

    public void setMerchantRegionName(String merchantRegionName) {
        MerchantRegionName = merchantRegionName;
    }

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
}
