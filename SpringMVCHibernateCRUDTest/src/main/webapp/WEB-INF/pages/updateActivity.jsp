<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>佈告欄編輯</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/staff_activity_page.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/datetimepicker/jquery.datetimepicker.css" />
    <style>
	  .xdsoft_datetimepicker .xdsoft_datepicker {
	           width:  300px;   /* width:  300px; */
	  }
	  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	           height: 151px;   /* height:  151px; */
	  }
	</style>
</head>

<body>
        <main class="main">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <h4 class="h4">編輯布告欄內容</h4>
                    </div>
                </div>
                <div class="row justify-content-end">
                    <div class="col-md-auto">
                        <a href="${pageContext.request.contextPath}/back_end/activity/listAllActivity.jsp">
                            <button type="button" class="btn btn-info"><i class="fa-solid fa-circle-left"></i>回到佈告欄列表</button>
                        </a>
                    </div>
                </div>


                <div class="addblock border border-light bg-light rounded">

                    <form action="insertActivity" method="post" name="form1">
                     
                        <jsp:useBean id="activityCategoryService" scope="page" class="com.jwt.model.Activity" />

                        <div class="row">
                            <div class="col">
                                <div class="form-group form">
                                    <label for="inputActivityName">標題：</label><div><font color=red>${errorMsgs.activity_name}</font></div>
                                    <input type="text" class="form-control" id="inputActivityName" name="activity_name">
                                </div>
                            </div>
                        </div>

                  <div class="row">
                            <div class="col">
                                <div class="form-group form">
                                    <label for="insertActivityPrice">公布者：</label><div><font color=red>${errorMsgs.activity_price}</font></div>
                                    <input readonly type="number" class="form-control" id="insertActivityPrice"
                                        placeholder="administrator">                                    
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group form">
                                    <label for="selectActivityStart">發布日期：</label><div><font color=red>${errorMsgs.activity_start}</font></div>
                                    <input type="date" id="f_date1"  class="form-control" id="selectActivityStart" name="activity_start"
                                         onkeydown="return false" autocomplete="off">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group form">
                                    <label for="selectActivityEnd">截止日期：</label><div><font color=red>${errorMsgs.activity_end}</font></div>
                                    <input type="date" id="f_date2"  class="form-control" id="selectActivityEnd" name="activity_end"
                                         onkeydown="return false" autocomplete="off">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group form">
                                    <label for="inputActivityContent">內容：</label><div><font color=red>${errorMsgs.activity_content}</font></div>
                                    <textarea name="activity_content" class="form-control" id="inputActivityContent"></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group form">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="activity_ID" >
                                    <input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"> <!--接收原送出修改的來源網頁路徑後,再送給Controller準備轉交之用-->
									<input type="hidden" name="whichPage"  value="<%=request.getParameter("whichPage")%>">  <!--只用於:istAllEmp.jsp-->
                                    <button type="submit" class="btn btn-dark" value="送出修改"><i class="fa-solid fa-square-check"></i>送出修改</button>
                                </div>
                            </div>
                        </div>
                   </form>

                </div>


            </div>

        </main>

    </div>

<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->
	
	
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
	<script>
	 $.datetimepicker.setLocale('zh');
     $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '',              // value:   new Date(),
        //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
        //startDate:	            '2017/07/10',  // 起始日
        //minDate:               '-1970-01-01', // 去除今日(不含)之前
        //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
		   onShow:function(){
			   this.setOptions({
			    maxDate:$('#f_date2').val()?$('#f_date2').val():false
			   })
			  },
		  scrollMonth : false,
		  scrollInput : false
     });
     
     $('#f_date2').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '',              // value:   new Date(),
        //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
        //startDate:	            '2017/07/10',  // 起始日
        //minDate:               '-1970-01-01', // 去除今日(不含)之前
        //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
		   onShow:function(){
			   this.setOptions({
			    minDate:$('#f_date1').val()?$('#f_date1').val():false
			   })
			  },
		  scrollMonth : false,
		  scrollInput : false
     });
	   
	        
	</script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
        integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
        crossorigin="anonymous"></script>
        <script src="https://cdn.ckeditor.com/4.7.3/standard-all/ckeditor.js"></script>

    <script>CKEDITOR.replace("activity_content");</script>

</body>

</html>