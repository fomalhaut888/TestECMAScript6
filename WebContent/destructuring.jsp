<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		var iter;
	
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
		    
		    //12. 註.review generator執行
		    //12.1 generator的執行細節
		    //(1) 給定iterator,並未開始執行generator的命令.
		    //(2) 執行iterator的next方法之後,則開始執行generator命令至第一次yield命令回傳值後暫停.
		    //(3) 再執行第二次next方法後, 繼續第一次yield命令之後的命令, 至第二次yield命令回傳值後暫停.
		    //(4) 以此重覆進行
		    //setTimeout(tryFibs, 10000);
		    iter = fibs();
		    console.log("fibs generator given!");
		    setTimeout(tryFibs, 10000);
		    
		    //12.2 generator呼叫超過回傳次數
		    //(1) 給定iterator,並未開始執行generator的命令.
		    //(2) 執行第一次next, 則開始執行generator命令至第一個yield命令回傳值後暫停.
		    //(3) 執行第二次next, 則開始執行generator命令至第二個yield命令回傳值後暫停.
		    //(4) 執行第三次next, 則開始執行generator命令至第三個yield命令回傳值後暫停.
		    //(5) 執行第四次next, 則generator命令已結束沒有yield命令, 則回傳undefined.
		    //(6) 此後執行的next, 均回傳undefined
		    var iter2 = generator2();
		    var g = iter2.next();
		    console.log('g=' + g.value);
		    g = iter2.next();
		    console.log('g=' + g.value);
		    g = iter2.next();
		    console.log('g=' + g.value);
		    g = iter2.next();
		    console.log('g=' + g.value);//undefined
		    g = iter2.next();
		    console.log('g=' + g.value);//undefined
		    
		  	//12.3 generator解構超過回傳次數
		  	//解構元素個數超過generator yield的次數
		  	var [g1, g2, g3, g4, g5] = generator2();
		  	console.log('g1=' + g1);
		  	console.log('g2=' + g2);
		  	console.log('g3=' + g3);
		  	console.log('g4=' + g4);//undefined
		  	console.log('g5=' + g5);//undefined
		  	
		  	//13. 解構的實際應用
		  	//13.1 函数参数定义
		  	//避免让API使用者记住 多个参数的使用顺序。
		  	console.log('y=' + f1({p1: 'A', p2: 'B', p3: 'C'}));
		  	console.log('y=' + f1({p2: 'B', p3: 'C', p1: 'A'}));
		  	
		  	//13.2 配置对象参数
		  	//可以给需要解构的对象属性赋予默认值。
		  	//可以避免对配置对象的每个属性都重复var foo = config.foo || theDefaultFoo;这样的操作
		  	//??对象的默认值简写语法仍未在Firefox中实现? to check!
		  	console.log('y=' + f2({p1: 'D', p2: 'E', p3: 'F'}));
		  	console.log('y=' + f2({}));
		  	console.log('y=' + f2({p2: 'G'}));
		  	
		  	//13.3 与ES6迭代器协议协同使用
		  	var map = new Map();
		  	map.set(window, "the global");
		  	map.set(document, "the document");
		  	for (var [key, value] of map) {
		  		console.log(key + " is " + value);
		  	}
		  	//結果:
		 	// "[object Window] is the global"
		    // "[object HTMLDocument] is the document"
		    for (var [key] of map) {
		    	console.log('key=' + key);
		    }
		    for (var [, value] of map) {
		    	console.log('value=' + value);
		    }
		    
		    //13.4 多重返回值
		    //JavaScript语言中尚未整合多重返回值的特性，
		 	//但是无须多此一举，因为你自己就可以返回一个数组并将结果解构
		 	//这两个模式都比额外保存一个临时变量或使用CPS变换要好得多。
		 	//function returnMultipleValues() {
      			//return {
        			//foo: 1,
        			//bar: 2
      			//};
    		//}
    		//var temp = returnMultipleValues();
    		//var foo = temp.foo;
    		//var bar = temp.bar;
    		//function returnMultipleValues(k) {
      			//k(1, 2);
    		//}
    		//returnMultipleValues((foo, bar) => ...);
		    var [foo, bar] = returnMultipleValues1();
		    console.log('foo=' + foo);
		    console.log('bar=' + bar);
		    var { foo, bar } = returnMultipleValues2();
		    console.log('foo=' + foo);
		    console.log('bar=' + bar);
		    
		    //13.5 使用解构导入部分CommonJS模块
		    //Node应用由模块组成，采用CommonJS模块规范。
		    //require方法用于加载模块。
		    //const { SourceMapConsumer, SourceNode } = require("source-map");
		    //TO SEE
		}
			
		function returnMultipleValues1() {
			return [1, 2];
		}
		
		function returnMultipleValues2() {
			return {
				foo: 1,
				bar: 2
			};
		}
			
		function f2({p1 = 'A',
					 p2 = 'B',
					 p3 = 'C',}){
			return 'p1=' + p1 + ', p2=' + p2 + ', p3=' + p3;
		}
			
		function f1({p1, p2, p3}){
			return 'p1=' + p1 + ', p2=' + p2 + ', p3=' + p3;
		}
			
		function tryFibs(){
			//var iter = fibs();
	    	//var k = iter.next();
	    	//console.log("k=" + k.value);
	    	//k = iter.next();
	    	//console.log("k=" + k.value);
			var k = iter.next();
			console.log("k=" + k.value);
			if(k.value < 10000){
				setTimeout(tryFibs, 5000);
			}
		}
		
		function* fibs(){//ex.費氏數列
			var a = 0;
			var b = 1;
			i = 0;
			while(true){
				i++;
				console.log('i=' + i);
				yield a;
				console.log('####################');
				[a, b] = [b, a + b];
			}
		}
		
		function* generator2(){
			var [a, b, c] = [1, 2, 3];
			yield a;
			yield b;
			yield c;
		}
	</script>
</head>
<body onload="initDoc()">

</body>
</html>