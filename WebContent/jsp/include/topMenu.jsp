<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <a href="/Open-Banking/index.sj"><img src="/Open-Banking/images/bankLogo3.png" alt="Hair Salon Website Templates Free Download" width="160px" height="90px"></a>
                </div>
                <div class="col-lg-8 col-md-4 col-sm-12 col-xs-12">
                    <div class="navigation">
                        <div id="navigation">
                            <ul>
                                <li class="active"><a href="/Open-Banking/index.sj" title="Home">Home</a></li>
                                <li class="has-sub"><a href="/Open-Banking/service-list.sj" title="마이페이지">MY page</a>
                                    <ul>
                                        <li><a href="/Open-Banking/service-list.sj" title="회원정보">Profile</a></li>
                                        <li><a href="/Open-Banking/service-detail.sj" title="회원정보 수정">Edit profile</a></li>
                                    </ul>
                                </li>
                                <li><a href="/Open-Banking/boardList.sj" title="게시판">Board</a>
<!--                                     <ul>
                                        <li><a href="blog-default.html" title="Blog">Blog Default</a></li>
                                        <li><a href="blog-single.html" title="Blog Single ">Blog Single</a></li>
                                    </ul> -->
                                </li>
                                <li><a href="#" title="Features">Account Management</a>
                                    <ul>
                                        <li><a href="/Open-Banking/openAccount.sj" title="계좌개설">Open an account</a></li>
                                        <li><a href="/Open-Banking/accountList.sj" title="계좌목록">Account List</a></li>
                                        <li><a href="/Open-Banking/accountTransfer.sj" title="계좌이체">Account Transfer</a></li>
                                    </ul>
                                </li>
                                <c:if test="${ empty user }">
	                                <li><a href="/Open-Banking/loginForm.sj">로그인</a> </li>
                                </c:if>	
                                <c:if test="${ not empty user }">
	                                <li>[${ user.name }님 환영합니다]</li>
	                                <li><a href="/Open-Banking/logout.sj">로그아웃</a></li>
                                </c:if>	
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>