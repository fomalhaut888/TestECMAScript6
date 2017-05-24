<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var desserts = new Set("1234");//this contructor will parse this string into 4 separate strings.
	console.debug("desserts.size=" + desserts.size);
	desserts.add("1");
	console.debug("desserts.size=" + desserts.size);
	console.debug("desserts=" + desserts);
	desserts.add(1);
	console.debug("desserts.size=" + desserts.size);
	desserts.add(1);
	console.debug("desserts.size=" + desserts.size);
	desserts.add("23");
	console.debug("desserts.size=" + desserts.size);
	desserts.add("1234");
	console.debug("desserts.size=" + desserts.size);
	desserts.forEach(function(value){
		console.debug(value + "(" + typeof value + ")");
	});
</script>
</head>
<body>
</body>
</html>