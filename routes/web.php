<?php
$router->get('', 'EmployeeController@index');
$router->get('employees', 'EmployeeController@index');
$router->get('employees/create', 'EmployeeController@create');
$router->post('employees/create', 'EmployeeController@create');
// Other routes
?>
