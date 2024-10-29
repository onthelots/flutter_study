# flutter_bootcamp
- Flutter 부트캠프 (cf. The Complete Flutter Development Bootcamp with Dart)
- Android Studio 기반 주요개념 및 프로젝트 학습 

<br>

## Contents

### Section 1. I Am Rich 
- 기본 앱 형태 구현
- Hot Reload
- 앱 아이콘 사용 (iOS, Android)

title  | content | note
----| ----- | -----
Widget | Flutter앱을 구성하는 모든 컴포넌트 | 참고(https://github.com/youjeonghan/Flutter_Widget_Document)
Assets | 별도의 Assets 폴더 생성 및 파일을 포함시킨 후, pubspec.yaml에서 경로를 설정(폴더) | yaml의 규칙은 줄 바꿈의 경우, 하위 내용을 작성할 시 무조건 2번의 space가 필요

<br>

### Section 2. Mi Card
- Hot Reload, Hot Restart (with. Stateless)
- Layout widgets
    - Single-child layout (Container)
    - Multi-child layout (Column and Rows)
- Aligning Widgets
    - CrossAxisAlignment / mainAxisAlignment 
    - Padding, Margin
- Properties (Card, Sizedbox, Padding, ListTile, Divider, etc..)

title  | content | note
----| ----- | -----
Hot Reload | 특정 위젯의 코드 변경을 실시간으로 UI상에 나타냄. SatelessWidget을 상속받아야 하며, @override를 통해 Widget을 반환하는 build 함수를 구성해야 함 | Stateless, 즉 상태가 정적인 위젯만 적용
Layout widgets | Layout을 구성하는 위젯은 크게 2가지 분류로 구분됨 (single-child, Multi-child) | 참고(https://docs.flutter.dev/ui/widgets/layout)
Container | single-child 도구. 자식 위젯(child)을 하나 포함하며, 크기를 지정하지 않을 경우 자식 위젯의 크기에 맞춰짐 | -
Column | Multi-child 도구. 수직(세로) 방향으로 배치하는 위젯으로, 다수의 자식 위젯(children)을 나열할 수 있음 | -
Row | Multi-child 도구. 수평(가로) 방향으로 배치하는 위젯으로, Column과 동일한 다수의 자식 위젯(children) 활용 가능 | -
mainAxisAlignment | Column 혹은 Row의 주축 방향 | center, start, end, between, around, evently 
CrossAxisAlignment | Column 혹은 Row의 주축 반대 방향 | center, start, end, between, around, evently 


<a href="https://hits.seeyoufarm.com"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fonthelots%2FScoop&count_bg=%230CC0DF&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false"/></a>
