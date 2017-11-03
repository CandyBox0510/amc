<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
	    <!-- open/close -->
        <div class="overlay overlay-hugeinc">
            
            <section class="container">

                <div class="col-sm-4 col-sm-offset-4">
                    <button type="button" class="overlay-close">Close</button>
                    <form id="login-form" class="login" method='get' novalidate=''>
                        <p class="login__title">로그인<br><span class="login-edition">welcome to Americode Cinema!</span></p>

                        <div class="social social--colored">
                                <a href='#' class="social__variant fa fa-facebook"></a>
                                <a href='#' class="social__variant fa fa-twitter"></a>
                                <a href='#' class="social__variant fa fa-tumblr"></a>
                        </div>

                        <p class="login__tracker">환영합니다<br/> 좋은시간보내세요!</p>
                        
                        <div class="field-wrap">
                        <input type='email' placeholder='Email'  id='userId' name='userId' class="login__input">
                        <input type='password' placeholder='Password' id='password' name='password' class="login__input">

                        <input type='checkbox' id='#informed' class='login__check styled'>
                        <label for='#informed' class='login__check-info'>아이디 저장</label>
                         </div>
                        
                        <div class="login__control">
                            <button type='button' id ='login' class="btn btn-md btn--warning btn--wider">로그인</button>
                            <a href="/user/authForm.jsp" class="login__tracker form__tracker">회원 가입</a>
                            <a href="#" class="login__tracker form__tracker">아이디/비밀번호 찾기</a>
                        </div>
                    </form>
                </div>

            </section>
        </div>