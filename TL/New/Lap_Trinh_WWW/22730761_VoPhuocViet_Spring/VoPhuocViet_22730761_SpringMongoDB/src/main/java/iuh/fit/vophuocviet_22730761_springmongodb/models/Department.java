package iuh.fit.vophuocviet_22730761_springmongodb.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "departments")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Department {

    @Id
    @JsonIgnore
    private String id;

    private String deptId;
    private String deptName;

}