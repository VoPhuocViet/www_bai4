package iuh.fit.vophuocviet_22730761_springmongodb.repos;


import iuh.fit.vophuocviet_22730761_springmongodb.models.Employee;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface EmployeeRepository extends MongoRepository<Employee, String> {

    List<Employee> findByEmpNameContainingIgnoreCase(String name);

    List<Employee> findByAge(int age);

    List<Employee> findBySalaryGreaterThanEqual(double salary);

    List<Employee> findByDeptId(String deptId);

    Optional<Employee> findByEmpId(String id);
}
