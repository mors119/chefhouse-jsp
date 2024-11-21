<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    

    <main id="container" class="sub_container">
      <div class="sub_visual">
        <img src="/images/sub_visual_img07.jpg" alt="">
        <div class="sub_tit">
          <h2>고객센터</h2>
          <ul class="sub_txt">
            <li class="home_btn">
              <a href="/Main">
                <img src="/images/sub_ico_loca_home.png" alt="홈버튼">
                <span class="blind">홈버튼</span>
              </a>
            </li>
            <li><a href="/List.list">고객센터</a></li>
            <li><p>공지사항</p></li>
          </ul>
        </div>
        <div class="sub_this"><a href="/List/list"><span>공지사항</span></a></div>
      </div>
      <div class="contents">
        <div class="inner">
          <h3 class="board_tit">공지사항</h3>
          <div class="board_view">
            <div class="view_top">
              <a href="/List/modify" class="modify_btn">수정하기</a>
            </div>
            <div class="view_tit_wrap">
              <h3 class="view_tit">${dto.title}</h3>
              <div class="view_txt">
                <p><strong>작성자</strong>${dto.writer }</p>
                <p>
                	<strong>게시일</strong>
             	    <fmt:parseDate value="${dto.date }" var="parseDate" pattern="yyyy-MM-dd HH:mm:ss" />
                 	<fmt:formatDate value="${parseDate }" pattern="yyyy-MM-dd" />
                </p>
                <p><strong>조회수</strong>${dto.count }</p>
              </div>
            </div>
            <div class="view_con">
              ${dto.content}
            </div>
            <div class="view_paging_wrap">
              <dl class="view_paging">
                <dt>이전글<i></i></dt>
                <dd><a href="/List/view?no=${dto.prev == 0 ? dto.no : dto.prev }" >${dto.prevTitle}</a></dd>
              </dl>
              <dl class="view_paging">
                <dt>다음글<i class="next"></i></dt>
                <dd><a href="/List/view?no=${dto.next == 0 ? dto.no : dto.next }" >${dto.nextTitle}</a></dd>
              </dl>
            </div>
            <div class="btn_wrap">
              <a class="point_btn3" href="/List/list">목록</a>
            </div>
          </div>
        </div>
      </div>
    </main>