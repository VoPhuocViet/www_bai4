package iuh.fit.vophuocviet_22730761_springmongodb.repos.impl;


import iuh.fit.vophuocviet_22730761_springmongodb.dtos.*;
import iuh.fit.vophuocviet_22730761_springmongodb.models.Employee;
import iuh.fit.vophuocviet_22730761_springmongodb.repos.EmployeeAnalyticsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.stereotype.Repository;

import java.util.List;

import static org.springframework.data.mongodb.core.aggregation.Aggregation.*;

@Repository
@RequiredArgsConstructor
public class EmployeeAnalyticsRepositoryImpl implements EmployeeAnalyticsRepository {
    private final MongoTemplate mongoTemplate;
    @Override
    public List<AvgSalaryByDeptDTO> getEmployeeCountAndAvgSalaryByDepartment() {
        Aggregation agg = newAggregation(
                group("deptId")
                        .count().as("count")
                        .avg("salary").as("avgSalary"),
                project("count", "avgSalary")
                        .and("_id").as("deptId")
        );

        AggregationResults<AvgSalaryByDeptDTO> results =
                mongoTemplate.aggregate(agg, "employees", AvgSalaryByDeptDTO.class);
        return results.getMappedResults();
    }

    @Override
    public List<AvgSalaryByStatusDTO> getEmployeeCountAndAvgSalaryByStatus() {
        Aggregation agg = newAggregation(
                group("status")
                        .count().as("count")
                        .avg("salary").as("avgSalary"),
                project("count", "avgSalary")
                        .and("_id").as("status")
        );

        AggregationResults<AvgSalaryByStatusDTO> results =
                mongoTemplate.aggregate(agg, "employees", AvgSalaryByStatusDTO.class);
        return results.getMappedResults();
    }

    @Override
    public List<DepartmentWithEmployeesDTO> getEmployeesSortedBySalaryPerDepartment() {
        Aggregation agg = newAggregation(
                sort(Sort.by(Sort.Order.asc("deptId")).and(Sort.by(Sort.Order.asc("salary")))),
                group("deptId")
                        .push("$$ROOT").as("employees"),
                project("employees")
                        .and("_id").as("deptId")
        );

        AggregationResults<DepartmentWithEmployeesDTO> results =
                mongoTemplate.aggregate(agg, "employees", DepartmentWithEmployeesDTO.class);
        return results.getMappedResults();
    }


    @Override
    public List<Employee> findEmployeesWithMaxSalary() {
        Aggregation agg = newAggregation(
                group().max("salary").as("maxSalary"),
                lookup("employees", "maxSalary", "salary", "employees"),
                unwind("employees"),
                replaceRoot("employees")
        );

        AggregationResults<Employee> results =
                mongoTemplate.aggregate(agg, "employees", Employee.class);

        return results.getMappedResults();
    }

    @Override
    public List<Employee> findEmployeesWithMaxAge() {
        Aggregation agg = newAggregation(
                group().max("age").as("maxAge"),
                lookup("employees", "maxAge", "age", "employees"),
                unwind("employees"),
                replaceRoot("employees")
        );

        AggregationResults<Employee> results =
                mongoTemplate.aggregate(agg, "employees", Employee.class);

        return results.getMappedResults();
    }

}

