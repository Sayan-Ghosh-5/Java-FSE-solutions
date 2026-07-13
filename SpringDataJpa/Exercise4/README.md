# Exercise 4: Difference between JPA, Hibernate, and Spring Data JPA

## Conceptual Differences
- **Java Persistence API (JPA)**: A JSR 338 specification for persisting, reading, and managing data between Java objects and relational databases. It defines the standard interfaces and annotations but does not contain a concrete implementation.
- **Hibernate**: A popular Object-Relational Mapping (ORM) tool that provides a concrete implementation of the JPA specification.
- **Spring Data JPA**: A library that provides a high-level abstraction layer on top of a JPA provider (such as Hibernate). It significantly reduces boilerplate code by dynamically generating database queries from repository interfaces and automatically handling transactions.

## Code Comparison

### Hibernate (Low-Level Session Management)
```java
public Integer addEmployee(Employee employee){
  Session session = factory.openSession();
  Transaction tx = null;
  Integer employeeID = null;
  try {
    tx = session.beginTransaction();
    employeeID = (Integer) session.save(employee);
    tx.commit();
  } catch (HibernateException e) {
    if (tx != null) tx.rollback();
    e.printStackTrace();
  } finally {
    session.close();
  }
  return employeeID;
}
```

### Spring Data JPA (Repository Abstraction)
```java
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
}

public class EmployeeService {
  @Autowired
  private EmployeeRepository employeeRepository;

  @Transactional
  public void addEmployee(Employee employee) {
    employeeRepository.save(employee);
  }
}
```
