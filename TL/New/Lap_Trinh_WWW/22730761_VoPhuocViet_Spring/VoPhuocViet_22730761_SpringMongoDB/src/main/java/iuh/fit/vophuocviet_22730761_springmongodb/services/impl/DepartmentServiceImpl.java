package iuh.fit.vophuocviet_22730761_springmongodb.services.impl;


import iuh.fit.vophuocviet_22730761_springmongodb.models.Department;
import iuh.fit.vophuocviet_22730761_springmongodb.repos.DepartmentRepository;
import iuh.fit.vophuocviet_22730761_springmongodb.services.DepartmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class DepartmentServiceImpl implements DepartmentService {
    private final DepartmentRepository departmentRepository;

    @Override
    public Department create(Department department) {
        if (departmentRepository.existsByDeptId(department.getDeptId())) {
            throw new IllegalArgumentException("Department already exists: " + department.getDeptId());
        }
        departmentRepository.save(department);
        return department;
    }

    @Override
    public List<Department> getAll() {
        return departmentRepository.findAll();
    }

    @Override
    public Optional<Department> getById(String id) {
        return Optional.ofNullable(departmentRepository.findByDeptId(id));
    }

    @Override
    public Department update(Department department) {
        if (!departmentRepository.existsByDeptId(department.getDeptId())) {
            throw new IllegalArgumentException("Department not found: " + department.getDeptId());
        }
        return departmentRepository.save(department);
    }

    @Override
    public void delete(String id) {
        departmentRepository.deleteById(id);
    }
}
