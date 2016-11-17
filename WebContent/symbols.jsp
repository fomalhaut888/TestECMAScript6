<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Arrow Functions</title>
	<script type="text/javascript">
		function initDoc(){
			//1. symbol是程序创建并且可以用作属性键的值，并且它能避免命名冲突的风险。
			//调用Symbol()创建一个新的symbol，它的值与其它任何值皆不相等。
			//1.1 產生Symbol
			var mySymbol = Symbol();
			var obj = ['0', '1'];
			obj[mySymbol] = "OK!";
			console.log("obj[mySymbol]=" + obj[mySymbol]);//OK!
			obj[mySymbol] = "All Right!";
			console.log("obj[mySymbol]=" + obj[mySymbol]);//All Right!
			//1.2 一般原有陣列方法會忽略Symbol為key的元素
			console.log("obj.length=" + obj.length);//回傳2
			var keys = Object.keys(obj);
			console.log("keys.length=" + keys.length);//回傳2
			for(var key in keys){
				console.log("key=" + key + ",value=" + obj[key]);//只印1, 2, 不印Symbol及對應值
			}
			//1.3 Object.getOwnPropertyNames方法亦會忽略Symbol為key的元素
			var ownPropertyNames = Object.getOwnPropertyNames(obj);
			console.log("ownPropertyNames.length=" + ownPropertyNames.length);//回傳3, 因為加length屬性
			for(var i = 0; i < ownPropertyNames.length; i++){
				console.log(typeof ownPropertyNames[i]);//string
				console.log("ownPropertyNames[" + i + "]=" + ownPropertyNames[i]
						+ ",value=" + obj[ownPropertyNames[i]]);//會多一個length屬性值,對應值是陣列元素個數,但不包括Symbol對應的元素.
			}
			//1.4 Object.getOwnPropertySymbols只回傳陣列的Symbol key.
			var ownPropertySymbols = Object.getOwnPropertySymbols(obj);
			console.log("ownPropertySymbols.length=" + ownPropertySymbols.length);//回傳1
			for(var i = 0; i < ownPropertySymbols.length; i++){//不可以用for(var in)尋訪,會回傳'0'字串
				console.log(typeof ownPropertySymbols[i]);//symbol
				console.log("ownPropertySymbols[" + i + "].toString()=" + ownPropertySymbols[i].toString()
						+ ",value=" + obj[ownPropertySymbols[i]]);
				//Symbol不會自動轉字串,所以要加toString()方法,否則會出現錯誤
				//Uncaught TypeError: Cannot convert a Symbol value to a string(…)
				//toString會回傳Symbol的描述值,一般會回傳Symbol(),可使用Symbol('desc')定義不同的描述值.
			}
			//1.5 再加兩個Symbol key及對應元素至陣列
			mySymbol = Symbol();
			obj[mySymbol] = "No No No!";
			console.log("*** obj[mySymbol]=" + obj[mySymbol]);//No No No!
			mySymbol = Symbol('Hello');
			obj[mySymbol] = "Hi Hi Hi!";
			console.log("*** obj[mySymbol]=" + obj[mySymbol]);//Hi Hi Hi!
			console.log("*** obj.length=" + obj.length);//仍回傳2
			keys = Object.keys(obj);
			console.log("*** keys.length=" + keys.length);//仍回傳2
			ownPropertyNames = Object.getOwnPropertyNames(obj);
			console.log("*** ownPropertyNames.length=" + ownPropertyNames.length);//仍回傳3
			ownPropertySymbols = Object.getOwnPropertySymbols(obj);
			console.log("*** ownPropertySymbols.length=" + ownPropertySymbols.length);//回傳2
			for(var i = 0; i < ownPropertySymbols.length; i++){
				console.log(typeof ownPropertySymbols[i]);
				console.log("*** ownPropertySymbols[" + i + "].toString()=" + ownPropertySymbols[i].toString()
						+ ",value=" + obj[ownPropertySymbols[i]]);
				//toString值相同不代表是相同的Symbol
			}
			
			//2. Symbol不能自動轉字串
			var symbol1 = Symbol('symbol1');//參數字串是Symbol的描述值可做log用,僅識別用,不具意義.
			//console.log('symbol1=' + symbol1);//Uncaught TypeError: Cannot convert a Symbol value to a string(…)
			console.log('symbol1.toString()=' + symbol1.toString());//symbol1.toString()=Symbol(symbol1)
			
			//3. Symbol資料型態
			//1997年JavaScript首次被标准化，那时只有六种原始类型，在ES6以前，
			//JS程序中使用的每一个值都是以下几种类型之一：
			//Undefined 未定义
			//Null 空值
			//Boolean 布尔类型
			//Number 数字类型
			//String 字符串类型
			//Object 对象类型
			//Symbol是ES6之後JavaScript的第七种原始类型
			//每一个symbol都独一无二，不与其它symbol等同，即使二者有相同的描述也不相等
			//三种获取symbol的方法:
			//调用Symbol()
			//调用Symbol.for(string)。
			//使用标准定义的symbol，例如：Symbol.iterator(再探)。
			//ES6中还有其它几处使用了symbol的地方(再探):
			//使instanceof可扩展。
			//消除新特性和旧代码之间的冲突。
			//支持新的字符串匹配类型。
			console.log("typeof symbol1=" + typeof symbol1);
			
			//4. symbol註冊表
			//这种方式会访问symbol注册表，其中存储了已经存在的一系列symbol。
			//这种方式与通过Symbol()定义的独立symbol不同，symbol注册表中的symbol是共享的。
			//如果你连续三十次调用Symbol.for("cat")，每次都会返回相同的symbol。
			//注册表非常有用，在多个web页面或同一个web页面的多个模块中经常需要共享一个symbol。
			var symbol2 = Symbol.for("cat");
			console.log("symbol2.toString()=" + symbol2.toString());
			console.log("(symbol1 == symbol2)=" + (symbol1 == symbol2));
			var symbol3 = Symbol.for("cat");
			console.log("symbol3.toString()=" + symbol3.toString());
			console.log("(symbol2 == symbol3)=" + (symbol2 == symbol3));
		}
	</script>
</head>
<body onload="initDoc()">

</body>
</html>