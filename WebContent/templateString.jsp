<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var votes = [];
	function addAVote(name){
		if(votes[name] == undefined){
			votes[name] = 1;
		}else{
			votes[name] += 1;
		}
		alert(name);
		alert(votes[name]);
		var msg = `${name} has had ${votes[name]} votes!`;
		console.debug(msg);
		alert(msg);
	}
</script>
</head>
<body>
	<input type="button" value="John" onclick="javascript: addAVote(this.value);" />&nbsp;&nbsp;
	<input type="button" value="Simon" onclick="javascript: addAVote(this.value);" />
</body>
</html>