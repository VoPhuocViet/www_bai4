package iuh.fit.vophuocviet_22730761_springmongodb.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DepartmentWithEmployeesDTO {
    private String deptId;
    private List<EmployeeSalaryByDeptDTO> employees;
}