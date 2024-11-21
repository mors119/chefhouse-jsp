<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <main id="container" class="sub_container">
      <div class="sub_visual">
        <img src="images/sub_visual_img07.jpg" alt="">
        <div class="sub_tit">
          <h2>고객센터</h2>
          <ul class="sub_txt">
            <li class="home_btn">
              <a href="index.html">
                <img src="images/sub_ico_loca_home.png" alt="홈버튼">
                <span class="blind">홈버튼</span>
              </a>
            </li>
            <li><a href="release-list.html">고객센터</a></li>
            <li><a href="release-view.html">공지사항</a></li>
            <li><p>게시물 작성하기</p></li>
          </ul>
        </div>
        <div class="sub_this"><a href="#"><span>게시물 작성하기</span></a></div>
      </div>
      <div class="contents">
        <div class="inner">
          <div class="board_write">
            <form>
              <fieldset>
                <legend>게시물 작성하기</legend>
                <h3 class=" board_tit">게시물 작성하기</h3>
                <p class="note"><i class="star"></i>표시는 필수 입력 사항입니다.</p>
                <table>
                  <caption class="nohead">게시물 작성하기 테이블</caption>
                  <tr>
                    <th>이름<i class="star"></i></th>
                    <td><input type="text" placeholder="이름을 입력해주세요" title="이름을 입력해주세요"></td>
                  </tr>
                  <tr>
                    <th>제목<i class="star"></i></th>
                    <td><input type="text" placeholder="제목을 입력해주세요" title="제목을 입력해주세요"></td>
                  </tr>
                  <tr>
                    <th class="th_top">내용<i class="star"></i></th>
                    <td><textarea placeholder="게시물 내용을 작성해 주세요" title="게시물 내용을 작성해 주세요" rows="10"></textarea></td>
                  </tr>
                  <tr>
                    <th>첨부파일</th>
                    <td class="td_flex">
                      <div class="file_wrap">
                        <input type="text" readonly>
                        <label>
                          <input type="file" class="blind">
                          파일선택
                        </label>
                      </div>
                      <p class="file_note">※ 등록 가능 확장자 : pdf,docx,pptx,xlsx,jpg,jpeg,gif,png / 최대 5MB</p>
                    </td>
                  </tr>
                </table>
                <div class="btn_wrap">
                  <a class="point_btn4" href="release-list.html">작성완료</a>
                  <a class="point_btn5" href="release-list.html">취소</a>
                </div>
              </fieldset>
            </form>
          </div>
        </div>
      </div>
    </main>
