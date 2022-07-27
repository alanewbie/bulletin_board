<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${isUpdate ? "編輯公布欄" : "新增公布欄"}</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

    <link rel="stylesheet"
 		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
    <script src="https://cdn.ckeditor.com/4.7.3/standard-all/ckeditor.js"></script>
    <script src="resources/js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/datetimepicker/jquery.datetimepicker.css" />
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
        <!-- ------------------------------- main ------------------------------- -->
        <main class="main">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <h4 class="h4">${isUpdate ? "編輯公布欄" : "新增公布欄"}</h4>
                    </div>
                </div>
                <div class="row justify-content-end">
                    <div class="col-md-auto">
                        <a href="listAllActivity">
                            <button type="button" class="btn btn-info"><i class="fa-solid fa-circle-left"></i>回到公布欄列表</button>
                        </a>
                    </div>
                </div>
				
                <div class="addblock border border-light bg-light rounded">                

                    <form action="insertActivity" method="post">
                     <!-- id="forParamGet" name="form1" onsubmit="this.activity_state.disabled=false" -->               
                        <input type="hidden" name="activity_ID" value="${activity_ID}" />
                        <div class="row">
                            <div class="col">
                                <div class="form-group form">
                                    <label for="activity_name">標題：</label>
                                    <input type="text" class="form-control" id="activity_name" value="${activity_name}" required
                                        placeholder="請輸入標題" name="activity_name">                                    
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col">
                                <div class="form-group form">
                                    <label>公布者：</label>
                                    <input readonly class="form-control" placeholder="administrator">                                    
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col">
                                <div class="form-group form">
                                    <label for="activity_start">發布日期：</label>
                                    <input type="dateNew" id="f_date1" class="form-control" id="activity_start" value="${activity_start}" required
                                        placeholder="請選擇發布日" name="activity_start" onkeydown="return false" autocomplete="off">
                                        <%-- value="${param.activity_start}" --%>                                   
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col">
                                <div class="form-group form">
                                    <label for="activity_end">截止日期：</label>
                                    <input type="dateNew" id="f_date2" class="form-control" id="activity_end" value="${activity_end}" required
                                        placeholder="請選擇截止日" name="activity_end" onkeydown="return false" autocomplete="off">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group form">
                                    <label for="activity_content">內容：</label>
                                    <textarea class="form-control" id="activity_content" name="activity_content" required>${activity_content}</textarea>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group form-inline">
                                    <button type="submit" class="btn btn-dark"><i class="fa-solid fa-square-check"></i>${isUpdate ? "編輯公布欄" : "新增公布欄"}</button>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>


            </div>

        </main>
<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->
	<script src="resources/datetimepicker/jquery.js"></script>
	<script src="resources/datetimepicker/jquery.datetimepicker.full.js"></script>
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
        minDate:               '-1970-01-01', // 去除今日(不含)之前
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
	   
	        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------
	
	        //      1.以下為某一天之前的日期無法選擇
	        //      var somedate1 = new Date('2017-06-15');
	        //      $('#f_date1').datetimepicker({
	        //          beforeShowDay: function(date) {
	        //        	  if (  date.getYear() <  somedate1.getYear() || 
	        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	        //              ) {
	        //                   return [false, ""]
	        //              }
	        //              return [true, ""];
	        //      }});
	
	        
	        //      2.以下為某一天之後的日期無法選擇
	        //      var somedate2 = new Date('2017-06-15');
	        //      $('#f_date1').datetimepicker({
	        //          beforeShowDay: function(date) {
	        //        	  if (  date.getYear() >  somedate2.getYear() || 
	        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	        //              ) {
	        //                   return [false, ""]
	        //              }
	        //              return [true, ""];
	        //      }});
	
	
	        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
	        //      var somedate1 = new Date('2017-06-15');
	        //      var somedate2 = new Date('2017-06-25');
	        //      $('#f_date1').datetimepicker({
	        //          beforeShowDay: function(date) {
	        //        	  if (  date.getYear() <  somedate1.getYear() || 
	        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	        //		             ||
	        //		            date.getYear() >  somedate2.getYear() || 
	        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	        //              ) {
	        //                   return [false, ""]
	        //              }
	        //              return [true, ""];
	        //      }});
	        
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

	<script>CKEDITOR.replace("activity_content");</script>    
  
</body>

</html>