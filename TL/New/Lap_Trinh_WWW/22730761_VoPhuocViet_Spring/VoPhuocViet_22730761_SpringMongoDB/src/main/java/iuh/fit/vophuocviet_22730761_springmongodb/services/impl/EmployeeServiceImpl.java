package iuh.fit.vophuocviet_22730761_springmongodb.services.impl;


import iuh.fit.vophuocviet_22730761_springmongodb.dtos.AvgSalaryByDeptDTO;
import iuh.fit.vophuocviet_22730761_springmongodb.dtos.AvgSalaryByStatusDTO;
import iuh.fit.vophuocviet_22730761_springmongodb.dtos.DepartmentWithEmployeesDTO;
import iuh.fit.vophuocviet_22730761_springmongodb.models.Employee;
import iuh.fit.vophuocviet_22730761_springmongodb.repos.EmployeeAnalyticsRepository;
import iuh.fit.vophuocviet_22730761_springmongodb.repos.EmployeeRepository;
import iuh.fit.vophuocviet_22730761_springmongodb.services.EmployeeService;
import lombok.RequiredArgsConstructor;
import org.bson.Document;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class EmployeeServiceImpl implements EmployeeService {
    private final EmployeeRepository employeeRepository;
    private final EmployeeAnalyticsRepository employeeAnalyticsRepository;

    @Override
    public Employee create(Employee employee) {
        if (employeeRepository.existsById(employee.getEmpId())) {
            throw new IllegalArgumentException("Employee already exists: " + employee.getEmpId());
        }
        return employeeRepository.save(employee);
    }

    @Override
    public List<Employee> getAll() {
        return employeeRepository.findAll();
    }

    @Override
    public Optional<Employee> getById(String id) {
        return employeeRepository.findByEmpId(id);
    }

    @Override
    public Employee update(Employee employee) {
        if (!employeeRepository.existsById(employee.getEmpId())) {
            throw new IllegalArgumentException("Employee not found: " + employee.getEmpId());
        }
        return employeeRepository.save(employee);
    }

    @Override
    public void delete(String id) {
        employeeRepository.deleteById(id);
    }

    @Override
    public List<Employee> searchByName(String name) {
        return employeeRepository.findByEmpNameContainingIgnoreCase(name);
    }

    @Override
    public List<Employee> searchByAge(int age) {
        return employeeRepository.findByAge(age);
    }

    @Override
    public List<Employee> searchBySalary(double salary) {
        return employeeRepository.findBySalaryGreaterThanEqual(salary);
    }

    @Override
    public List<Employee> getEmployeesByDepartment(String deptId) {
        return employeeRepository.findByDeptId(deptId);
    }

    @Override
    public List<Employee> findEmployeesWithMaxSalary() {
        return employeeAnalyticsRepository.findEmployeesWithMaxSalary();

    }

    @Override
    public List<Employee> findEmployeesWithMaxAge() {
        return employeeAnalyticsRepository.findEmployeesWithMaxAge();
    }

    @Override
    public List<AvgSalaryByDeptDTO> getEmployeeCountAndAvgSalaryByDepartment() {
        return employeeAnalyticsRepository.getEmployeeCountAndAvgSalaryByDepartment();
    }

    @Override
    public List<AvgSalaryByStatusDTO> getEmployeeCountAndAvgSalaryByStatus() {
        return employeeAnalyticsRepository.getEmployeeCountAndAvgSalaryByStatus();
    }

    @Override
    public List<DepartmentWithEmployeesDTO> getEmployeesSortedBySalaryPerDepartment() {
        return employeeAnalyticsRepository.getEmployeesSortedBySalaryPerDepartment();
    }
}
