package iuh.fit.vophuocviet_22730761_springmongodb.repos;



import iuh.fit.vophuocviet_22730761_springmongodb.models.Department;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DepartmentRepository extends MongoRepository<Department, String> {
    Department findByDeptId(String deptId);

    boolean existsByDeptId(String deptId);
}