# 2차 요구 사항 설계

## 하위 도메인

* **Member**
* **Category**
  * **Post**
* **Comment**

<br>

## Member

Member(회원)는 Min's Development Blog 홈페이지를 사용하는 사람(관리자, 방문자)이다.

| 번호 | 요구사항             | 상세내용                    |
| ---- | -------------------- | --------------------------- |
| 1    | 로그인, 로그아웃     | id, password 를 통해 로그인 |
| 2    | 회원은 권한을 가진다 | 글을 CRUD 할 수 있다        |

<br>

| 속성      | 설명                 | 세부 요구사항                       |
| --------- | -------------------- | ----------------------------------- |
| id        | 관리자 도메인 식별자 | 1. null 불가<br />2. Auto Increment |
| username  | 계정의 ID            | 1. String                           |
| password  | 계정의 비밀번호      | 1. String                           |
| name      | 관리자 이름          | 1. String                           |
| authority | 권한                 | GUEST, ADMIN                        |

<br>

## Category

Category(범주)는 분야별로 게시글을 저장할 수 있도록 한다.

| 번호 | 요구사항      | 상세내용     |
| ---- | ------------- | ------------ |
| 1    | 카테고리 추가 | ADMIN만 가능 |
| 2    | 카테고리 삭제 | ADMIN만 가능 |
| 3    | 카테고리 수정 | ADMIN만 가능 |

<br>

| 속성 | 설명                   | 세부 요구사항 |
| ---- | ---------------------- | ------------- |
| id   | 카테고리 도메인 식별자 | 1. String     |

<br>

## Post

Post(게시글)는 관리자만 CRUD가 가능하고 방문자는 읽는 것만 가능하다. 게시글에 누구나 댓글을 달 수 있다.

| 번호 | 요구사항      | 상세내용               |
| ---- | ------------- | ---------------------- |
| 1    | 게시글 작성   | ADMIN만 가능           |
| 2    | 게시글 수정   | ADMIN만 가능           |
| 3    | 게시글 삭제   | ADMIN만 가능           |
| 4    | 게시글 읽기   | GUEST, ADMIN 모두 가능 |
| 5    | 게시글 검색   | GUEST, ADMIN 모두 가능 |
| 6    | 마크다운 적용 | javascript를 적용      |

* **마크다운 에디터 git URL** : https://github.com/jbt/markdown-editor

<br>

| 속성    | 설명                 | 세부 요구사항                       |
| ------- | -------------------- | ----------------------------------- |
| id      | 게시글 도메인 식별자 | 1. int<br />2. Auto Increment       |
| image   | 게시글 이미지        | 1. null 가능                        |
| title   | 게시글 제목          | 1. 최소 1글자 이상<br />2. not null |
| author  | 게시글 작성자        | 1. not null                         |
| date    | 작성일               | 1. LocalDate                        |
| content | 게시글 내용          | 1. 최소 1글자 이상<br />2. not null |

<br>

## Coment

Coment(댓글)는 Post에 GUSET, ADMIN 모두 작성할 수 있다.

| 번호 | 요구사항  | 상세내용               |
| ---- | --------- | ---------------------- |
| 1    | 댓글 작성 | GUEST, ADMIN 모두 가능 |
| 2    | 댓글 삭제 | ADMIN만 가능           |

<br>

| 속성    | 설명               | 세부 요구사항                                                |
| ------- | ------------------ | ------------------------------------------------------------ |
| id      | 댓글 도메인 식별자 | 1. not null                                                  |
| postId  | 게시글 식별자      | 1. int<br />2. not null                                      |
| writer  | 작성자             | 1. not null<br />2. String<br />3. ADMIN은 자신의 이름<br />4. GUEST는 따로 작성 |
| date    | 작성일             | 1. LocalDate<br />2. not null                                |
| content | 댓글 내용          | 1. 최소 1글자 이상<br />2. not null                          |

