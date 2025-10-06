package iuh.fit.vophuocviet_22730761_springmongodb.services;



import iuh.fit.vophuocviet_22730761_springmongodb.models.Department;

import java.util.List;
import java.util.Optional;

public interface DepartmentService {
    Department create(Department department);

    List<Department> getAll();

    Optional<Department> getById(String id);

    Department update(Department department);

    void delete(String id);
}
