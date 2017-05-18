package hnt_15hcb2.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "Parameter")
public class ParameterEntity {

    @NotNull
    @Size(max = 10)
    @Column(name = "ParaID", nullable = false)
    private String ParaID;

    @Size(max = 255)
    @Column(name = "Name")
    private String Name;

    @Size(max = 255)
    @Column(name = "Value")
    private String Value;

    @Size(max = 255)
    @Column(name = "Type")
    private String Type;

    @Column(name = "Status")
    private boolean Status;

    public String getParaID() {
        return ParaID;
    }

    public void setParaID(String paraID) {
        ParaID = paraID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getValue() {
        return Value;
    }

    public void setValue(String value) {
        Value = value;
    }

    public String getType() {
        return Type;
    }

    public void setType(String type) {
        Type = type;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean status) {
        Status = status;
    }
}
