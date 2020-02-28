# 4차 API 설계

## 카테고리(Category)

* **/category/list.do?cid={category-id}**
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
* **/post/add.do**
  * 글 추가
* **/post/update.do**
  * 글 수정
* **/post/delete.do**
  * 글 삭제 => /home.do

## 댓글(Comment)

* **/comment/add.do?id={post-id}**
  * 해당 댓글 id의 댓글 추가 => /post/read.do?id={post-id} 이동
    * **CommentAddController.java**
* **/comment/delete.do?id={post-id}**
  * 해당 댓글 id의 댓글 삭제 => /post/read.do?id={post-id} 이동
    * **CommentDeleteController.java**

<br>

* **PostgresSqlCommentDao.xml**

  ```xml
  <select id="selectListOnPost" parameterType="int" resultMap="commentResultMap">
    select id, writer, date, content, post_id
    from comment
    where post_id=#{value}
  </select>
  
  <insert id="insert" parameterType="comment">
    insert into comment (id, writer, date, content, post_id)
    values (DEFAULT, #{writer}, now(), #{content}, #{postId})
  </insert>
    
  <delete id="delete" parameterType="int">
    delete from comment
    where id=#{value}
  </delete>
  ```

* **CommentDao.java**

  ```java
  List<Comment> selectListOnPost(int postId) throws Exception;
  int insert(Comment comment) throws Exception;
  int delete(int id) throws Exception;
  ```

<br>

## 로그인: /auth/login.do

* 로그인 요청

<br>

## 로그아웃: /auth/logout.do

* 로그아웃 요청

<br>

## 회원가입: /auth/join.do

* 회원가입 요청