<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		//1.不定參數: 函數可接受任意數量的參數.
		//arguments物件: 可取出函數的所有輸入的引數值
		function containsAll(haystack){
			console.debug("arguments[0]=" + arguments[0]);//索引0的arguments值即等於haystack.
			for(var i = 1; i < arguments.length; i++){//第2個引數的arguments索引值為1
				console.debug("arguments[" + i + "]=" + arguments[i]);
				var needle = arguments[i];
				if(haystack.indexOf(needle) === -1){
					return false;
				}
			}
			return true;
		}
		
		//...不定參數語法: 
		function containsAll2(haystack, ...needles){//類似Java的int... args
			for(var needle of needles){
				console.debug("needle=" + needle);
				if(haystack.indexOf(needle) === -1){
					return false;
				}
			}
			return true;
		}
		
		function test(){//測試arguments物件
			var s = '';
			for(var i = 0; i < arguments.length; i++){
				s += (' ' + arguments[i]);
			}
			return s;
		}
		
		function test2(...args){//測試不定參數
			var s = '';
			for(var arg of args){
				s += (' ' + arg);
			}
			return s;
		}
		
		//2.默認參數
		function animalSentence(animal2="tigers", animal3="bears"){
			//return `Lions and ${animal2} and ${animal3}! Oh my!`;
			return 'Lions and ' + animal2 + ' and ' + animal3 + '! Oh my!';
		}
		
		//默认值表达式在函数调用时自左向右求值，这一点与Python不同。这也意味着，默认表达式可以使用该参数之前已经填充好的其它参数值。
		function animalSentenceFancy(animal2="tigers", 
				animal3=(animal2 == "bears")? "sealions":"bears"){
			return 'Lions and ' + animal2 + ' and ' + animal3 + '! Oh my!';
		}
		
		//3.結論
		//3.1 arguments对象可被不定参数和默认参数完美代替.
		//3.2 arguments对象除了破坏可读性外，众所周知，针对JavaScript虚拟机进行的优化会导致一些让你头疼不已的问题。
		//3.3 不定参数和参数默认值可以使一些JavaScript函数定义更富有表现力并且更加可读.
		//3.4 我们期待着不定参数和默认参数可以完全取代arguments，要实现这个目标，标准中增加了相应的限制：在使用不定参数或默认参数的函数中禁止使用arguments对象。
		
		function initDoc(){
			//1.測試不定參數
			console.debug("containsAll(\'This is a book!\', \'T\', \'bo\', \' \', \'is\')=" + containsAll('This is a book!', 'T', 'bo', ' ', 'is'));
			console.debug("containsAll(\'This is a book!\', \'T\', \'bo\', \' \', \'x\')=" + containsAll('This is a book!', 'T', 'bo', ' ', 'x'));
			console.debug("containsAll2(\'This is a book!\', \'T\', \'bo\', \' \', \'is\')=" + containsAll2('This is a book!', 'T', 'bo', ' ', 'is'));
			console.debug("containsAll2(\'This is a book!\', \'T\', \'bo\', \' \', \'x\')=" + containsAll2('This is a book!', 'T', 'bo', ' ', 'x'));
			console.debug('test()=' + test());
			console.debug('test(\'This\', \'is\', \'a\', \'book\', \'!\')=' + test('This', 'is', 'a', 'book', '!'));
			console.debug('test2()=' + test2());
			console.debug('test2(\'This\', \'is\', \'a\', \'book\', \'!\')=' + test2('This', 'is', 'a', 'book', '!'));
			
			//2.測試默認參數
			console.debug("animalSentence()=" + animalSentence());
			console.debug("animalSentence(\"elephants\")=" + animalSentence("elephants"));
			console.debug("animalSentence(\"elephants\", \"whales\")=" + animalSentence("elephants", "whales"));
			console.debug("animalSentenceFancy(\"bears\")=" + animalSentenceFancy("bears"));
		}
	</script>
</head>
<body onload="initDoc()">

</body>
</html>