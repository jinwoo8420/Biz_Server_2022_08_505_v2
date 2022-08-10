# 서버프로그램 구현 프로젝트
* 과제 수행을 위한 프로젝트
* 일시 : 2022. 08. 08, 2022. 08. 09
* 작성자 : 1223wlsdn@naver.com

## 프로젝트 개요
* Spring Framework : 5.2.22.RELEASE
* Spring Security : 5.3.13.RELEASE
* MySQL 8.x
* MyBatis 3.5.x

## 계층구조 Context
* Context : 하나의 어떤 Task(작업) 구성요소가 모두 포함된 하나의 데이터 그룹, 일반적으로 운영제체와 밀접한 관계의 데이터

### Tomcat Context
* Spring MVC 기반의 프로젝트를 구현하면 프로젝트들이 Tomcat의 Server.xml 설정에 기록이 된다. Tomcat은 외부의 요청이 들어오면 이 Context를 확인하여 어떤 프로젝트에게 Request를 전달할지 판단을 한다.

### Root Context
* web.xml의 Context-param에 설정된 영역의 Context
* 한 프로젝트의 공통된 설정, 공통된 기능을 정의하는 곳
* Spring Security와 연동되는 프로젝트는 여기에 설정 파일을 만든다

### Servlet Context
* 실제로 MVC 패턴에 의해 사용자의 Request를 수신하고 Service와 Dao등을 사용하여 비즈니스 로직을 처리하고 결과를 사용자에게 Response하는 영역
* 한개의 Root Context에 다수의 Servlet Context가 있을 수 있다
* 실제로는 대부분 한개의 Root / 한개의 Servlet 형식으로 구현이 된다

### Spring Security와 DBMS가 연동되는 프로젝트
* 일반적으로 Security 설정을 Root Context에 두고 DBMS 설정을 Servlet Context 영역에 두는데 Security에서 DB의 사용자 정보, 권한 정보를 활용하고자 할 때 상당히 많은 연결 구조가 필요해진다
* 여기에서는 Security와 DBMS 설정을 Root Context 영역에 두어 연결구조를 최소화하였다
* Component Scan을 할 때 servlet-context.xml와 별도로 security-context.xml에서도 실행해주어야한다
* service 패키지 아래 impl 패키지와 auth 패키지를 구분하여 servlet, security context에서 scan을 할 때 혹시 모를 충돌을 대비했다

### Component를 Scan하는 곳
* servlet-context.xml : controller, service.impl => MVC 패턴의 기본 Scan
* security-context.xml : service.auth => Security 인증과 관련된 Scan
* mybatis-context.xml : mybatis-spring:scan => Dao를 Scan하고 mapper.xml과 연결하여 실질적으로 DB에 연결하는 코드 생성
* Scan 설정이 잘못되어 프로젝트가 실행하는 과정에서 bean이 생성되지 않으면 ```NoQualifyingBean```과 같은 오류가 발생한다