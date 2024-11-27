# flutter_bootcamp
- Flutter 부트캠프 (cf. The Complete Flutter Development Bootcamp with Dart)
- Android Studio 기반 Flutter 주요개념(Widget, 상태관리, 아키텍쳐 등) 및 프로젝트 실습

<br>

## Contents

### 2-1 How to create flutter apps

    1) what is Widgets?

    2) Hot Reload & Hot Restart
    
    3) Assets (iOS, Android)
        - pubspec.yaml
        - add asset, app icon

title  | content | note
----| ----- | -----
Widget | Flutter앱을 구성하는 모든 컴포넌트 | 참고(https://github.com/youjeonghan/Flutter_Widget_Document)
Assets | 별도의 Assets 폴더 생성 및 파일을 포함시킨 후, pubspec.yaml에서 경로를 설정(폴더) | yaml의 규칙은 줄 바꿈의 경우, 하위 내용을 작성할 시 무조건 2번의 space가 필요

<br>


### 2-2 Flutter widgets

    1) Hot Reload, Hot Restart (with. Stateless)

    2) Layout widgets
        - Single-child layout (Container)
        - Multi-child layout (Column and Rows)

    3) Aligning Widgets
        - CrossAxisAlignment / mainAxisAlignment 
        - Padding, Margin

    4) Properties (Card, Sizedbox, Padding, ListTile, Divider, etc..)

title  | content | note
----| ----- | -----
Hot Reload | 특정 위젯의 코드 변경을 실시간으로 UI상에 나타냄. StatelessWidget을 상속받아야 하며, @override를 통해 Widget을 반환하는 build 함수를 구성해야 함 | Stateless, 즉 상태가 정적인 위젯만 적용
Layout widgets | Layout을 구성하는 위젯은 크게 2가지 분류로 구분됨 (single-child, Multi-child) | 참고(https://docs.flutter.dev/ui/widgets/layout)
Container | single-child 도구. 자식 위젯(child)을 하나 포함하며, 크기를 지정하지 않을 경우 자식 위젯의 크기에 맞춰짐 | -
Column | Multi-child 도구. 수직(세로) 방향으로 배치하는 위젯으로, 다수의 자식 위젯(children)을 나열할 수 있음 | -
Row | Multi-child 도구. 수평(가로) 방향으로 배치하는 위젯으로, Column과 동일한 다수의 자식 위젯(children) 활용 가능 | -
mainAxisAlignment | Column 혹은 Row의 주축 방향 | center, start, end, between, around, evently 
CrossAxisAlignment | Column 혹은 Row의 주축 반대 방향 | center, start, end, between, around, evently 

<br>

### 2-3 App state

    1) Widgets
        - Expanded Widget
        - Flutter Outline

    2) Stateful
        - setState()
        - button (Textbutton, etc..)

title  | content | note
----| ----- | -----
Expanded Widget | 단일 위젯이며, 이는 Row 혹은 Column 등 현재 속한 레이아웃에 따라 최대 너비를 채울 수 있게 함 | 'flex' 옵션을 통해, 각각의 요소별 비율을 설정
Widget Option | 위젯을 특정 위젯으로 감싸거나, 삭제하는 등 옵션을 제공 | 단축키 [option + Enter] 혹은 Flutter Outline 활용
Stateful Widget | mutable, 프로퍼티 등 상태 변화에 따라 동적으로 UI가 변경되어야 하는 위젯 클래스 | setState()를 통해 빌드 상황에서 사용자의 인터렉션을 UI에 반영함 (버튼클릭 외)

<br>

### 2-4 Speed up development

    1) Assets + Flutter packages
        - pub.dev (flutter, dart packages)
        - Assets (AudioCache/ AudioPlayer, AssetSource)

    2) Buildkey (deprecated)
        - Widget return method

title  | content | note
----| ----- | -----
Flutter packages | 라이브러리를 종속할 수 있는 dev pub. pubspec.yaml > dependencies 내 라이브러리 이름과 버전을 기입함으로서 종속 | 사용하고자 하는 .dart file 상단에 해당 라이브러리를 import
Assets | 로컬에 존재하는 AudioSource, 즉 오디오 Assets을 사용할 시 해당 인스턴스 생성후 활용 | 경로인 'assets/'는 defaults이므로, 만약 폴더명이 assets이라면 path에 해당 파일명만 작성 
Buildkey | 유사한 Widget이 반복되는 레이아웃일 경우, 해당 Widget 타입을 반환하는 메서드를 생성하는 방식  | -

<br>

### 2-5 Modularising organising with oop

    1) Custom Widget Class

    2) List Widget

    3) Class

    4) Object-Oriented Programming (with refactoring)
        - abstraction / encapsulation / inheritance / polymorphism

