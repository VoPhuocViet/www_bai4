package iuh.fit.vophuocviet_22730761_springmongodb.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmployeeSalaryByDeptDTO {
    private String deptId;
    private String empId;
    private String empName;
    private double salary;
}