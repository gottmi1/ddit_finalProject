<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Begin page -->
    <div class="wrapper">


        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->

            <div class="content mt-5">

                <!-- Start Content-->
                <div class="container-fluid">


                    <div class="row justify-content-center">
                        <div class="col-lg-4">
                            <div class="text-center">
                                <img src="${pageContext.request.contextPath }/resources/assets/images/svg/file-searching.svg" height="90" alt="File not found Image">

                                <h1 class="text-error mt-4">DENIED!</h1>
                                <h4 class="text-uppercase text-danger mt-3">접근 권한이 없습니다.</h4>
                                <p class="text-muted mt-3">접근 권한이 없는 페이지를 요청하고 있습니다 ! <br/> 정상적인 권한이 있는 계정으로 로그인하거나 <br/>다른 페이지를 요청하세요. </p>

                                <a class="btn btn-info mt-3" href="/dashboard"><i class="mdi mdi-reply"></i> 대시보드</a>
                            </div> <!-- end /.text-center-->
                        </div> <!-- end col-->
                    </div>
                    <!-- end row -->

                </div> <!-- container -->

            </div> <!-- content -->


        </div>