title  | content | note
----| ----- | -----
VoidCallback | button action 등 callBack에 관련 타입 | -
_ class name | _는 일종의 private class이며, 이는 타 클래스나 파일에서 접근할 수 없도록 함 | 이는, OOP의 은닉화와 연관
List\<Widget> | multi-layout의 children 타입이며, 초기값을 할당할 경우 반드시 타입을 명기하거나 cast 필요 | -

<br>

### 2-6 Intermediate course

#### 👉🏻 Basic course

    1) ThemeData (cf. CopyWith)

    2) Refactor Widgets
        - extract widget

    3) Final vs Const

title  | content | note
----| ----- | -----
ThemeData | 특정 Widget의 Theme을 설정. 이는 앱 내 공통적으로 활용되는 모듈을 생성하는데 용이함 | dark, light 모드에 따른 분리적용 필요
CopyWith | 특정 모듈, 객체의 속성을 전부 변경시키지 않고, 옵셔널을 통한 특정한 속성을 변경시킬 수 있는 방식 혹은 메서드. 모듈 내 일종의 '변경 가능한 optional Constructor'로 이해할 것 | 폴더 내 프로젝트 참고 (ThemeData와 연관)
extract widget | 지속적으로 사용되는 위젯 모듈을 쉽고 간편하게 하나의 모듈로 명명하는 방식. flutter outline에서, 명명하고자 하는 위젯을 right click > 'Extract Widget' 선택 > 명칭을 설정하면 Stateless Widget 생성 | - 
Const | 불변, immutable. 즉, 상태값이 변경되지 않으며, 컴파일 단계에서 값 자체가 고정되어야 함 | 예시) private key
Final | Const와 유사한 불변성을 가지고 있으나, 이는 런타임 단계(앱 구동)에서 결정된다는 특징이 있음  | 예시) Date(현재시간), final 성격의 stl widget 등
Extension | 클래스, 열거형 등의 기능을 확장하는 역할. <extension> 키워드 뒤에 해당 <확장명>을 별도로 작성할 수 있고, <확장명> 뒤 <on>, 그리고 확장하고자 하는 <객체 이름>을 작성함으로서 내부에 추가적인 기능을 부여 | 예시) extension colorsets on Color
ThemeData | 특정 Widget의 Theme을 설정. 이는 앱 내 공통적으로 활용되는 모듈을 생성하는데 용이함 | dark, light 모드에 따른 분리적용 필요

<br>

#### 👉🏻 Advance course
    1) gestureDetector

    2) Enum
        - enum with extension & method (초기값, RawValue 설정)

    2) first_order_objects (리팩토링)
        - return Widget function
        - reusableCard Class 생성, buildGenderCard method 생성

    4) slider_widget
        - SliderTheme (custom widget)

    5) navigation
        - routes 방식
        - push(pushNamed), pop
        - send_data

title  | content | note
----| ----- | -----
gestureDetector | 유저 상호작용을 다루는 방식. 모든 제스처를 감지하며, 다양한 유형의 액션 클래스가 정의되어 있음 | -
Enum | 속성들의 묶음. Dart에서는 기본값(Rawvalue)은 직접 할당할 수 없으나, Extension을 통해 직접 정의(on)하거나 혹은 내부 메서드를 통해 수정자로 접근 가능 | -
1급 객체 | 변수 할당, 인자 활용, 반환값 활용 / 3가지의 방식을 통해 Widget을 보다 간단하게 활용할 수 있음 | 폴더 내 프로젝트 참고
navigation | 변수 할당, 인자 활용, 반환값 활용 / 3가지의 방식을 통해 Widget을 보다 간단하게 활용할 수 있음 | -
routes | pushNamed를 통해 명명하여 push 혹은 pop을 실시할 수 있음 | 이름 앞에 반드시 / 키워드가 필요

<br>

### 2-7 Live_Data_with_Asynchronous

    1) User permission with both platform (iOS, Android)

    2) dart의 동기와 비동기

    3) Flutter lifeCycle

    4) weather API를 통한 JSON 데이터 파싱

    5) Navigator를 통한 data 전달(+ backwards)

title  | content | note
----| ----- | -----
life cycle | Widget 생성 시, 초기화 - 빌드 - 비 활성화(파괴) 순서로 life cycle이 구성됨 | initState -> build -> deactivate
async-await | 비동기-> 동기화 처리를 위한 방식. async 키워드를 통해 해당 메서드는 '비동기'임을 알리고, 내부에서 await 키워드를 통해 데이터가 반환될때까지 순서를 설정함 | -
Future | 비동기 반환 타입(결과물). 소위 '영수증' 역할을 담당. 지금은 존재하지 않으나, '미래'에 요청한 데이터나 에러가 담기게 됨 | try-catch 구문 참고 (dart_language 폴더 내)
API Decode | JSON 데이터 파싱을 위해, http.get 메서드를 활용하며, 이는 Uri 형식을 반환 / parse(url) | 주로 http 라이브러리를 활용
push, pop | Stack 구조. Navigator.push는 dynamic 반환값을 가지며, 해당 반환값은 스택으로 인해 쌓인 화면에서 pop시 전달할 수 있음 | 7.8 프로젝트 파일 참고

