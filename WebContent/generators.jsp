<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <title>2015 台灣國際專業展</title>
    
    <script type="text/javascript">
    	//生成器函数，它与普通函数有很多共同点，但是二者有如下区别：

    	//普通函数使用function声明，而生成器函数使用function*声明。
    	//在生成器函数内部，有一种类似return的语法：关键字yield。二者的区别是，普通函数只可以return一次，而生成器函数可以yield多次（当然也可以只yield一次）。在生成器的执行过程中，遇到yield表达式立即暂停，后续可恢复执行状态。
    	//这就是普通函数和生成器函数之间最大的区别，普通函数不能自暂停，生成器函数可以。
    	//參考網頁: http://people.mozilla.org/~jorendorff/demos/meow.html
    	
    	//生成器调用看起来非常类似：quips("jorendorff")。
    	//但是，当你调用一个生成器时，它并非立即执行，而是返回一个已暂停的生成器对象（上述实例代码中的iter）。
    	//你可将这个生成器对象视为一次函数调用，只不过立即冻结了，它恰好在生成器函数的最顶端的第一行代码之前冻结了。
    	
    	//***生成器是迭代器。所有的生成器都有内建.next()和[Symbol.iterator]()方法的实现。你只须编写循环部分的行为。
    	
    
    	function* quips(name){
    		yield "您好 " + name + "!";
    		yield "希望你能喜欢这篇介绍ES6的译文";
    		if (name.startsWith("X")) {
    			yield "你的名字 " + name + "  首字母是X，这很酷！";
    		}
    		yield "我们下次再见！";
    	}
    	
    	var iter = quips("Xingu");
    	function sayQuips(){
    		//var iter = quips("Xingu");
    		//for(var item of iter){
    			//alert("Say:" + item);
    		//}
    		var item = iter.next();
    		say(item);
    	}
    	
    	function say(item){
    		if(!item.done){
    			document.getElementById('helloArea').innerHTML = item.value;
    		}else{
    			document.getElementById('helloArea').innerHTML = '';
    			iter = quips("Xingu");
    		}
    	}
    </script>
</head>
<body>
<input type="button" value="Say" onclick="javascript: sayQuips();" />
<div id="helloArea"></div>
</body>
</html>
