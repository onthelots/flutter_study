# flutter_bootcamp
- Flutter 부트캠프 (cf. The Complete Flutter Development Bootcamp with Dart)
- Android Studio 기반 주요개념 및 프로젝트 학습 

<br>

## Contents

`Section 1. I Am Rich`

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

`Section 2. Mi Card`

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

`Section 3. Dicee (Stateful Widget)`

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

`Section 4. Xylophone (speed up development)`

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

`Section 5. modularising_organising_with_oop`

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

`Section 6. Flutter intermediate`

#### 6-1. basic  
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

#### 6-2. Advanced
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

title  | content | note
----| ----- | -----
gestureDetector | 유저 상호작용을 다루는 방식. 모든 제스처를 감지하며, 다양한 유형의 액션 클래스가 정의되어 있음 | -
Enum | 속성들의 묶음. Dart에서는 기본값(Rawvalue)은 직접 할당할 수 없으나, Extension을 통해 직접 정의(on)하거나 혹은 내부 메서드를 통해 수정자로 접근 가능 | -
1급 객체 | 변수 할당, 인자 활용, 반환값 활용 / 3가지의 방식을 통해 Widget을 보다 간단하게 활용할 수 있음 | 폴더 내 프로젝트 참고
navigation | 변수 할당, 인자 활용, 반환값 활용 / 3가지의 방식을 통해 Widget을 보다 간단하게 활용할 수 있음 | -
routes | pushNamed를 통해 명명하여 push 혹은 pop을 실시할 수 있음 | 이름 앞에 반드시 / 키워드가 필요

<br>


<a href="https://hits.seeyoufarm.com"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fonthelots%2FScoop&count_bg=%230CC0DF&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false"/></a>
