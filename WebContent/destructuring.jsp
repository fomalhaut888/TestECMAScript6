<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		function initDoc(){
			console.debug("Destructuring(解構)!!!");
			//解构赋值允许你使用类似数组或对象字面量的语法将数组和对象的属性赋给各种变量。
			//这种赋值语法极度简洁，同时还比传统的属性访问方法更为清晰。
			//1.陣列解構賦值:
			var someArray = [1, 2, 3, 4];
			var [first, second, third] = someArray;//同義var first = someArray[0]; var second = someArray[1]; var third = someArray[2];
			console.debug("first=" + first);
			console.debug("second=" + second);
			console.debug("third=" + third);
			//如果使用解构赋值的特性，将会使等效的代码变得更加简洁并且可读性更高
			
			//2.使用let:
			let [v1, v2, v3] = someArray;
			console.debug("v1=" + v1);
			console.debug("v2=" + v2);
			console.debug("v3=" + v3);
			
			//3.使用const:
			const [c1, c2, c3] = someArray;
			console.debug("c1=" + c1);
			console.debug("c2=" + c2);
			console.debug("c3=" + c3);
			
			//4.任意深度的嵌套数组进行解构:
			var [foo, [[bar], baz]] = [1, [[2], 3]];
			console.debug("foo=" + foo);
			console.debug("bar=" + bar);
			console.debug("baz=" + baz);
			
			//5.对应位留空来跳过被解构数组中的某些元素:
			var [,,x3] = someArray;
			console.debug("x3=" + x3);
			
			//6.不定參數:
			var [head, ...tail] = someArray;
			console.debug("tail=" + tail);
			
			//7.访问空数组或越界访问数组=>undefined
			console.debug([][0]);
			var [missing] = [];
			console.debug("missing=" + missing);
			var [,,,,x5] = someArray;
			console.debug("x5=" + x5);
			
			//8.生成器函數(迭代器):
			var [i1, i2, i3, i4, i5, i6] = fibs();
			console.log("i1=" + i1);
			console.log("i2=" + i2);
			console.log("i3=" + i3);
			console.log("i4=" + i4);
			console.log("i5=" + i5);
			console.log("i6=" + i6);
		}
		
		function* fibs(){//ex.費氏數列
			var a = 0;
			var b = 1;
			while(true){
				yield a;
				[a, b] = [b, a + b];
			}
		}
	</script>
</head>
<body onload="initDoc()">

</body>
</html>