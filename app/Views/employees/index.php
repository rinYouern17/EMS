<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employees</title>
</head>
<body>
    <h1>Employees</h1>
    <a href="/employees/create">Add New Employee</a>
    <ul>
        <?php foreach ($data['employees'] as $employee): ?>
            <li><?php echo $employee->FirstName . ' ' . $employee->LastName; ?></li>
        <?php endforeach; ?>
    </ul>
</body>
</html>
