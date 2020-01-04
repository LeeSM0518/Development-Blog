# 1차 API 설계

## 카테고리(Category)

* **/categories**
  * 카테고리 삽입
  * 모든 카테고리의 글 조회

* **/categories/{category-id}**
  * 해당 카테고리 id의 글 조회
  * 해당 카테고리 id의 카테고리 삭제
  * 해당 카테고리 id의 카테고리 수정

<br>

## 글(Post)

* **/category/{category-id}/posts**
  * 해당 카테고리에 글 삽입
* **/category/{category-id}/posts/{post-id}**
  * 해당 카레고리 id의 해당 글 id를 조회
    * 해당 카테고리 id의 해당 글 id의 댓글 조회
  * 해당 카테고리 id의 해당 글 id를 삭제
  * 해당 카테고리 id의 해당 글 id를 수정

## 댓글(Comment)

* **/category/{category-id}/posts/{post-id}/comment**
  * 해당 글 id의 댓글 추가
* **/category/{category-id}/posts/{post-id}/comment/{comment-id}**
  * 해당 글 id의 댓글 삭제

<br>

## 로그인: /auth/login

* 로그인 요청

<br>

## 로그아웃: /auth/logout

* 로그아웃 요청