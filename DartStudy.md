h1. Dart language tour
출처 : https://www.dartlang.org/guides/language/language-tour
```
Dart 특징

변수 안에 있는 모든 것은 'object'
모든 object는 '클래스'의 instance
모든 object는 Object 클래스를 상속 받는다

type이 없다고 명시적으로 말할 때 : dynamic

List<int> 또는 List<dynamic> 같은 generic type을 지원함

Dart는 top-level 함수를 지원함(main()같은). 함수는 class나 object로 묶임
함수 안에 함수를 생성할 수 있음

Java와 다르게 public, protected, private를 지원하지 않음
_로 시작하면 library에 대해 private 속성을 가짐

Dart는 expression(runtime value를 가짐)과 statement(expression 반대)
conditional expression( condition? expr1 : expr2 )은 expr1이나 expr2 값을 가짐
if-else statement는 값을 가지지 않음

```

h3. Variable
```
var name = 'Bob'
// same as
// String name = 'Bob'
// dynamic name = 'Bob'
```
- default value : null
- final and const : 변수 값을 변경하지 않을 때 var 대신 사용
    - final : 한번만 변수 값이 설정됨
    - const : compile-time 상수.
    - final 함수 또는 class 값은 처음에만 초기화됨
```
final name = 'Bob'; // Without a type annotation
final String nickname = 'Bobby';
name = 'Alice'; // Error: a final variable can only be set once.

const bar = 1000000; // Unit of pressure (dynes/cm2)
const double atm = 1.01325 * bar; // Standard atmosphere

var foo = const [];
final bar = const [];
const primaryColors = [
  Color("red", [255, 0, 0]),
  Color("green", [0, 255, 0]),
  Color("blue", [0, 0, 255]),
]; // 처음 선언 시에 값 할당해야 함.
primaryColors = [42]; // Error: Constant variables can't be assigned a value.
```

h3. Built-in types
- number
- string
- boolean
- list
- set
- map
- rune (for expressing Unicode characters in a string)
- symbol

- 'this is a string' 은 string literal 이면서 boolean literal 이다.
- 다트의 변수는 오브젝트임(클래스의 instance). 변수를 초기화할 때 생성자를 사용할 수 있음

h3. Numbers
1. int
- 제한 범위 : 64 bit
- >>, << | 연산자를 포함

2. double
- 64 bit floating-point number

- 두 type은 num의 subtype임
- num은 +,-,/,* 같은 기본 연산자를 포함하고 abs(), ceil(), floor() 등도 있음
(>> 는 int class에 선언됨)
- num이나 subtype에 없으면 dart:math 확인해봐

```
// integer literals
var x = 1;
var hex = 0xDEADBEEF;

// double literals
var y = 1.1;
var exponents = 1.42e5;

// String -> int
var one = int.parse('1');
assert(one == 1);

// String -> double
var onePointOne = double.parse('1.1');
assert(onePointOne == 1.1);

// int -> String
String oneAsString = 1.toString();
assert(oneAsString == '1');

// double -> String
String piAsString = 3.14159.toStringAsFixed(2);
assert(piAsString == '3.14');
```

h3. Strings
- utf-16 code unit
- '' 안에 string 변수를 집어넣을 때 ${expression}을 사용
- +로 string 변수들을 연결할 수 잇음

```
var s = 'string interpolation';

assert('Dart has $s, which is very handy.' ==
    'Dart has string interpolation, ' +
        'which is very handy.');
assert('That deserves all caps. ' +
        '${s.toUpperCase()} is very handy!' ==
    'That deserves all caps. ' +
        'STRING INTERPOLATION is very handy!');
```
```
// These work in a const string.
const aConstNum = 0;
const aConstBool = true;
const aConstString = 'a constant string';

// These do NOT work in a const string.
var aNum = 0;
var aBool = true;
var aString = 'a string';
const aConstList = [1, 2, 3];

const validConstString = '$aConstNum $aConstBool $aConstString';
// const invalidConstString = '$aNum $aBool $aString $aConstList';
```

h3. Booleans
- true or false, 둘다 compile-time constant

