<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <main id="container" class="sub_container">
      <div class="sub_visual">
        <img src="/images/sub_visual_img07.jpg" alt="">
        <div class="sub_tit">
          <h2>고객센터</h2>
          <ul class="sub_txt">
            <li class="home_btn">
              <a href="index.html">
                <img src="/images/sub_ico_loca_home.png" alt="홈버튼">
                <span class="blind">홈버튼</span>
              </a>
            </li>
            <li><a href="/List/list">고객센터</a></li>
            <li><p>공지사항</p></li>
          </ul>
        </div>
        <div class="sub_this"><a href="/List/list"><span>공지사항</span></a></div>
      </div>
      <div class="contents">
        <div class="inner">
          <h3 class="board_tit">공지사항</h3>
          <div class="board_search_wrap">
            <form>
              <fieldset>
                <legend>게시물 검색</legend>
                <div class="board_search">
                  <div class="select_wrap">
                    <select>
                      <option>전체</option>
                      <option>제목</option>
                      <option>내용</option>
                    </select>
                  </div>
                  <div class="input_wrap">
                    <input type="search" placeholder="검색어를 입력하세요.">
                    <button type="submit" class="search_btn"><span class="blind">게시물 검색</span></button>
                  </div>
                </div>
              </fieldset>
            </form>
          </div>
          <div class="board_list">
            <table class="tg">
              <thead>
                <tr>
                  <th class="col1">NO</th>
                  <th class="col2">제목</th>
                  <th class="col3"></th>
                  <th class="col4">작성자</th>
                  <th class="col5">게시일</th>
                  <th class="col6">조회수</th>
                </tr>
              </thead>
              <tbody>
              
								<c:forEach var="list" items="${dto }">
	                <tr>
	                  <td class="td_col1">${list.no}</td>
	                  <td class="td_left td_col2"><a href="/List/view?no=${list.no }">${list.title }</a></td>
	                  <td class="file td_col3"></td>
	                  <td class="td_col4"><span class="m_view">작성자</span>${list.writer }</td>
	                  <td class="td_col5"><span class="m_view">게시일</span>
		                  <fmt:parseDate value="${list.date }" var="parseDate" pattern="yyyy-MM-dd HH:mm:ss" />
	                  	<fmt:formatDate value="${parseDate }" pattern="yyyy-MM-dd" />
	                  </td>
	                  <td class="td_col6"><span class="m_view">조회수</span>${list.count}</td>
	                </tr>              	
              	</c:forEach>
              	
              </tbody>
            </table>
            <div class="list_bottom">
              <a href="/List/write" class="write_btn">글쓰기</a>
            </div>
            <div class="board_pagination">
              <a href="#" class="num active">1</a>
            </div>
          </div>
        </div>
      </div>
    </main>
