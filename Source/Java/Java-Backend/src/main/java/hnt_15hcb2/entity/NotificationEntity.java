package hnt_15hcb2.entity;

import org.hibernate.annotations.Type;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "Notification")
public class NotificationEntity {

    @NotNull
    @Size(max = 10)
    @Column(name = "NotiID", nullable = false)
    private String NotiID;

    @Size(max = 255)
    @Column(name = "Detail")
    private String Detail;

    @Size(max = 255)
    @Column(name = "Summary")
    private String Summary;

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "Date")
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    private String Date;

    @Size(max = 10)
    @Column(name = "SenderID")
    private String SenderID;

    @Size(max = 10)
    @Column(name = "ReceiverID")
    private String ReceiverID;

    @Column(name = "Status")
    private boolean Status;

    public String getNotiID() {
        return NotiID;
    }

    public void setNotiID(String notiID) {
        NotiID = notiID;
    }

    public String getDetail() {
        return Detail;
    }

    public void setDetail(String detail) {
        Detail = detail;
    }

    public String getSummary() {
        return Summary;
    }

    public void setSummary(String summary) {
        Summary = summary;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String date) {
        Date = date;
    }

    public String getSenderID() {
        return SenderID;
    }

    public void setSenderID(String senderID) {
        SenderID = senderID;
    }

    public String getReceiverID() {
        return ReceiverID;
    }

    public void setReceiverID(String receiverID) {
        ReceiverID = receiverID;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean status) {
        Status = status;
    }
}