h3. lists
- 다른 언어에서 array
- dart의 list는 javascript의 array와 비슷함.
- zero-based index(0부터 시작)
- 리스트의 길이 : list.length
```
// list가 List<int> 타입을 갖고 있음.
// 만약 이 list에 integer가 아닌 오브젝트를 추가한다면 runtime error 발생함
var list = [1, 2, 3];

// constantList[1] = 1 is error
var constantList = const [1, 2, 3];
```
h4. Generics
https://www.dartlang.org/guides/language/language-tour#generics
- API 문서들을 보면 List 타입은 List<E> 로 표기됨.
- <...> 기호는 List를 generic type으로 인식함.
- generic type : formal type parameter를 가지는 타입임
- <>안에 들어가는 기호는 보통 E, T, S, K, V임
- 왜 사용함?
    - 적절하게 구체적인 geric type을 정하는 것은 코드를 더 좋게 만듦
    - generic을 사용하면 코드 중복을 줄일 수 있음
```
var names = List<String>();
names.addAll(['Seth', 'Kathy', 'Lars']);
names.add(42); // Error

// 클래스로 추상화
abstract class ObjectCache {
  Object getByKey(String key);
  void setByKey(String key, Object value);
}

// 타입 제한을 벗어나기
abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}
```
-

h4. Collections
https://www.dartlang.org/guides/libraries/library-tour#collections
- dart는 core collection API를 제공함. API는 list, set, map를 포함하고 있음

h5. Lists
https://api.dartlang.org/stable/2.2.0/dart-core/List-class.html
- List constructor
```
// Use a List constructor.
var vegetables = List();

// Or simply use a list literal.
var fruits = ['apples', 'oranges'];

// Add to a list.
fruits.add('kiwis');

// Add multiple items to a list.
fruits.addAll(['grapes', 'bananas']);

// Get the list length.
assert(fruits.length == 5);

// Remove a single item.
var appleIndex = fruits.indexOf('apples');
fruits.removeAt(appleIndex);
assert(fruits.length == 4);

// Remove all elements from a list.
fruits.clear();
assert(fruits.length == 0);
```
- indexOf() : list에 들어있는 object의 index 찾기
```
var fruits = ['apples', 'oranges'];

// Access a list item by index.
assert(fruits[0] == 'apples');

// Find an item in a list.
assert(fruits.indexOf('apples') == 0);
```
- sort() : 정렬
```
var fruits = ['bananas', 'apples', 'oranges'];

// Sort a list.
fruits.sort((a, b) => a.compareTo(b));
assert(fruits[0] == 'apples');
```

h3. Sets
- 순서 없는 collection
- map과 set이 비슷해보임. map도 똑같이 {}로 감쌈. type을 지정하지 않으면 map<dynamic, dynamic>으로 생성함
```
// Set<String> halogens 로 인식
var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

// Set<String> names = {}; // This works, too.
// var names = {}; // Creates a map, not a set.
var names = <String>{};

var elements = <String>{};
elements.add('fluorine');
elements.addAll(halogens);
assert(elements.length == 5);

final constantSet = const {
  'fluorine',
  'chlorine',
  'bromine',
  'iodine',
  'astatine',
};
// constantSet.add('helium'); // Uncommenting this causes an error.
```

h3. Maps
- key : value 를 포함하는 object
- key와 value는 어떤 타입이 와도 됨.
- key는 중복 안되지만 value는 중복 가능
```
var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings'
};

var nobleGases = {
  2: 'helium',
  10: 'neon',
  18: 'argon',
};

var gifts = Map();
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';

// new Map()으로 안해도 생성됨. new 키워드는 옵션
var nobleGases = Map();
nobleGases[2] = 'helium';
nobleGases[10] = 'neon';
nobleGases[18] = 'argon';

var gifts = {'first': 'partridge'};
gifts['fourth'] = 'calling birds'; // Add a key-value pair
assert(gifts['first'] == 'partridge');
assert(gifts['fifth'] == null);
gifts['fourth'] = 'calling birds';
assert(gifts.length == 2);
```
