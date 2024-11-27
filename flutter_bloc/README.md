# Flutter_bloc
- 목차별 폴더 내 더 **자세한 학습 내용**과 관련 **프로젝트**가 포함되어 있습니다.
- Bloc 8.0 이상 환경에서 

<br>

# contents

[1-Introduce](#1-Introduce)
  - [1-1 Bloc을 사용하는 이유](#1-1-Bloc을-사용하는-이유)

[2-Stream](#2-Stream)
  - [2-1 Future](#2-1-Future)
  - [2-2 Stream 이해하기](#2-2-Stream-이해하기)

[3-Bloc Wideget](#3-Bloc-Wideget)
  - [3-1 Bloc Wideget](#3-1-Bloc-Wideget)

[4-Bloc Core and Cubit](#4-Bloc-Core-and-Cubit)
  - [4-1 Bloc Core and Cubit](#4-1-Bloc-Core-and-Cubit)

[5-Bloc vs Cubit](#5-Bloc-vs-Cubit)
  - [5-1 Bloc vs Cubit](#5-1-Bloc-vs-Cubit)

[6-Bloc concurrency](#6-Bloc-concurrency)
  - [6-1 Bloc concurrency](#6-1-Bloc-concurrency)

[7-bloc 상태관리](#7-bloc-상태관리)
  - [7-1 bloc 상태관리](#7-1-bloc-상태관리)

[8-bloc간 통신방법](#8-bloc간-통신방법)
  - [8-1 bloc간 통신방법](#8-1-bloc간-통신방법)

<br>

## 1-Introduce

### 1-1 Bloc을 사용하는 이유 
  #### ❑ 기존 상태관리의 문제점
  - Stateful Widget을 활용하게 되면, setState() 메서드를 통해 re-build 과정을 통해 UI를 다시 그리는 과정을 거치게 됨
  - 하지만, 위와 같은 방식(lifting up state)을 사용하게 되면 다음과 같은 문제가 발생할 우려가 있음
    - _영향을 받지 않아도 되는 화면에서도 불필요한 re-build_
    - _위젯트리 내부에서 참조되는 모든 화면, Widget Tree를 모두 수정해야 하는 불편함_
    - _콜백 지옥..  등등_

  - 따라서, 기존과 같은 상태관리의 비 효율성, 구조적 문제를 해결하고자 Provider, GetX, Bloc 등 다양한 대안들이 등장함


  #### ❑ Bloc Pattern
  - 'Business Logic component' 비즈니스 로직과 UI를 분리하여 만드는 방식을 의미함
  - 쉽게 말해 UI는 상태값이나, 이를 트리거하는 로직에 대해 전혀 알 필요가 없고, 단순히 'event'만 전달하게 되고,
  - 'Bloc component'에서 이벤트 처리와 상태관리를 진행한 후, UI에게 'Stream' 방식으로 변경된 상태값을 전송하게 됨
    - 즉, [구독]하고 있는 UI만 갱신, re-build되며 매우 효과적인 패턴이 구성됨
  
  - 효율적이나, 단점이 없는것은 아닌데..
    - 이는 '관리'하고자 하는 파일, bloc이 늘어남
    - 러닝커브가 매우 높다


  #### ❑ Bloc을 사용해야 하는 5가지 이유
  - UI 영역과 비즈니스 영역을 쉽게 구분할 수 있다.

  - 테스트 하기가 쉽고, 재 사용을 가능하게 해준다. 
    - _TDD를 가능하게 함_
    - _'Bloc Test'를 통해 테스트를 실시할 수 있음_
    - 공통된 위젯이나 혹은 비즈니스 로직을 재 사용할 수 있음

  - 이벤트 트래킹을 통합적으로 관리할 수 있다.
    - Bloc Observer를 통해 트래킹 관리가 가능함

  - 하나의 코드 베이스로 협업할 수 있다.
    - Bloc은 하나의 Rule이 정해져 있기 때문에, 다른 개발자와 함께 협업하기 용이함
    - 또한, Bloc으로 구성된 타 프로젝트를 접하는데 있어서도 빠르게 이해할 수 있음

  - 다수의 개발자들이 사용하는 도구이다.

<br>

## 2-Stream

### 2-1 Future
  #### ❑ Future의 역할
  - Flutter에서 비동기적 작업을 수행할 때 사용함
  - 보통, API 통신을 통해 데이터를 얻고자 할 때, Future를 주로 사용함
  
  #### ❑ 동기적 프로세스 vs 비동기적 프로세스

  특징  | 동기적 프로세스 | 비동기적 프로세스
----| ----- | -----
요청 처리방식 | 요청을 보내고 응답을 받을 때까지 다른 작업을 하지 않음 | 요청을 보내고, 응답을 기다리는 동안 다른 작업을 수행함
프로그램 흐름 | 요청-응답이 완료될 때 까지, 프로그램은 멈춰있음 | 요청-응답이 완료되지 않아도, 다른 작업이 진행됨
예시(API 호출) | 요청을 보내고, 응답이 올 때 까지 로딩 인디케이터나, 스크롤 등 사용자 인터렉션이 불가능함 | 요청을 보내고 나서 UI-blocking이 되지 않아 사용자의 인터렉션이 가능함

<br>

### 2-2 Stream 이해하기
  #### ❑ Stream이란?
  - 데이터의 흐름
    - 이는 [퍼블리싱-구독] 방식을 통해 진행하며, '구독자'는 '퍼블리셔'간의 스트림이 형성됨에 따라 데이터 처리가 가능함
  
  #### ❑ (예시) 넷플릭스 앱
  - 크게 3개의 섹션으로 구분되며, 각각 응답 및 UI 상에 나타나는 까지의 시간이 <빠름/보통/늦음>으로 구분된다고 가정함
  - 또한, 코드 순서 상 광고 👉🏻 Hot&New 👉🏻 인기 급상승 순으로 작성되었다고 가정했을 때
    - _광고(늦음)_
    - _Hot & New(빠름)_
    - _인기 급상승(수시로 데이터가 변경됨)_

 섹션 | 동기 | 비동기 | Stream
----| ----- | ----- | -----
광고(늦음) | 1 | 3 | 3
Hot & New(빠름) | 2 | 1 (가장 먼저 나타남) | 1 (가장 먼저 나타남)
인기 급상승 (보통) | 3 | 2 (변경되지 않음) | 2 (⭐️Stream으로 인해, 실시간으로 데이터를 전달받아 업데이트)

<br>

## 3-Bloc Wideget

### 3-1 Bloc Wideget
    - Bloc에서 제공하는 위젯은 다음과 같음
    - 예제 소스코드 확인 (⭐️폴더 내 bloc_widget_sample 파일 참고)

  #### ❑ Bloc Widgets (1)
  - Bloc Provider / Bloc Multi Provider 
  - Bloc Builder
  - Repository Provider / MultiRepository Provider

Widget | content | note
----| ----- | -----
BlocProvider | 비즈니스 로직이 담긴 Bloc을 create를 통해 반환(구독상품 생성)하고, 영향을 받을 Widget을 child내 read를 통해 event를 전달 | lazy 옵션 제공
MultiBlocProvider | BlocProvider를 다중 등록하는 방식 | providers라는 List 내 등록할 BlocProvider를 작성
BlocBuilder | BlocProvider로 생성된 bloc을 사용할 때 변화를 감지하는 용도로 활용 | bloc class와 state의 타입을 Generic 타입으로 선언해야 함
RepositoryProvider | 데이터를 관리하는 클래스, 즉 저장소를 제공하는 위젯. DB 혹은 API 통신을 관리할 때 활용 | repository라는 비즈니스 로직을, 별도의 Bloc에 주입하여 처리하는 방식
MultiRepositoryProvider | RepositoryProvider를 여러개 등록하는 방식. MultiBlocProvider 방식과 동일 | -

<br>

  #### ❑ Bloc Widgets (2)
  - Bloc Selector
  - Bloc Listener / MultiBlocListener
  - BlocConsumer

Widget | content | note
----| ----- | -----
Bloc Selector | - | -
Bloc Listener | - | -
MultiBlocListener | - | -
BlocConsumer | - | -


### 4-Bloc Core and Cubit

### 4-1 Bloc Core and Cubit
    1) bloc의 작동방식

title  | content | note
----| ----- | -----
abc | abc  | abc 

<br>

### 5-Bloc vs Cubit

### 5-1 Bloc vs Cubit
    1) bloc의 작동방식

title  | content | note
----| ----- | -----
abc | abc  | abc 

<br>

### 6-Bloc concurrency

### 6-1 Bloc concurrency
    1) bloc의 작동방식


title  | content | note
----| ----- | -----
abc | abc  | abc 

<br>

### 7-bloc 상태관리

### 7-1 bloc 상태관리
    1) bloc의 작동방식


title  | content | note
----| ----- | -----
abc | abc  | abc 

<br>

### 8-bloc간 통신방법

### 8-1 bloc간 통신방법
    1) bloc의 작동방식


title  | content | note
----| ----- | -----
abc | abc  | abc 

<br>

<a href="https://hits.seeyoufarm.com"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fonthelots%2FScoop&count_bg=%230CC0DF&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false"/></a>
