# issue-tracker

GitHub의 이슈를 관리하는 서비스와 같이 로그인 이후에 이슈, 마일스톤과 프로젝트를 관리할 수 있는 웹 서비스 입니다.

## 주요 기능

### 로그인

- GitHub 로그인

### ⛄️이슈 관리

- 새로운 이슈 생성(담당자, 레이블, 마일스톤 지정)
- 이슈 수정(담당자, 레이블, 마일스톤 수정)
- 이슈 닫기/열기

### 코멘트 작성

- 새로운 코멘트 생성
- 코멘트 작성자만 코멘트 편집 가능

### 라벨 관리

- 새로운 라벨 생성
- 라벨 수정/삭제

### 마일스톤 관리

- 새로운 마일스톤 생성
- 마일스톤 수정/삭제

---

## 기술 스택

### 클라이언트

- TypeScript
- React
- Recoil
- Styled-component

### 백엔드

- SpringBoot
- MySQL

## 데모

https://user-images.githubusercontent.com/71962505/125658848-78304d34-c115-4ea3-88c2-a0832cbe76cb.mp4

https://user-images.githubusercontent.com/71962505/125659469-394fbb73-c1eb-4473-a995-30d73c28a56e.mp4

### 로딩 시 스켈레톤 UI

![label_skeleton](https://user-images.githubusercontent.com/62237639/123954540-7c3b5980-d9e3-11eb-90e3-319130e93659.gif)

### 에러 처리

![label_error_component](https://user-images.githubusercontent.com/62237639/123954867-dcca9680-d9e3-11eb-8b78-f90261320944.png)

---

## 개발 중 고민

**고민 1** - import type과 import의 차이점

- import에도 차이가 하나 있다는 것을 알게 되었다. TypeScript 3.8의 변경사항 중 하나인 import type과 import의 차이점을 학습하며 프로젝트에도 type으로 선언된 변수들을 명확하게 구분하며 가독성을 높이고 엣지케이스를 대비

**고민 2** - [에러 처리 (400 에러가 catch에서 안 잡힌다?)](https://somedaycode.github.io/daily/2021/06/22/daily2/)

- 개발 도중 서버에 문제가 생겨 로그인 이후의 페이지가 서버로부터 응답을 받지 못해 에러를 발생하였다. 당시 try, catch로 에러를 처리했다고 생각했지만, `400` 이상의 에러가 잡히지 않았다. `400` 이상의 상태에 대해서는 자세한 에러처리가 필요하다는 것을 깨닫게 되었고, **status 정보를 전달하여** 에러처리!
- 추후 400과 500에 차이를 두고 에러를 다르게 `throw`하였음

**고민 3 -** [많은 조건에 따른 필터링을 상태로 관리하는 법](https://github.com/somedaycode/issue-tracker/wiki/%5BFE%5D-%EB%8B%A4%EC%96%91%ED%95%9C-%EC%A1%B0%EA%B1%B4%EC%97%90-%EB%94%B0%EB%A5%B8-%ED%95%84%ED%84%B0%EB%A7%81%EC%9D%84-%EC%83%81%ED%83%9C%EB%A1%9C-%EA%B4%80%EB%A6%AC%ED%95%98%EB%8A%94-%EB%B2%95)

- recoil의 atom과 selector 그리고 pipe 함수를 조합하고 활용하여 더 간단하고 보기 쉬운 로직으로 코드의 가독성을 높임
- selector를 제대로 활용하기에는 아직도 아쉬운점이 많음

**고민 4 -** [함수형 프로그래밍을 어떻게 적용해볼까?](https://github.com/somedaycode/issue-tracker/wiki/%5BFE%5D-%ED%95%A8%EC%88%98%ED%98%95-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D%EC%9D%84-%EC%96%B4%EB%96%BB%EA%B2%8C-%EC%A0%81%EC%9A%A9%ED%95%B4%EB%B3%BC%EA%B9%8C%3F)

- 댓글 혹은 게시물이 생성된 시간을 계산하여 사용자에게 보여줄 때 함수형 프로그래밍을 pipe를 이용해 간단히 적용해보았다. 이후 이렇게 사용한 함수 로직들을 모아서 **NPM에 배포**함
- 함수 로직을 리팩토링하여 좀 더 범용성있는 라이브러리가 될 수 있도록 고민
- [https://www.npmjs.com/package/somedaycode-time](https://www.npmjs.com/package/somedaycode-time)

**고민 5** - JWT 토큰의 내용이 예민한 정보가 아니라면 클라이언트에서 디코드를 해도 되는 걸까?

- 토큰을 서버에서 받아와 로컬스토리지에 저장 후 사용자의 이름, 사진 정보를 사용하고 싶을 때 클라이언트에서 직접 처리를 하는 것이 나은 것인지, 백엔드에서 디코드를 하고 응답으로 받는 것이 나을지 팀원들과 많은 이야기를 나누며 함께 고민하는 시간을 가지게 되었다.
- 크롱(코드스쿼드 마스터분께) 질문을 드리고 토큰을 증명할 때만 사용하고, 그 외의 정보는 요청하는 방향으로 정하게 됨

**고민 6 -** 디코드된 정보(사용자 id, name, avatar_url)를 로컬 스토리지에 저장해도 될까?

- 이러한 정보들은 브라우저 창이 꺼질 때 남아있을 필요가 없으니 세션 스토리지에 저장

## 협업 방식

- 매일 오후 2시에 모여 개발 진행사항을 공유하고 깃헙의 wiki와 issue를 이용하여 개발과 관련된 규칙이나 이슈들을 관리함
- 슬랙을 이용해 문제점이 발생하면 관련 이슈를 공유하고 문제점을 함께 해결하기 위해 이야기를 나누는 시간을 가짐
