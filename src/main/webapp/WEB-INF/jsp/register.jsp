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
                    <a class="nav-link active" aria-current="page" href="#">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="mx-3 my-5">
    <div class="d-flex justify-content-center mb-3">
        <h1>Register</h1>
    </div>
    <%if(request.getAttribute("error") != null) {%>
    <div class="alert alert-danger" role="alert">
        <%=request.getAttribute("error")%>
    </div>
    <%}%>
    <%if(request.getAttribute("success") != null) {%>
    <div class="alert alert-success" role="alert">
        <%=request.getAttribute("success")%>
    </div>
    <%}%>
    <form action="/register" method="POST">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="name" class="form-control" id="name" name="name" value="<%=request.getAttribute("name") == null ? "" : request.getAttribute("name")%>">
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email address</label>
            <input type="email" class="form-control" id="email" name="email" value="<%=request.getAttribute("email") == null ? "" : request.getAttribute("email")%>">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" value="<%=request.getAttribute("password") == null ? "" : request.getAttribute("password")%>">
        </div>
        <div class="mb-3">
            <label for="password_confirmation" class="form-label">Password Confirmation</label>
            <input type="password_confirmation" class="form-control" id="password_confirmation" name="password_confirmation" value="<%=request.getAttribute("password_confirmation") == null ? "" : request.getAttribute("password_confirmation")%>">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
