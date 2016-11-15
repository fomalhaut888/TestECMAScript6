<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Arrow Functions</title>
	<script type="text/javascript">
		<!--
		function initDoc(){
			//1. <!-- --> //箭头符号在JavaScript诞生时就已经存在，
			//当初第一个JavaScript教程曾建议在HTML注释内包裹行内脚本，
			//这样可以避免不支持JS的浏览器误将JS代码显示为文本。
			
			//2. -->是一个JS运算符：“趨向于”运算符
			//新标准中箭头被用来做其它事情。
			//循环会一直重复直到n趋于0，这当然不是ES6中的新特性，
			//它只不过是将两个你早已熟悉的特性通过一些误导性的手段结合在一起。
			var n = 10
			while(n --> 0){
				console.log('n=' + n);// "n goes to zero"
			}
			
			//3.函数表达式无处不在(lambda函数)
			//标识符=>表达式
			//3.1 單參數單行匿名函數
			var p1 = 20;
			//ES 5原式
			var r1 = f1(function(a){
				return p1 % 2;
			}, p1);
			console.log('r1=' + r1);
			
			//ES6
			r1 = f1(a => p1 % 2, p1);
			console.log('r1=' + r1);
			
			//3.2 兩參數單行匿名函数
			var p2 = 16;
			var p3 = 9;
			//ES 5原式
			var r2 = f2(function(a, b){
				return a + b;
			}, p2, p3);
			var r3 = f2(function(a, b){
				return a - b;
			}, p2, p3);
			var r4 = f2(function(a, b){
				return a * b;
			}, p2, p3);
			var r5 = f2(function(a, b){
				return a / b;
			}, p2, p3);
			console.log('r2=' + r2);
			console.log('r3=' + r3);
			console.log('r4=' + r4);
			console.log('r5=' + r5);
			
			//ES6
			r2 = f2((a, b) => a + b, p2, p3);
			r3 = f2((a, b) => a - b, p2, p3);
			r4 = f2((a, b) => a * b, p2, p3);
			r5 = f2((a, b) => a / b, p2, p3);
			console.log('r2=' + r2);
			console.log('r3=' + r3);
			console.log('r4=' + r4);
			console.log('r5=' + r5);
			
			//3.3 箭头函数还可以包含一个块语句
			//使用了块语句的箭头函数不会自动返回值，你需要使用return语句将所需值返回。
			var p6 = 10;
			//ES 5原式
			var r6 = f1(function(r){
				var pi = 3.1415926;
				console.log("Radius=" + r);
				console.log("Perimeter=" + (r * 2 * pi));
				console.log("Area=" + (r * r * pi))
			}, p6);
			console.log('r6=' + r6);
			
			//ES6
			r6 = f1(r => {
				var pi = 3.1415926;
				console.log("Radius=" + r);
				console.log("Perimeter=" + (r * 2 * pi));
				console.log("Area=" + (r * r * pi))
			}, p6);
			console.log('r6=' + r6);
			
			//3.4 箭头函数创建普通对象时，你总是需要将对象包裹在小括号里。
			var r7 = f1(r => {});
			console.log('r7=' + r7);//回傳undefined, 大括號當成块语句
			
			r7 = f1(r => ({}));
			console.log('r7=' + r7);//回傳[object Object], 加括號則大括號當成物件
			
			//4.这个函数的this值是什么呢？
			//普通function函数和箭头函数的行为有一个微妙的区别，箭头函数没有它自己的this值，
			//箭头函数内的this值继承自外围作用域。
			//ES 5原式
			var p8 = {
				count: 0,//計算透過add或addAll方法塞進物件的元素個數
				add: function(a){//參數為單一元素,回傳目前物件的元素個數
					return ++(this.count);
				},
				addAll: function(arr){//參數為陣列(多元素),回傳目前物件的元素個數
					var self = this;
					arr.forEach(function(a){
						//此内层函数里，this会是window或undefined
						//console.log('this=' + this);//this=[object Window]
						//return this.add(a);//Uncaught TypeError: this.add is not a function
						return self.add(a);
					});
					return this.count;
				}};
			var r8 = p8.add(10);
			r8 = p8.add(8);
			r8 = p8.add(4);
			r8 = p8.add(2);
			console.log("count=" + r8);
			
			var pArr8 = [1, 7, 6, 9];
			r8 = p8.addAll(pArr8);
			console.log("count=" + r8);
			
			//ES6
			p8 = {
				count: 0,//計算透過add或addAll方法塞進物件的元素個數
				add: function(a){//參數為單一元素,回傳目前物件的元素個數
					return ++(this.count);
				},
				addAll: function(arr){//參數為陣列(多元素),回傳目前物件的元素個數
					//内部函数是一个箭头函数，所以它继承了外围作用域的this值。
					arr.forEach(a => this.add(a));//this值继承自外围的this。
					return this.count;
				}};
			r8 = p8.add(10);
			r8 = p8.add(8);
			r8 = p8.add(4);
			r8 = p8.add(2);
			console.log("count=" + r8);
			
			pArr8 = [1, 7, 6, 9];
			r8 = p8.addAll(pArr8);
			console.log("count=" + r8);
			
			//5.借助箭头函数洞悉计算机科学的风尘往事
			//它还有一种可能的使用方法：将ES6箭头函数作为一个学习工具，来深入挖掘计算的本质，
			//是否实用，终将取决于你自己。
			//1936年，Alonzo Church和Alan Turing各自开发了强大的计算数学模型，图灵将他的模型称为a-machines，
			//但是每一个人都称其为图灵机。Church写的是函数模型，他的模型被称为lambda演算（λ-calculus）。
			//这一成果也被Lisp借鉴，用LAMBDA来指示函数，这也是为何我们现在将函数表达式称为lambda函数。
			//但什么是lambda演算呢？“计算模型”又意味着什么呢？
			//用 几句话解释清楚很难，但是我会努力阐释：lambda演算是第一代编程语言的一种形式，
			//但毕竟存储程序计算机在十几二十年后才诞生，所以它原本不是为编程 语言设计的，
			//而是为了表达任意你想到的计算问题设计的一种极度简化的纯数学思想的语言。
			//Church希望用这个模型来证明普遍意义的计算。
			//最终他发现，在他的系统中只需要一件东西：函数。
			//这种声明方式无与伦比，不借助对象、数组、数字、if语句、while循环、分号、赋值、
			//逻辑运算符甚或是事件循环，只须使用函数就可以从0开始重建JavaScript能实现的每一种计算。
			//这是用Church的lambda标记写出来的数学家风格的“程序”示例：
			//fix = λf.(λx.f(λv.x(x)(v)))(λx.f(λv.x(x)(v)))
			//等效的JavaScript函数是这样的：
			//var fix = f => (x => f(v => x(x)(v)))
            //(x => f(v => x(x)(v)));
			//所以，在JavaScript中实现了一个可以运行的lambda演算，它根植于这门语言中。
		}
		
		function f1(f, p1){
			return f(p1);
		}
		
		function f2(f, p1, p2){
			return f(p1, p2);
		}
		// -->
	</script>
</head>
<body onload="initDoc()">

</body>
</html>