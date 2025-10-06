package iuh.fit.vophuocviet_22730761_springmongodb.repos;


import iuh.fit.vophuocviet_22730761_springmongodb.dtos.AvgSalaryByDeptDTO;
import iuh.fit.vophuocviet_22730761_springmongodb.dtos.AvgSalaryByStatusDTO;
import iuh.fit.vophuocviet_22730761_springmongodb.dtos.DepartmentWithEmployeesDTO;
import iuh.fit.vophuocviet_22730761_springmongodb.models.Employee;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeAnalyticsRepository {
    List<iuh.fit.vophuocviet_22730761_springmongodb.dtos.AvgSalaryByDeptDTO> getEmployeeCountAndAvgSalaryByDepartment();

    List<AvgSalaryByStatusDTO> getEmployeeCountAndAvgSalaryByStatus();

    List<DepartmentWithEmployeesDTO> getEmployeesSortedBySalaryPerDepartment();

    List<Employee> findEmployeesWithMaxSalary();

    List<Employee> findEmployeesWithMaxAge();
}

