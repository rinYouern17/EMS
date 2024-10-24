<?php
class Employee {
    private $db;

    public function __construct() {
        $this->db = new Database;
    }

    public function getAll() {
        $this->db->query('SELECT * FROM Employees');
        return $this->db->resultSet();
    }

    public function save() {
        $this->db->query('INSERT INTO Employees (FirstName, LastName, DateOfBirth, Position, Department, HireDate, Salary, ManagerId) VALUES (:firstName, :lastName, :dateOfBirth, :position, :department, :hireDate, :salary, :managerId)');
        // Bind values
        $this->db->execute();
    }

    // Other methods (find, update, delete)
}
?>
