# 2차 API 설계

## 홈(home)

* **/home.do**
  * 모든 카테고리 및 모든 글 조회

<br>

## 카테고리(Category)

* **/category/list.do?id={category-id}**
  * 해당 카테고리 글 조회
  * 모든 카테고리의 글 조회

* **/category/add.do**
  * 카테고리 추가 => /home 이동
* **/category/delete.do**
  * 카테고리 삭제 => /home 이동
* **/category/update.do**
  * 카테고리 수정 => /home 이동

<br>

## 글(Post)

* **/post/read.do?id={post-id}**
  * 해당 글 조회
* **/post/write.do**
  * 글 작성 페이지 (글 추가 & 수정)
* **/post/add.do**
  * 글 추가
* **/post/update.do**
  * 글 수정
* **/post/delete.do**
  * 글 삭제 => /home.do

## 댓글(Comment)

* **/post/*/comment/add.do?id={post-id}**
  * 해당 댓글 id의 댓글 추가 => /post/read.do?id={post-id} 이동
* **/post/*/comment/delete.do?id={post-id}**
  * 해당 댓글 id의 댓글 삭제 => /post/read.do?id={post-id} 이동

<br>

## 로그인: /auth/login.do

* 로그인 요청

<br>

## 로그아웃: /auth/logout.do

* 로그아웃 요청

<br>

## 회원가입: /auth/join.do

* 회원가입 요청