<br>

### 2-8 Flash_chat_with_firebase

    1) Static keyword

    2) Hero Widget

    3) Custom Animation
        - animationController
        - AnimatedTextKit
        - ColorTween

    4) Firebase with Flutter
        - Firebase setup
        - Import Firebase Framwork (auth, firestore)
        - Firebase Auth (UserCredential 생성)
        - fireStore (snapshots-get / add)
        - query 방식

    5) Flutter Streams & StreamBuilder
        - The difference from 'Future'

title  | content | note
----| ----- | -----
Static | building 내부에 귀속, 한 번만 별도의 메모리 공간에 할당되는 정적 타입. 필요에 의해 사용할 시, 리소스 낭비를 줄일 수 있음  | Singleton pattern 참고
Hero Widget | 특정 이벤트, 혹은 A->B 스크린으로 이동 시 간단하게 활용할 수 있는 애니메이션 Widget | Hero Widget, Tag 프로퍼티를 통해 A, B 모두 공유되는 위젯에 할당하고, 스크린 이동을 실시함
Flutter Animation | Ticker(트리거)를 Mixin한 이후, controller 생성을 통해 관리함으로서 커스텀 애니메이션을 구현하는 방식 | controller의 경우, 메모리 누수 문제를 해소하기 위해 반드시 dispose()할 것
Firebase setup | 3.0버전 이상부터는 CLI를 통해 한번에 2개의 플랫폼을 등록할 수 있으며, 각각의 app name을 추가로 설정해야 세팅이 마무리 됨 | Firebase 공식 메뉴얼 참고
Stream | 일회성이 아닌 비동기적 데이터 사용하는 방식. Future와는 달리 데이터의 변화를 계속 감지하고, 처리하는데 용이함 | StreamBuilder와 함께 활용
StreamBuilder | Stream 데이터를 실제 UI 상에 나타내기 위한 Widget. [stream 설정]과 [builder(context, snapshot)] 설정을 통해 구현 가능 | snapshot은 flutter의 AsyncSnapshot으로, 실제 사용하고자 하는(예를 들어 Firestore의 snapshot)타입에 맞춰서 StreamBuilder<'snapshot type'>을 명시함으로 일치시켜야 함

<br>

### 2-9 Provider
    
    1) showModalBottomSheet
        - SingleChildScrollView 
    
    2) ListView & ListTile
        - ListView.builder (itemBuilder, itemCount) - ListTile을 활용한 반복적인 List item 관리

    3) Lifting state up
        - callBack을 통한 상태관리

    4) Provider pattern
        - ChangeNotifier (Model)
        - ChangeNotifierProvider (builder Widget)
        - listen (provider)
        - Consumer (구독)

    5) UnmodifiableListView


title  | content | note
----| ----- | -----
showModalBottomSheet | 흔히 사용하는 모달뷰. 정적이 아닌 동적 모달이며, context와 builder를 통해 내부 위젯을 관리 | -
SingleChildScrollView | 자식 위젯을 Scrollable하도록 만드는 위젯이며, 내부 콘텐츠가 화면의 높이를 초과할 경우 세로 스크롤 기능을 제공함 | MediaQuery를 통해 키보드 등 외부 동작에 의해 화면이 가려지는 영역을 감지하여 관리
ListTile | ListView의 item (reusable) | title, leading, trailing 등 설정된 값에 따라 자동으로 item 영역을 채움
ListView.builder | context와 index을 통해 할당되는 item, 즉 ListTile의 속성을 설정할 수 있음 | itemBuilder와 itemCount 설정
Lifting state up | 'Delegate pattern'과 유사. 상위 위젯에서 하위 위젯의 역할을 위임하며, 이를 콜백함수를 통해 전달함으로서 상태관리를 실시 | -
Provider pattern | 상태 객체를 위젯트리의 상위에서 하위 위젯으로 전달함으로서 상태가 변경될 시, UI를 자동으로 갱신하는 도구 | ChangeNotifier, listen 등의 관리방식이 존재하며, 유연하고 효율적으로 상태관리 가능 
Consumer | 상태변화를 구독하고, 업데이트 하는 위젯이며, '리스닝'을 통해 상태가 변경될 시 UI를 갱신하는 역할을 담당 | 상태가 변경될 시, 해당 부분만 업데이트 되므로 매우 효율적임
UnmodifiableListView | List를 읽기 전용으로 감싸서, 해당 요소를 변경, 추가, 삭제할 수 없으며, 데이터의 불변성을 보장 | dart:collection 라이브러리 내 제공되는 클래스

<br>

<a href="https://hits.seeyoufarm.com"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fonthelots%2FScoop&count_bg=%230CC0DF&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false"/></a>
