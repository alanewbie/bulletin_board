<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page isELIgnored="false"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>公布欄</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
</head>

<body>

        <!-- ------------------------------- main ------------------------------- -->
        <main class="main">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <h4 class="h4">所有公佈欄</h4>
                    </div>
                </div>
                <div class="row justify-content-between">
                    <div class="col-md-auto">
                        <a href="addActivity">
                            <button
                            type="button" class="btn btn-secondary"><i class="fa-solid fa-plus"></i>新增公布欄</button>
                        </a>
                    </div>

                </div>
                <div class="row">
                    <div class="col">
                        <table class="table table-striped table-hover"  id="table_id">
                            <thead class="thead thead-dark">
                                <tr>
                                    <th scope="col">標題</th>
                                    <th scope="col">發布日期</th>
                                    <th scope="col">截止日期</th>
                                    <th scope="col">編輯</th>
                                </tr>
                            </thead>
                            <tbody class="">

								<c:forEach items="${activity}" var="activityVO" >
                                <tr class="text-center">
									<td>${activityVO.activity_name}</td>
									<td><fmt:formatDate type="date" value="${activityVO.activity_start}" /></td>
									<td><fmt:formatDate type="date" value="${activityVO.activity_end}" /></td>

                                    <td>
                                        <div class="editgroup">
                                            <a href="addActivity?activity_ID=${activityVO.activity_ID}" class ="btn btn-primary"> 編輯 </a>
                                            <form method="POST" action="deleteActivity" style="display: inline-block">
                                                <input type="hidden" name="activity_ID" value="${activityVO.activity_ID}" />
			 								    <button class="btn btn-primary"> 刪除 </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                               </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
        integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
        crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

    <script>
    $(document).ready( function () {
        $('#table_id').DataTable();
    } );
	</script>
</body>

</html>