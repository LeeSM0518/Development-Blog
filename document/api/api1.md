# 1차 API 설계

전체조회, 삽입 /category

개인조회, 업데이트, 딜리트/category/{category-id}

<br>

## 로그인: /auth/login

* 로그인(/auth/login)
  * post 요청

<br>

## 카테고리: /categories/{category-id}

* **category-id**
  * Main 카테고리는 전체 글 조회
  * Main 이외의 카테고리는 해당 카테고리의 글 조회

<br>

## 글: /categories/{category-id}/posts/{post-id}

* **post-id**
  * 해당 post-id로 글 조회
  * 해당 post-id를 이용하여 댓글(coment)을 조회

<br>

## 글 작성: 