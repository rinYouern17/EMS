<?php
class EmployeeController extends Controller {
    public function index() {
        $employees = $this->model('Employee')->getAll();
        $this->view('employees/index', ['employees' => $employees]);
    }

    public function create() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $employee = $this->model('Employee');
            $employee->firstName = $_POST['firstName'];
            $employee->lastName = $_POST['lastName'];
            // Set other properties
            $employee->save();
            header('Location: /employees');
        } else {
            $this->view('employees/create');
        }
    }

    // Other methods (edit, update, delete)
}
?>
