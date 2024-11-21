<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <main id="container" class="login_page">
      <div class="contents">
        <div class="inner">
          <div class="login_img"><a href="#"><img src="/images/bnr_login_img01.jpg" alt=""></a>
          </div>
          <div class="login">
            <h2>로그인</h2>
              <form>
                <fieldset>
                  <legend>로그인</legend>
                  <div class="input_wrap">
                    <div class="email_wrap">
                      <input class="input_sec" id="userEmail" type="text" title="이 입력란을 작성하세요" maxlength="99" placeholder="아이디/이메일">
                      <label for="userEmail"><span>아이디/이메일</span></label>
                      <i></i>
                    </div>
                    <div class="password_wrap">
                      <input class="input_sec" id="userPassword" type="password" title="이 입력란을 작성하세요" maxlength="99"
                      placeholder="비밀번호">
                      <label for="userPassword"><span>비밀번호</span></label>
                      <i></i>
                    </div>
                  </div>
                  <button type="submit" class="login_btn">로그인</button>
                </fieldset>
              </form>
              <ul class="login_info">
                <li><a href="#">아이디와 비밀번호를 잊으셨나요?</a></li>
                <li><a href="#">계정이 없으신가요? <span>가입하기</span></a></li>
              </ul>
          </div>
        </div>
      </div>
    </main>
