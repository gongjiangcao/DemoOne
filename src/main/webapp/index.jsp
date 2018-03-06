<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.min.js" ></script>
<script type="text/javascript" src="js/dialog.js" ></script>
<script type="text/javascript">
  $(function(){
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
 /* 1  var d = dialog({
			title: '欢迎',
			content: '欢迎使用 artDialog 对话框组件！'
		});    */
		
	 // d.show(); 
	  
	  
	 /* 2    var d = dialog({
			title: 'message',
			content: 'hello'
		});  模态框  */
		
	  
	  
 	var d = dialog({
			title: '提示',
			content: '您确定要增加此地区吗？',
			okValue: '确定',
			ok: function () {
				//this.title('提交中…');
				
				//return;
			},
			cancelValue: '取消',
			cancel: function () {
				alert(1412);
			}
		}); 
		
	  
	  
	  
	  
	  
	  
  //回显省的下拉框
  
	$.ajax({

			url : "findprovince.do",
			type : "post",
			data : {
				pid : 1
			},
			success : function(msg) {

				for (var i = 0; i < msg.length; i++) {

					var op = $("<option value="+msg[i].id+">" + msg[i].name
							+ "</option>");
					$("#sheng").append(op);
				}

			},
			dataType : "json"
		});

		$("#sheng").change(
				function() {

					var id = $(this).val();
					//清空市的之前选择
					$("#shi").empty();
					$("#shi").append('<option value="0">请选择</option>');
					//清空县的之前选择
					$("#xian").empty();
					$("#xian").append('<option value="0">请选择</option>');
					//回显市的下拉框
					$.ajax({
						url : "findprovince.do",
						type : "post",
						data : {
							pid : id
						},
						success : function(msg) {
							for (var i = 0; i < msg.length; i++) {

								var op = $("<option value="+msg[i].id+">"
										+ msg[i].name + "</option>");
								$("#shi").append(op);
							}

						},
						dataType : "json"
					});
				});

		$("#shi").change(
				function() {

					var id = $(this).val();

					//清空县的之前选择
					$("#xian").empty();
					$("#xian").append('<option value="0">请选择</option>');
					//回显县的下拉框
					$.ajax({

						url : "findprovince.do",
						type : "post",
						data : {
							pid : id
						},
						success : function(msg) {
							for (var i = 0; i < msg.length; i++) {

								var op = $("<option value="+msg[i].id+">"
										+ msg[i].name + "</option>");
								$("#xian").append(op);
							}

						},
						dataType : "json"
					});
				});

		
		//获取输入的地区进行校验
		
		$("#name").blur(function(){
			
			var name = $(this).val();
			alert(name);
			if(name==""){
				
				$("#namespan").html("<font color='red'>输入不能为空</font>");
				$("[value='提交']").attr("disabled",true);
				
				return ;
			}
			
			
			$.post(
					
				"getCountName.do",
				{name:name},
				function(data){
					if(data>0){
						alert("改地区已存在，请重新输入");
						$("[value='提交']").attr("disabled",true);
					}else{
						//alert("OK");
						//d.show(); 
						d.showModal();
						//d.show();
					}
					
				}
			
			)
		});
		
		//对话框演示
		
		
		
		
		
		
		
		
	});
</script>
  </head>
  
  <body>
  <select id="sheng"><option value="0">请选择</option></select>
  <select id="shi"><option value="0">请选择</option></select>
  <select id="xian"><option value="0">请选择</option></select>
  请添加地区：<input id="name"/><span id="namespan"></span>
  <input type="button" value="提交"/>
  
  
  </body>
</html>