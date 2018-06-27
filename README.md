# Employee Management
This is a API based project for doing features like create employee, show hierarchy, top salaries, delete employee

# This project is totally API based build in Rails 5.2.0


### BASE_URL
**https://vast-fortress-96994.herokuapp.com**


## 1. Create Employee
  ```
  endpoints: /api/employees
  Method: POST
  sample request: 
  {
    employee[name]=Name,
    employee[salary]=500.5,
    employee[rating]=2.5,
    employee[role]=sde,
    employee[superior_id]=5,
  }
  ```

## 2. Get Employee detail with hierarchy
  ```
  endpoint: /api/employees/:id
  Method: GET
  ```

## 3. Get top 10 salaried employees 
  ```
  endpoints: /api/employees/top_employees
  Method: GET
  ``` 

## 4. Delete Employee
  ```
  endpoint: /api/employees/:id
  Method: DELETE
  ```