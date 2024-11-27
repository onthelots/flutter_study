# dart_beginning
- 다트 기초 학습 (cf. 노마드 코더)
- 각각의 목차별 코드 및 상세 내용(주석)은 폴더 참고 (VS Code로 실행)

<br>

## Contents

### 1-1 Variables
    • variable, 상황에 따른 변수 활용방식
    • null safety (Optinal)

title  | content | note
----| ----- | -----
hello, world | main() 함수를 통한 print | -
variable | 타입추론(Type Inference), 타입 명시(Type Annotation), var | -
dynamic type | 초기화를 하지 않는 변수(dynamic) | 권장하지 않으며, 조건문을 통한 분기처리 필요 
⭐️ null safety | Nullable, Null safety한 변수 생성하기. 타입 뒤 `물음표(?)` | 중괄호 대신, return 방식으로 `Fat Arrow` (=>) 을 활용
final variable | const, 혹은 let과 같은 `상수` | -
⭐️ late variable | 초기값 미 할당 -> `API 통신` 등과 같이 추후 데이터가 추가될 시 활용. 초기화 되기 전까지 참조할 수 없음 | 반드시 해당 변수의 `데이터 타입`을 명시해야 함. Nullable vs late 
constant vairiable | `Compile time`에서 이미 결정되어야 하는 변수 (Ex. secret key) | final vs constant 

<br>

### 1-2 Data Type
    • dart 언에에서 사용되는 데이터 타입
    • 문자열 보간
    • List 내 Collection 방식(if, for)

title  | content | note
----| ----- | -----
Basic data types | String, num, int, double .. | -
String interpolation | `$(머니사인)` 뒤 문자열 보간. 계산식의 경우 `중괄호 { }` 내부에서 활용 | -
⭐️ Lists | 배열. `[a, b, c ..]` 내 요소 할당. `List<Type>` 혹은 타입추론을 통해 사용 | `Collection if` 조건문을 통해 요소 추가 가능
Collection For | List 내, `for( )` 구문을 포함하여 변형 | - 
Map | dictonary와 동일함. key-value 형식. `중괄호 {k:v, k:v .. }` 사용 | `Map<Type, Object>`이며, Object는 `Any` 타입과 동일
Sets | 유니크한 요소. Lists와 동일한 나열 방식이나, `중괄호 {a, b, c .. }` 사용 | `Set<Type>` 타입

<br>

### 1-3 Functions
    • dart 언어에서 사용되는 함수선언 방식
    • 파라미터 (Named, Defaults Value, Required Modified, Optional Positonal)
 
title  | content | note
----| ----- | -----
Function | 리턴 타입은 변수 앞에서 활용되며, 불필요 할 경우 `void`. 리턴타입 대신 `Fat Arrow (=>)` 활용 가능 | -
⭐️ Named Parameters | 함수 호출 시, 각각의 파라미터의 '타이틀'을 명시(일종의 placeholder). 파라미터 scope 전체를 `중괄호 { }`로 씌우기 | -
Defaults Value Parameters | 파라미터의 `초기값` 할당 (null safety) | 파라미터 값을 작성하지 않아도, 초기값이 적용
Required Modified Parameters  | 파라미터 앞에 `required`를 붙여. 반드시 작성해야 하는 파라미터 값으로 만듬 | - 
Optional Positonal Parameters | 특정 파라미터만 작성하지 않도록 만듬. 해당 파라미터에 `대괄호 [ ]`를 씌우고, 타입을 optional(?)로 적용 | 권장하지 않음
QQ Operator | ??, ??= 문법 | -
Typedef | 커스텀 타입 생성. typedef (타입명) = (타입구체화) | -

<br>

### 1-4 Classes
    • dart와 Flutters는 모두 '클래스'로 구성됨
    • Class의 초기화 방식과 this 키워드를 통한 클래스 프로퍼티 참조
    • Constructors란 클래스 내 메서드를 통한 인스턴스 생성 방식에 대한 이해가 필요
    • 추상화 클래스와 상속 방식, 그리고 Mixins(생성자가 없는 클래스)
 
title  | content | note
----| ----- | -----
Class | Class 내 프로퍼티는 반드시 타입을 명시할 것 | `this` 키워드를 통해 선언된 프로퍼티로 접근
⭐️ Constructors | 인스턴스 생성 시, 할당하고자 하는 프로퍼티의 초기값을 `constructors`을 통해 생성 가능 (initalizer) | 상세 코드 참고 (일반, 축약 방식)
⭐️ Named Constructors Parameters | 함수에서의 Named 방식과 동일. 초기화 할 파라미터 전체를 `대괄호 { }` 로 감싸 활용 | defaults Value, required Modified 활용 가능
Cascade Notation | 인스턴스의 속성을 변경할 시, 연속된 코드를 방지하고자 `..` 키워드를 통해 인스턴스 자체를 참조할 수 있음 | - 
⭐️ Enum | 타 언어와 동일한 Enumeration. 중괄호 { } 내 케이스 작성후 수정자(.)로 접근 | 🚫 Raw Value 방식에 대한 추가 스터디 필요
Abstract Classes | protocol과 유사. class 앞 `abstract` 키워드를 붙여 활용하며, 상속 클래스에서는 `extends` 키워드 뒤 상속 클래스 명시 | 상세 코드 참고
⭐️ Inheritance | 추상화 클래스와는 달리, 구체적인 로직이 포함되며, 이를 하위클래스에서 활용. `extends` 키워드 뒤 상속 클래스 명시 | 초기화 시 `super`, 메서드 `override` 방식 참고
⭐️ Mixins | 상속이 아닌, '포함'의 개념. 생성자가 없는 클래스이며, 클래스 앞에 `mixin` 키워드를 명시. 포함할 클래스 뒤 `with` 키워드를 작성한 후, mixin 클래스를 순서대로 명시 | 상세 코드 참고

<br>

<a href="https://hits.seeyoufarm.com"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fonthelots%2FScoop&count_bg=%230CC0DF&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false"/></a>
