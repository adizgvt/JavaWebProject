<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Subject Management</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="row mx-2 my-2 bg-light">
    <div class="card mx-3 my-3 p-3" style="width: 25rem;">
        <img src="https://images.theconversation.com/files/49135/original/22qc7r28-1400667334.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=754&fit=clip" class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">Subjects</h5>
            <p class="card-text">Manage my subjects.</p>
            <a href="/subject" class="btn btn-primary">Go</a>
        </div>
    </div>
    <div class="card mx-3 my-3 p-3" style="width: 25rem;">
        <img src="https://images.theconversation.com/files/49135/original/22qc7r28-1400667334.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=754&fit=clip" class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">Subjects</h5>
            <p class="card-text">Manage my subjects.</p>
            <a href="/subject" class="btn btn-primary">Go</a>
        </div>
    </div>
</div>

</body>
</html>
