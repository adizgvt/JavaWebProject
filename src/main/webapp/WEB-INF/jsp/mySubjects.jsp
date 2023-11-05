<%@ page import="java.util.List" %>
<%@ page import="beans.Subject" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
                    <a class="nav-link" aria-current="page" href="/home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="mx-3 my-5">
    <div class="d-flex justify-content-between mb-3">
        <h4>My Subjects</h4>
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Add Subject
        </button>
    </div>
    <div class="alert alert-success" id="success_alert" role="alert" style="display: none">
        <p id="success_message"></p>
    </div>
    <table class="table" id="table">
        <thead class="table-light">
        <tr>
            <th scope="col">Subject</th>
            <th scope="col">Start Time</th>
            <th scope="col">End Time</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
<%--        <c:forEach items="${subjects}" var="subject">
            <tr>${subject.name}</tr><tr>${subject.name}</tr><tr>${subject.name}</tr>
        </c:forEach>--%>
        <%List<Subject> subjectList = (List<Subject>) request.getAttribute("subjects");%>
        <%for(int i = 0; i < subjectList.size(); i++) {%>
                <tr id="table-row-<%= subjectList.get(i).getId()%>">
                    <td><%=subjectList.get(i).getName()%></td>
                    <td><%=subjectList.get(i).getStartTime()%></td>
                    <td><%=subjectList.get(i).getEndTime()%></td>
                    <td>
                        <input type="hidden" value="<%=subjectList.get(i).getId()%>">
                        <button type="button" class="btn btn-outline-danger delete" data-bs-toggle="modal" data-bs-target="#deleteModal">Delete</button>
                    </td>
                </tr>

        <%}%>
        </tbody>
    </table>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Warning</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure to delete this subject?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" onclick="deleteSubject()">Delete</button>
            </div>
        </div>
    </div>
</div>
<!--Add Subject Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/subject" method="POST">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Subject</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="alert alert-danger" id="error_alert" role="alert" style="display: none">
                        <p id="error_message"></p>
                    </div>
                        <div class="d-flex justify-content-center">
                            <div class="col">
                                <div class="mb-3">
                                    <label for="name" class="form-label">Subject Name</label>
                                    <input type="t" class="form-control" id="name" name="name">
                                </div>
                                <div class="mb-3">
                                    <label for="start" class="form-label">Start Time</label>
                                    <input type="time" class="form-control" id="start" name="start">
                                </div>
                                <div class="mb-3">
                                    <label for="end" class="form-label">End Time</label>
                                    <input type="time" class="form-control" id="end" name="end">
                                </div>
                            </div>

                        </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="addSubject()">Submit</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>

<script>

    var idToDelete;

    $(document).on('click','.delete', function (){
        idToDelete = $(this).prev('input').attr('value');
    });

    function deleteSubject(){

        $.ajax({
            type: "DELETE",
            url: "/subject?id=" + idToDelete,
            success: function(msg){
                $('#deleteModal').modal('hide');
                $('#success_message').text(msg);
                $("#success_alert").show();
                $("#table-row-" + idToDelete ).remove();
            },
            error: function(XMLHttpRequest) {
                $('#error_message').text(XMLHttpRequest.responseText);
                $("#error_alert").show();
            }
        })
    }

    function addSubject(){
        let data = $("form").serializeArray();
        let subjectName = data[0]['value'];
        let startTime = data[1]['value'];
        let endTime = data[2]['value'];

        console.log(data);

        $.ajax({
            type: "POST",
            url: "/subject",
            data: {name: subjectName, start: startTime, end: endTime},
            success: function(msg){
                $('#exampleModal').modal('hide');
                $('#success_message').text(msg.split(".")[0]);
                $("#success_alert").show();
                $('#table tr:last').after(
                    '<tr id="table-row-' + msg.split(".")[1].trim() + '">' + '<td>' + subjectName +"</td><td>"+ startTime +"</td><td>" + endTime +"</td>" +
                    '<td> <input type="hidden" value="'+ msg.split(".")[1] +'"> <button type="button" class="btn btn-outline-danger delete" data-bs-toggle="modal" data-bs-target="#deleteModal">Delete</button> </td>'
                    + '</tr>'
                );

            },
            error: function(XMLHttpRequest) {
                $('#error_message').text(XMLHttpRequest.responseText);
                $("#error_alert").show();
            }
        })
    }

</script>
</html>
