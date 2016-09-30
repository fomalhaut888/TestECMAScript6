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
			
			//9.對象(物件)的解構
			//9.1 每个属性与不同的变量绑定
			var robotA = {name: "Bender"};
			var robotB = {name: "Flexo"};
			var {name: nameA} = robotA;
			var {name: nameB} = robotB;
			console.log("robotA[\'name\']=" + robotA['name']);
			console.log("robotB[\"name\"]=" + robotB["name"]);
			console.log("nameA=" + nameA);
			console.log("nameB=" + nameB);
			//9.2 属性名与变量名一致
			var {foo, bar} = {foo: "lorem", bar: "ipsum"};
			console.log("foo=" + foo);
			console.log("bar=" + bar);
			var {foo2, bar2} = {bar2: "ipsum", foo2: "lorem"};
			console.log("foo2=" + foo2);
			console.log("bar2=" + bar2);
			//9.3 与数组解构一样，你可以随意嵌套并进一步组合对象解构
			var complicatedObj = {
				arrayProp: [
					"Zapp",
					{ second: "Brannigan" }
				]	
			};
			var {arrayProp: [first, {second}]} = complicatedObj;
			console.log("first=" + first);
			console.log("second=" + second);
			//9.4 解构一个未定义的属性时，得到的值为undefined
			var { missing } = {};
			console.log("missing=" + missing);
			//9.5 解构对象并赋值给变量时，如果你已经声明或不打算声明这些变量（亦即赋值语句前没有let、const或var关键字），
			//   你应该注意这样一个潜在的语法错误
			//var blowUp;//不論此句有無
			//{blowUp} = {blowUp: 10};// Syntax error 语法错误, destructuring.jsp:94 Uncaught SyntaxError: Unexpected token =
			//为什么会出错？这是因为JavaScript语法通知解析引擎将任何以{开始的语句解析为一个块语句
			//（例如，{console}是一个合法块语句）。
			//解决方案是将整个表达式用一对小括号包裹：
			var blowUp;//不論此句有無
			({blowUp} = {blowUp: 10});
			console.log("blowUp=" + blowUp);
			
			//10. 解构值不是对象、数组或迭代器
			//10.1 解构null或undefined时，你会得到一个类型错误:
			//var {blowUp} = null;//Uncaught TypeError: Cannot match against 'undefined' or 'null'.
			//10.2 可以解构其它原始类型，例如：布尔值、数值、字符串，但是你将得到undefined：
			var {wtf} = NaN;
			console.log("wtf=" + wtf);
			//原因其实非常简单。当使用对象赋值模式时，被解构的值需要被强制转换为对象。
			//大多数类型都可以被转换为对象，但null和undefined却无法进行转换。
			//当使用数组赋值模式时，被解构的值一定要包含一个迭代器。
			
			//11. 默认值
			var [missing = true] = [];
		    console.log("missing=" + missing);
		    var { message: msg = "Something went wrong" } = {};
		    console.log("msg=" + msg);
		    var { x = 3 } = {};
		    console.log("x=" + x);
		    var { y = 3 } = {y:4};
		    console.log("y=" + y);
		}
		
		function* fibs(){//ex.費氏數列
			var a = 0;
			var b = 1;
			i = 0;
			while(true){
				i++;
				console.log('i=' + i);
				yield a;
				[a, b] = [b, a + b];
			}
		}
		
	</script>
</head>
<body onload="initDoc()">

</body>
</html>