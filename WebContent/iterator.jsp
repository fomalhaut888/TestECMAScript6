<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <title>2015 台灣國際專業展</title>
    
    <script type="text/javascript">
    	function initdoc(){
    		//深入浅出ES6（二）：迭代器和for-of循环 Sample
    		// http://www.infoq.com/cn/articles/es6-in-depth-iterators-and-the-for-of-loop
    		var myArray = ['H','e','l','l','o',' ','W','o','r','l','d','!'];
    		for(var index = 0; index < myArray.length; index++){
    			console.log(typeof index + ":" + index);//the type of index is number.
    			console.log(myArray[index]);
    		}
    		
    		console.log('#######################################');
    		
    		myArray.forEach(function(value){
    			console.log(value);
    		});
    		//这种方法也有一个小缺陷：你不能使用break语句中断循环，也不能使用return语句返回到外层函数。
    		
    		console.log('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
    		
    		for(var index in myArray){
    			console.log(typeof index + ":" + index);//the type of index is string.
    			console.log(myArray[index]);
    		}
    		//在这段代码中，赋给index的值不是实际的数字，而是字符串“0”、“1”、“2”，此时很可能在无意之间进行字符串算数计算，
    		//例如：“2” + 1 == “21”，这给编码过程带来极大的不便。
    		//作用于数组的for-in循环体除了遍历数组元素外，还会遍历自定义属性。举个例子，
    		//如果你的数组中有一个可枚举属性myArray.name，循环将额外执行一次，遍历到名为“name”的索引。
    		//就连数组原型链上的属性都能被访问到。
    		//最让人震惊的是，在某些情况下，这段代码可能按照随机顺序遍历数组元素。
    		//简而言之，for-in是为普通对象设计的，你可以遍历得到字符串类型的键，因此不适用于数组遍历。
    		
    		console.log('---------------------------------------');
    		
    		for(var value of myArray){
    			console.log(value);
    		}
    		//这是最简洁、最直接的遍历数组元素的语法
    		//这个方法避开了for-in循环的所有缺陷
    		//与forEach()不同的是，它可以正确响应break、continue和return语句
    		//for-in循环用来遍历对象属性。
    		//for-of循环用来遍历数据—例如数组中的值。
    		//for-of循环不仅支持数组，还支持大多数类数组对象，例如DOM NodeList对象。
    		
    		console.log('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
    		
    		for (var chr of "") {
    			console.log('[' + chr + ']');//空字串,無回傳任何值
			}
    		
    		console.log('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    		
    		for (var chr of "Dear John,") {
    			console.log(chr);
			}
    		//for-of循环也支持字符串遍历，它将字符串视为一系列的Unicode字符来进行遍历
    		
    		console.log('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^');
    		
    		var uniqueWordsSet = new Set('Hello World!');//Safari尚不支持Set
    		for (var chr of uniqueWordsSet) {
    			console.log(chr);
			}
    		//Set, ES6中新增的类型, Set对象可以自动排除重复项
    		//for-of循环也支持Set遍历
    		
    		console.log('`````````````````````````````````````````');
    		
    		var map = new Map([["S01", "John"],["S02", "Kevin"]]);//Safari尚不支持Map
    		map.set("S03","May");
    		map.set("S04","Sue");
    		map.set("S01","Johnson");
    		//for (var [key,value] of map) {//Firefox支持此寫法,但Chrome, Opera尚不支持
    			//console.log('No.' + key + ': ' + value);
    		for (var items of map) {
    			console.log('No.' + items[0] + ': ' + items[1]);
    		}
    		
    		//Safari,IE尚不支持for-of循环。如果你想在web环境中使用这种新语法，同时需要支持IE和Safari，
    		//你可以使用Babel或Google的Traceur这些编译器来将你的ES6代码翻译为Web友好的ES5代码。
    		
    		console.log('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^');
    		
    		var obj = new Object();
    		obj.id = 1;
    		obj.name = 'Simon Chen';
    		obj.phone = '0928999999';
    		for(var attr in obj){
    			console.log(typeof attr + ":" + attr);//the type of index is string.
    			console.log(attr + ':' + obj[attr]);
    		}
    		//for-in的標準用法, 用来遍历对象属性。
    		
    		console.log('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
    		for (var key of Object.keys(obj)) {
  				console.log(key + ": " + obj[key]);
			}
    		//for-of循环不支持普通对象，但如果你想迭代一个对象的属性，
    		//你可以用for-in循环（这也是它的本职工作）或内建的Object.keys()方法
    		//“能工摹形，巧匠窃意。”——巴勃罗·毕卡索
    		//ES6始终坚持这样的宗旨：凡是新加入的特性，势必已在其它语言中得到强有力的实用性证明。
    		
    	}
    </script>
</head>
<body>
<script>initdoc();</script>
</body>
</html>
