<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Notifications | Hyper - Responsive Bootstrap 5 Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />

    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.ico">

    <!-- Plugin css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendor/jquery-toast-plugin/jquery.toast.min.css">

    <!-- Theme Config Js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/hyper-config.js"></script>

    <!-- App css -->
    <link href="${pageContext.request.contextPath }/resources/assets/css/app-saas.min.css" rel="stylesheet" type="text/css" id="app-style" />

    <!-- Icons css -->
    <link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <!-- Begin page -->
    <div class="wrapper">


        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->

        <div class="content-page">
            <div class="content">

                <!-- Start Content-->
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Hyper</a></li>
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Base UI</a></li>
                                        <li class="breadcrumb-item active">Notifications</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Notifications</h4>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">

                                    <h4 class="header-title">Bootstrap Toasts</h4>
                                    <p class="text-muted font-14">Push notifications to your visitors with a toast, a
                                        lightweight and easily customizable alert message.</p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#bootstrap-toasts-preview" data-bs-toggle="tab" aria-expanded="false" class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#bootstrap-toasts-code" data-bs-toggle="tab" aria-expanded="true" class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="bootstrap-toasts-preview">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <h5 class="mb-2">Basic</h5>
                                                    <p class="text-muted font-14">Toasts are as flexible as you need and
                                                        have very little required markup. At a minimum, we
                                                        require a single element to contain your “toasted” content and
                                                        strongly encourage a dismiss button.</p>
                                                    <div class="p-3">

                                                        <div class="toast fade show" role="alert" aria-live="assertive" aria-atomic="true">
                                                            <div class="toast-header">
                                                                <img src="${pageContext.request.contextPath }/resources/assets/images/logo-dark-sm.png" alt="brand-logo" height="16" class="me-1" />
                                                                <strong class="me-auto">Hyper</strong>
                                                                <small>11 mins ago</small>
                                                                <button type="button" class="ms-2 btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                                            </div>
                                                            <div class="toast-body">
                                                                Hello, world! This is a toast message.
                                                            </div>
                                                        </div>
                                                        <!--end toast-->

                                                    </div>
                                                </div> <!-- end col-->
                                                <div class="col-md-6">
                                                    <h5 class="mb-2">Translucent</h5>
                                                    <p class="text-muted font-14">Toasts are slightly translucent, too,
                                                        so they blend over whatever they might appear over.
                                                        For browsers that support the backdrop-filter CSS property,
                                                        we’ll also attempt to blur the elements under a toast.</p>

                                                    <div class="p-3 bg-light">
                                                        <div class="toast fade show" role="alert" aria-live="assertive" aria-atomic="true">
                                                            <div class="toast-header">
                                                                <img src="${pageContext.request.contextPath }/resources/assets/images/logo-dark-sm.png" alt="brand-logo" height="16" class="me-1" />
                                                                <strong class="me-auto">Hyper</strong>
                                                                <small>11 mins ago</small>
                                                                <button type="button" class="ms-2 btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                                            </div>
                                                            <div class="toast-body">
                                                                Hello, world! This is a toast message.
                                                            </div>
                                                        </div>
                                                        <!--end toast-->
                                                    </div>
                                                </div> <!-- end col-->
                                            </div>
                                            <!-- end row-->

                                            <div class="row">
                                                <div class="col-md-6 mt-4">
                                                    <h5 class="mb-2">Stacking</h5>
                                                    <p class="text-muted font-14">When you have multiple toasts, we
                                                        default to vertiaclly stacking them in a readable manner.</p>
                                                    <div class="p-3">
                                                        <div aria-live="polite" aria-atomic="true" style="position: relative; min-height: 200px;">
                                                            <!-- Position it -->
                                                            <div class="toast-container" style="position: absolute; top: 0; right: 0;">

                                                                <!-- Then put toasts within -->
                                                                <div class="toast fade show" role="alert" aria-live="assertive" aria-atomic="true">
                                                                    <div class="toast-header">
                                                                        <img src="${pageContext.request.contextPath }/resources/assets/images/logo-dark-sm.png" alt="brand-logo" height="16" class="me-1" />
                                                                        <strong class="me-auto">Hyper</strong>
                                                                        <small class="text-muted">just now</small>
                                                                        <button type="button" class="ms-2 btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="toast-body">
                                                                        See? Just like this.
                                                                    </div>
                                                                </div>
                                                                <!--end toast-->

                                                                <div class="toast fade show" role="alert" aria-live="assertive" aria-atomic="true">
                                                                    <div class="toast-header">
                                                                        <img src="${pageContext.request.contextPath }/resources/assets/images/logo-dark-sm.png" alt="brand-logo" height="16" class="me-1" />
                                                                        <strong class="me-auto">Hyper</strong>
                                                                        <small class="text-muted">2 seconds ago</small>
                                                                        <button type="button" class="ms-2 btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="toast-body">
                                                                        Heads up, toasts will stack automatically
                                                                    </div>
                                                                </div>
                                                                <!--end toast-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div> <!-- end col-->
                                                <div class="col-md-6 mt-4">
                                                    <h5 class="mb-2">Placement</h5>
                                                    <p class="text-muted font-14">Place toasts with custom CSS as you
                                                        need them. The top right is often used for
                                                        notifications, as is the top middle. If you’re only ever going
                                                        to show one toast at a time, put the positioning
                                                        styles right on the <code>.toast</code>.</p>
                                                    <div class="p-3">
                                                        <div aria-live="polite" aria-atomic="true" class="d-flex justify-content-center align-items-center" style="min-height: 200px;">

                                                            <!-- Then put toasts within -->
                                                            <div class="toast fade show" role="alert" aria-live="assertive" aria-atomic="true" data-bs-toggle="toast">
                                                                <div class="toast-header">
                                                                    <img src="${pageContext.request.contextPath }/resources/assets/images/logo-dark-sm.png" alt="brand-logo" height="16" class="me-1" />
                                                                    <strong class="me-auto">Hyper</strong>
                                                                    <small>11 mins ago</small>
                                                                    <button type="button" class="ms-2 btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                                                </div>
                                                                <div class="toast-body">
                                                                    Hello, world! This is a toast message.
                                                                </div>
                                                            </div>
                                                            <!--end toast-->
                                                        </div>
                                                    </div>
                                                </div> <!-- end col-->
                                            </div>
                                            <!-- end row-->
                                        </div> <!-- end preview-->

                                        <div class="tab-pane code" id="bootstrap-toasts-code">
                                            <button class="btn-copy-clipboard" data-clipboard-action="copy">Copy</button>
                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;!-- Basic Toast --&gt;
                                                        &lt;div class=&quot;toast fade show&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; aria-atomic=&quot;true&quot;&gt;
                                                            &lt;div class=&quot;toast-header&quot;&gt;
                                                                &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/logo-dark-sm.png&quot; alt=&quot;brand-logo&quot; height=&quot;12&quot; class=&quot;me-1&quot; /&gt;
                                                                &lt;strong class=&quot;me-auto&quot;&gt;Hyper&lt;/strong&gt;
                                                                &lt;small&gt;11 mins ago&lt;/small&gt;
                                                                &lt;button type=&quot;button&quot; class=&quot;ms-2 btn-close&quot; data-bs-dismiss=&quot;toast&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
                                                            &lt;/div&gt;
                                                            &lt;div class=&quot;toast-body&quot;&gt;
                                                                Hello, world! This is a toast message.
                                                            &lt;/div&gt;
                                                        &lt;/div&gt; &lt;!--end toast--&gt;
                                                        
                                                        &lt;!-- Translucent Toast --&gt;
                                                        &lt;div class=&quot;toast fade show&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; aria-atomic=&quot;true&quot;&gt;
                                                            &lt;div class=&quot;toast-header&quot;&gt;
                                                                &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/logo-dark-sm.png&quot; alt=&quot;brand-logo&quot; height=&quot;12&quot; class=&quot;me-1&quot; /&gt;
                                                                &lt;strong class=&quot;me-auto&quot;&gt;Hyper&lt;/strong&gt;
                                                                &lt;small&gt;11 mins ago&lt;/small&gt;
                                                                &lt;button type=&quot;button&quot; class=&quot;ms-2 btn-close&quot; data-bs-dismiss=&quot;toast&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
                                                            &lt;/div&gt;
                                                            &lt;div class=&quot;toast-body&quot;&gt;
                                                                Hello, world! This is a toast message.
                                                            &lt;/div&gt;
                                                        &lt;/div&gt; &lt;!--end toast--&gt;
                                                        
                                                        &lt;!-- Stacking Toast --&gt;
                                                        &lt;div aria-live=&quot;polite&quot; aria-atomic=&quot;true&quot; style=&quot;position: relative; min-height: 200px;&quot;&gt;
                                                            &lt;!-- Position it --&gt;
                                                            &lt;div class=&quot;toast-container&quot; style=&quot;position: absolute; top: 0; right: 0;&quot;&gt;
                                                            
                                                                &lt;!-- Then put toasts within --&gt;
                                                                &lt;div class=&quot;toast fade show&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; aria-atomic=&quot;true&quot;&gt;
                                                                    &lt;div class=&quot;toast-header&quot;&gt;
                                                                        &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/logo-dark-sm.png&quot; alt=&quot;brand-logo&quot; height=&quot;12&quot; class=&quot;me-1&quot; /&gt;
                                                                        &lt;strong class=&quot;me-auto&quot;&gt;Hyper&lt;/strong&gt;
                                                                        &lt;small class=&quot;text-muted&quot;&gt;just now&lt;/small&gt;
                                                                        &lt;button type=&quot;button&quot; class=&quot;ms-2 btn-close&quot; data-bs-dismiss=&quot;toast&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
                                                                    &lt;/div&gt;
                                                                    &lt;div class=&quot;toast-body&quot;&gt;
                                                                        See? Just like this.
                                                                    &lt;/div&gt;
                                                                &lt;/div&gt; &lt;!--end toast--&gt;
                                                            
                                                                &lt;div class=&quot;toast fade show&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; aria-atomic=&quot;true&quot;&gt;
                                                                    &lt;div class=&quot;toast-header&quot;&gt;
                                                                        &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/logo-dark-sm.png&quot; alt=&quot;brand-logo&quot; height=&quot;12&quot; class=&quot;me-1&quot; /&gt;
                                                                        &lt;strong class=&quot;me-auto&quot;&gt;Hyper&lt;/strong&gt;
                                                                        &lt;small class=&quot;text-muted&quot;&gt;2 seconds ago&lt;/small&gt;
                                                                        &lt;button type=&quot;button&quot; class=&quot;ms-2 btn-close&quot; data-bs-dismiss=&quot;toast&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
                                                                    &lt;/div&gt;
                                                                    &lt;div class=&quot;toast-body&quot;&gt;
                                                                        Heads up, toasts will stack automatically
                                                                    &lt;/div&gt;
                                                                &lt;/div&gt; &lt;!--end toast--&gt;
                                                            &lt;/div&gt;
                                                        &lt;/div&gt;
                                                        
                                                        &lt;!-- Placement Toast --&gt;
                                                        &lt;div aria-live=&quot;polite&quot; aria-atomic=&quot;true&quot; class=&quot;d-flex justify-content-center align-items-center&quot; style=&quot;min-height: 200px;&quot;&gt;
                                                            &lt;!-- Then put toasts within --&gt;
                                                            &lt;div class=&quot;toast fade show&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; aria-atomic=&quot;true&quot;&gt;
                                                                &lt;div class=&quot;toast-header&quot;&gt;
                                                                    &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/logo-dark-sm.png&quot; alt=&quot;brand-logo&quot; height=&quot;12&quot; class=&quot;me-1&quot; /&gt;
                                                                    &lt;strong class=&quot;me-auto&quot;&gt;Hyper&lt;/strong&gt;
                                                                    &lt;small&gt;11 mins ago&lt;/small&gt;
                                                                    &lt;button type=&quot;button&quot; class=&quot;ms-2 btn-close&quot; data-bs-dismiss=&quot;toast&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
                                                                &lt;/div&gt;
                                                                &lt;div class=&quot;toast-body&quot;&gt;
                                                                    Hello, world! This is a toast message.
                                                                &lt;/div&gt;
                                                            &lt;/div&gt; &lt;!--end toast--&gt;
                                                        &lt;/div&gt;
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->
                                </div> <!-- end card-body-->
                            </div> <!-- end card-->
                        </div> <!-- end col-->
                    </div><!-- end row-->

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Custom content</h4>
                                    <p class="text-muted font-14">Alternatively, you can also add additional controls
                                        and components to toasts.</p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#custom-toast-preview" data-bs-toggle="tab" aria-expanded="false" class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#custom-toast-code" data-bs-toggle="tab" aria-expanded="true" class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="custom-toast-preview">
                                            <div class="toast show align-items-center mb-4" role="alert" aria-live="assertive" aria-atomic="true">
                                                <div class="d-flex">
                                                    <div class="toast-body">
                                                        Hello, world! This is a toast message.
                                                    </div>
                                                    <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                                                </div>
                                            </div>

                                            <div class="toast show align-items-center text-white bg-primary border-0 mb-4" role="alert" aria-live="assertive" aria-atomic="true">
                                                <div class="d-flex">
                                                    <div class="toast-body">
                                                        Hello, world! This is a toast message.
                                                    </div>
                                                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                                                </div>
                                            </div>

                                            <div class="toast show mb-4" role="alert" aria-live="assertive" aria-atomic="true">
                                                <div class="toast-body">
                                                    Hello, world! This is a toast message.
                                                    <div class="mt-2 pt-2 border-top">
                                                        <button type="button" class="btn btn-primary btn-sm">Take
                                                            action</button>
                                                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="toast">Close</button>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="toast bg-primary show" role="alert" aria-live="assertive" aria-atomic="true">
                                                <div class="toast-body text-white">
                                                    Hello, world! This is a toast message.
                                                    <div class="mt-2 pt-2 border-top">
                                                        <button type="button" class="btn btn-light btn-sm">Take
                                                            action</button>
                                                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="toast">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane code" id="custom-toast-code">
                                            <button class="btn-copy-clipboard" data-clipboard-action="copy">Copy</button>
                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;div class=&quot;toast show align-items-center mb-4&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; aria-atomic=&quot;true&quot;&gt;
                                                            &lt;div class=&quot;d-flex&quot;&gt;
                                                                &lt;div class=&quot;toast-body&quot;&gt;
                                                                Hello, world! This is a toast message.
                                                                &lt;/div&gt;
                                                                &lt;button type=&quot;button&quot; class=&quot;btn-close me-2 m-auto&quot; data-bs-dismiss=&quot;toast&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
                                                            &lt;/div&gt;
                                                        &lt;/div&gt;

                                                        &lt;div class=&quot;toast show align-items-center text-white bg-primary border-0 mb-4&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; aria-atomic=&quot;true&quot;&gt;
                                                            &lt;div class=&quot;d-flex&quot;&gt;
                                                            &lt;div class=&quot;toast-body&quot;&gt;
                                                                Hello, world! This is a toast message.
                                                            &lt;/div&gt;
                                                            &lt;button type=&quot;button&quot; class=&quot;btn-close btn-close-white me-2 m-auto&quot; data-bs-dismiss=&quot;toast&quot; aria-label=&quot;Close&quot;&gt;&lt;/button&gt;
                                                            &lt;/div&gt;
                                                        &lt;/div&gt;
                                
                                                        &lt;div class=&quot;toast show mb-4&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; aria-atomic=&quot;true&quot;&gt;
                                                            &lt;div class=&quot;toast-body&quot;&gt;
                                                                Hello, world! This is a toast message.
                                                                &lt;div class=&quot;mt-2 pt-2 border-top&quot;&gt;
                                                                    &lt;button type=&quot;button&quot; class=&quot;btn btn-primary btn-sm&quot;&gt;Take action&lt;/button&gt;
                                                                    &lt;button type=&quot;button&quot; class=&quot;btn btn-secondary btn-sm&quot; data-bs-dismiss=&quot;toast&quot;&gt;Close&lt;/button&gt;
                                                                &lt;/div&gt;
                                                            &lt;/div&gt;
                                                        &lt;/div&gt;
                                
                                                        &lt;div class=&quot;toast bg-primary show&quot; role=&quot;alert&quot; aria-live=&quot;assertive&quot; aria-atomic=&quot;true&quot;&gt;
                                                            &lt;div class=&quot;toast-body text-white&quot;&gt;
                                                                Hello, world! This is a toast message.
                                                                &lt;div class=&quot;mt-2 pt-2 border-top&quot;&gt;
                                                                    &lt;button type=&quot;button&quot; class=&quot;btn btn-light btn-sm&quot;&gt;Take action&lt;/button&gt;
                                                                    &lt;button type=&quot;button&quot; class=&quot;btn btn-secondary btn-sm&quot; data-bs-dismiss=&quot;toast&quot;&gt;Close&lt;/button&gt;
                                                                &lt;/div&gt;
                                                            &lt;/div&gt;
                                                        &lt;/div&gt;
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->
                                </div> <!-- end card-body-->
                            </div> <!-- end card-->
                        </div> <!-- end col-->

                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Placement</h4>
                                    <p class="text-muted font-14">Place toasts with custom CSS as you need them. The top
                                        right is often used for notifications, as is the top middle. If you’re only ever
                                        going to show one toast at a time, put the positioning styles right on the
                                        <code>.toast</code>.
                                    </p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#placement-toast-preview" data-bs-toggle="tab" aria-expanded="false" class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#placement-toast-code" data-bs-toggle="tab" aria-expanded="true" class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->

                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="placement-toast-preview">
                                            <form>
                                                <div class="mb-3">
                                                    <label for="selectToastPlacement">Toast placement</label>
                                                    <select class="form-select mt-2" id="selectToastPlacement">
                                                        <option value="" selected>Select a position...</option>
                                                        <option value="top-0 start-0">Top left</option>
                                                        <option value="top-0 start-50 translate-middle-x">Top center
                                                        </option>
                                                        <option value="top-0 end-0">Top right</option>
                                                        <option value="top-50 start-0 translate-middle-y">Middle left
                                                        </option>
                                                        <option value="top-50 start-50 translate-middle">Middle center
                                                        </option>
                                                        <option value="top-50 end-0 translate-middle-y">Middle right
                                                        </option>
                                                        <option value="bottom-0 start-0">Bottom left</option>
                                                        <option value="bottom-0 start-50 translate-middle-x">Bottom
                                                            center</option>
                                                        <option value="bottom-0 end-0">Bottom right</option>
                                                    </select>
                                                </div>
                                            </form>
                                            <div aria-live="polite" aria-atomic="true" class="bg-light position-relative bd-example-toasts" style="min-height:294px">
                                                <div class="toast-container position-absolute p-3" id="toastPlacement">
                                                    <div class="toast show">
                                                        <div class="toast-header">
                                                            <img src="${pageContext.request.contextPath }/resources/assets/images/logo-dark-sm.png" alt="brand-logo" height="16" class="me-1" />
                                                            <strong class="me-auto">Hyper</strong>
                                                            <small>11 mins ago</small>
                                                        </div>
                                                        <div class="toast-body">
                                                            Hello, world! This is a toast message.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane code" id="placement-toast-code">
                                            <button class="btn-copy-clipboard" data-clipboard-action="copy">Copy</button>
                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;form&gt;
                                                            &lt;div class=&quot;mb-3&quot;&gt;
                                                                &lt;label for=&quot;selectToastPlacement&quot;&gt;Toast placement&lt;/label&gt;
                                                                &lt;select class=&quot;form-select mt-2&quot; id=&quot;selectToastPlacement&quot;&gt;
                                                                    &lt;option value=&quot;&quot; selected&gt;Select a position...&lt;/option&gt;
                                                                    &lt;option value=&quot;top-0 start-0&quot;&gt;Top left&lt;/option&gt;
                                                                    &lt;option value=&quot;top-0 start-50 translate-middle-x&quot;&gt;Top center&lt;/option&gt;
                                                                    &lt;option value=&quot;top-0 end-0&quot;&gt;Top right&lt;/option&gt;
                                                                    &lt;option value=&quot;top-50 start-0 translate-middle-y&quot;&gt;Middle left&lt;/option&gt;
                                                                    &lt;option value=&quot;top-50 start-50 translate-middle&quot;&gt;Middle center&lt;/option&gt;
                                                                    &lt;option value=&quot;top-50 end-0 translate-middle-y&quot;&gt;Middle right&lt;/option&gt;
                                                                    &lt;option value=&quot;bottom-0 start-0&quot;&gt;Bottom left&lt;/option&gt;
                                                                    &lt;option value=&quot;bottom-0 start-50 translate-middle-x&quot;&gt;Bottom center&lt;/option&gt;
                                                                    &lt;option value=&quot;bottom-0 end-0&quot;&gt;Bottom right&lt;/option&gt;
                                                                &lt;/select&gt;
                                                            &lt;/div&gt;
                                                        &lt;/form&gt;
                                                        &lt;div aria-live=&quot;polite&quot; aria-atomic=&quot;true&quot; class=&quot;bg-light position-relative bd-example-toasts&quot; style=&quot;min-height:294px&quot;&gt;
                                                            &lt;div class=&quot;toast-container position-absolute p-3&quot; id=&quot;toastPlacement&quot;&gt;
                                                                &lt;div class=&quot;toast show&quot;&gt;
                                                                    &lt;div class=&quot;toast-header&quot;&gt;
                                                                        &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/logo-dark-sm.png&quot; alt=&quot;brand-logo&quot; height=&quot;12&quot; class=&quot;me-1&quot; /&gt;
                                                                        &lt;strong class=&quot;me-auto&quot;&gt;Hyper&lt;/strong&gt;
                                                                        &lt;small&gt;11 mins ago&lt;/small&gt;
                                                                    &lt;/div&gt;
                                                                    &lt;div class=&quot;toast-body&quot;&gt;
                                                                        Hello, world! This is a toast message.
                                                                    &lt;/div&gt;
                                                                &lt;/div&gt;
                                                            &lt;/div&gt;
                                                        &lt;/div&gt;
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->
                                </div> <!-- end card-body-->
                            </div> <!-- end card-->
                        </div> <!-- end col-->
                    </div><!-- end row-->


                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">

                                    <h4 class="header-title">Jquery Toast</h4>
                                    <p class="text-muted font-14">Toasts based notifications can be used to to show
                                        important alerts or information to users.</p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#jquery-toast-preview" data-bs-toggle="tab" aria-expanded="false" class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#jquery-toast-code" data-bs-toggle="tab" aria-expanded="true" class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="jquery-toast-preview">
                                            <div class="row">
                                                <div class="col-md-3 col-sm-6">
                                                    <div class="text-center p-1 pb-3 p-sm-3">
                                                        <p>Info Example</p>
                                                        <button type="button" class="btn btn-info btn-sm" id="toastr-one">Click me</button>
                                                    </div>
                                                </div> <!-- end col-->
                                                <div class="col-md-3 col-sm-6">
                                                    <div class="text-center p-1 pb-3 p-sm-3">
                                                        <p>Warning Example</p>
                                                        <button type="button" class="btn btn-warning btn-sm" id="toastr-two">Click me</button>
                                                    </div>
                                                </div> <!-- end col-->
                                                <div class="col-md-3 col-sm-6">
                                                    <div class="text-center p-1 pb-3 p-sm-3">
                                                        <p>Success Example</p>
                                                        <button type="button" class="btn btn-success btn-sm" id="toastr-three">Click me</button>
                                                    </div>
                                                </div> <!-- end col-->
                                                <div class="col-md-3 col-sm-6">
                                                    <div class="text-center p-1 pb-3 p-sm-3">
                                                        <p>Danger Example</p>
                                                        <button type="button" class="btn btn-danger btn-sm" id="toastr-four">Click me</button>
                                                    </div>
                                                </div> <!-- end col-->
                                            </div>
                                            <!-- end row-->

                                            <div class="row">
                                                <div class="col-md-3 col-sm-6">
                                                    <div class="text-center p-1 pb-3 p-sm-3">
                                                        <p>The text can be an array</p>
                                                        <button type="button" class="btn btn-light btn-sm" id="toastr-five">Click me</button>
                                                    </div>
                                                </div> <!-- end col-->
                                                <div class="col-md-3 col-sm-6">
                                                    <div class="text-center p-1 pb-3 p-sm-3">
                                                        <p>Put some HTML in the text</p>
                                                        <button type="button" class="btn btn-light btn-sm" id="toastr-six">Click me</button>
                                                    </div>
                                                </div> <!-- end col-->
                                                <div class="col-md-3 col-sm-6">
                                                    <div class="text-center p-1 pb-3 p-sm-3">
                                                        <p>Making them sticky</p>
                                                        <button type="button" class="btn btn-light btn-sm" id="toastr-seven">Click me</button>
                                                    </div>
                                                </div> <!-- end col-->
                                                <div class="col-md-3 col-sm-6">
                                                    <div class="text-center p-1 pb-3 p-sm-3">
                                                        <p>Fade transitions</p>
                                                        <button type="button" class="btn btn-light btn-sm" id="toastr-eight">Click me</button>
                                                    </div>
                                                </div> <!-- end col-->
                                            </div>
                                            <!-- end row-->
                                        </div> <!-- end preview-->

                                        <div class="tab-pane code" id="jquery-toast-code">
                                            <div class="p-1">
                                                <h5 class="mb-1">How to customize the style of toast?</h5>
                                                <p class="font-13 text-muted">Open file
                                                    <code>src/scss/custom/plugins/_toaster.scss</code> and
                                                    change the different style to change the background, text or
                                                    other
                                                    colors.
                                                </p>

                                                <pre class="mb-0">
                                                        <span class="html escape">
                                                            &lt;script&gt;$.NotificationApp.send(&quot;Title&quot;,&quot;Your awesome message text&quot;,&quot;Position&quot;,&quot;Background color&quot;,&quot;Icon&quot;)&lt;/script&gt;
                                                        </span>
                                                    </pre> <!-- end highlight-->

                                                <p class="mt-2">Following positions for toast are supported at the
                                                    moment:</p>
                                                <ul>
                                                    <li>
                                                        <code>bottom-left</code> to show the toast at bottom left
                                                        position
                                                    </li>
                                                    <li>
                                                        <code>bottom-right</code> to show the toast at bottom right
                                                        position
                                                    </li>
                                                    <li>
                                                        <code>bottom-center</code> to show the toast at bottom center
                                                        position
                                                    </li>
                                                    <li>
                                                        <code>top-right</code> to show the toast at top right position
                                                    </li>
                                                    <li>
                                                        <code>top-left</code> to show the toast at top left position
                                                    </li>
                                                    <li>
                                                        <code>top-center</code> to show the toast at top center position
                                                    </li>
                                                    <li>
                                                        <code>mid-center</code> to show the toast at middle position
                                                    </li>
                                                </ul>

                                                <p>For more options, please refer to official documentation <a href="https://kamranahmed.info/toast" target="_blank">here</a>
                                                </p>
                                            </div>

                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->

                                </div> <!-- end card-body-->
                            </div> <!-- end card-->
                        </div> <!-- end col-->
                    </div>
                    <!-- end row-->

                </div> <!-- container -->

            </div> <!-- content -->

            <!-- Footer Start -->
            <footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">
                            <script>document.write(new Date().getFullYear())</script> © Hyper - Coderthemes.com
                        </div>
                        <div class="col-md-6">
                            <div class="text-md-end footer-links d-none d-md-block">
                                <a href="javascript: void(0);">About</a>
                                <a href="javascript: void(0);">Support</a>
                                <a href="javascript: void(0);">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- end Footer -->

        </div>

        <!-- ============================================================== -->
        <!-- End Page content -->
        <!-- ============================================================== -->

    </div>
    <!-- END wrapper -->

    <!-- Theme Settings -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="theme-settings-offcanvas">
        <div class="d-flex align-items-center bg-primary p-3 offcanvas-header">
            <h5 class="text-white m-0">Theme Settings</h5>
            <button type="button" class="btn-close btn-close-white ms-auto" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>

        <div class="offcanvas-body p-0">
            <div data-simplebar class="h-100">
                <div class="card mb-0 p-3">
                    <h5 class="mt-0 font-16 fw-bold mb-3">Choose Layout</h5>
                    <div class="row">
                        <div class="col-4">
                            <div class="form-check card-radio">
                                <input id="customizer-layout01" name="data-layout" type="radio" value="vertical" class="form-check-input">
                                <label class="form-check-label p-0 avatar-md w-100" for="customizer-layout01">
                                    <span class="d-flex h-100">
                                        <span class="flex-shrink-0">
                                            <span class="bg-light d-flex h-100 border-end flex-column p-1 px-2">
                                                <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                            </span>
                                        </span>
                                        <span class="flex-grow-1">
                                            <span class="d-flex h-100 flex-column">
                                                <span class="bg-light d-block p-1"></span>
                                            </span>
                                        </span>
                                    </span>
                                </label>
                            </div>
                            <h5 class="font-14 text-center text-muted mt-2">Vertical</h5>
                        </div>
                        <div class="col-4">
                            <div class="form-check card-radio">
                                <input id="customizer-layout02" name="data-layout" type="radio" value="horizontal" class="form-check-input">
                                <label class="form-check-label p-0 avatar-md w-100" for="customizer-layout02">
                                    <span class="d-flex h-100 flex-column">
                                        <span class="bg-light d-flex p-1 align-items-center border-bottom border-secondary border-opacity-25">
                                            <span class="d-block p-1 bg-dark-lighten rounded me-1"></span>
                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-auto"></span>
                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                            <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                        </span>
                                        <span class="bg-light d-block p-1"></span>
                                    </span>
                                </label>
                            </div>
                            <h5 class="font-14 text-center text-muted mt-2">Horizontal</h5>
                        </div>
                    </div>

                    <h5 class="my-3 font-16 fw-bold">Color Scheme</h5>

                    <div class="colorscheme-cardradio">
                        <div class="row">
                            <div class="col-4">
                                <div class="form-check card-radio">
                                    <input class="form-check-input" type="radio" name="data-bs-theme" id="layout-color-light" value="light">
                                    <label class="form-check-label p-0 avatar-md w-100" for="layout-color-light">
                                        <div id="sidebar-size">
                                            <span class="d-flex h-100">
                                                <span class="flex-shrink-0">
                                                    <span class="bg-light d-flex h-100 border-end flex-column p-1 px-2">
                                                        <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    </span>
                                                </span>
                                                <span class="flex-grow-1">
                                                    <span class="d-flex h-100 flex-column bg-white rounded-2">
                                                        <span class="bg-light d-block p-1"></span>
                                                    </span>
                                                </span>
                                            </span>
                                        </div>

                                        <div id="topnav-color" class="bg-white rounded-2 h-100">
                                            <span class="d-flex h-100 flex-column">
                                                <span class="bg-light d-flex p-1 align-items-center border-bottom border-secondary border-opacity-25">
                                                    <span class="d-block p-1 bg-dark-lighten rounded me-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-auto"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                </span>
                                                <span class="d-flex h-100 flex-column bg-white rounded-2">
                                                    <span class="bg-light d-block p-1"></span>
                                                </span>
                                            </span>
                                        </div>
                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Light</h5>
                            </div>

                            <div class="col-4">
                                <div class="form-check card-radio">
                                    <input class="form-check-input" type="radio" name="data-bs-theme" id="layout-color-dark" value="dark">
                                    <label class="form-check-label p-0 avatar-md w-100 bg-black" for="layout-color-dark">
                                        <div id="sidebar-size">
                                            <span class="d-flex h-100">
                                                <span class="flex-shrink-0">
                                                    <span class="bg-light d-flex h-100 flex-column p-1 px-2">
                                                        <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                        <span class="d-block border border-secondary border-opacity-25 border-3 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-secondary border-opacity-25 border-3 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-secondary border-opacity-25 border-3 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-secondary border-opacity-25 border-3 rounded w-100 mb-1"></span>
                                                    </span>
                                                </span>
                                                <span class="flex-grow-1">
                                                    <span class="d-flex h-100 flex-column">
                                                        <span class="bg-light d-block p-1"></span>
                                                    </span>
                                                </span>
                                            </span>
                                        </div>

                                        <div id="topnav-color">
                                            <span class="d-flex h-100 flex-column">
                                                <span class="bg-light-lighten d-flex p-1 align-items-center border-bottom border-opacity-25 border-primary border-opacity-25">
                                                    <span class="d-block p-1 bg-dark-lighten rounded me-1"></span>
                                                    <span class="d-block border border-primary border-opacity-25 border-3 rounded ms-auto"></span>
                                                    <span class="d-block border border-primary border-opacity-25 border-3 rounded ms-1"></span>
                                                    <span class="d-block border border-primary border-opacity-25 border-3 rounded ms-1"></span>
                                                    <span class="d-block border border-primary border-opacity-25 border-3 rounded ms-1"></span>
                                                </span>
                                                <span class="bg-light-lighten d-block p-1"></span>
                                            </span>
                                        </div>
                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Dark</h5>
                            </div>
                        </div>
                    </div>

                    <div id="layout-width">
                        <h5 class="my-3 font-16 fw-bold">Layout Mode</h5>

                        <div class="row">
                            <div class="col-4">
                                <div class="form-check card-radio">
                                    <input class="form-check-input" type="radio" name="data-layout-mode" id="layout-mode-fluid" value="fluid">
                                    <label class="form-check-label p-0 avatar-md w-100" for="layout-mode-fluid">
                                        <div id="sidebar-size">
                                            <span class="d-flex h-100">
                                                <span class="flex-shrink-0">
                                                    <span class="bg-light d-flex h-100 border-end flex-column p-1 px-2">
                                                        <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    </span>
                                                </span>
                                                <span class="flex-grow-1">
                                                    <span class="d-flex h-100 flex-column rounded-2">
                                                        <span class="bg-light d-block p-1"></span>
                                                    </span>
                                                </span>
                                            </span>
                                        </div>

                                        <div id="topnav-color">
                                            <span class="d-flex h-100 flex-column">
                                                <span class="bg-light d-flex p-1 align-items-center border-bottom border-secondary border-opacity-25">
                                                    <span class="d-block p-1 bg-dark-lighten rounded me-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-auto"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                </span>
                                                <span class="bg-light d-block p-1"></span>
                                            </span>
                                        </div>
                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Fluid</h5>
                            </div>
                            <div class="col-4" id="layout-boxed">
                                <div class="form-check card-radio">
                                    <input class="form-check-input" type="radio" name="data-layout-mode" id="layout-mode-boxed" value="boxed">
                                    <label class="form-check-label p-0 avatar-md w-100 px-2" for="layout-mode-boxed">
                                        <div id="sidebar-size" class="border-start border-end">
                                            <span class="d-flex h-100">
                                                <span class="flex-shrink-0">
                                                    <span class="bg-light d-flex h-100 border-end flex-column p-1 px-2">
                                                        <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    </span>
                                                </span>
                                                <span class="flex-grow-1">
                                                    <span class="d-flex h-100 flex-column rounded-2">
                                                        <span class="bg-light d-block p-1"></span>
                                                    </span>
                                                </span>
                                            </span>
                                        </div>

                                        <div id="topnav-color" class="border-start border-end h-100">
                                            <span class="d-flex h-100 flex-column">
                                                <span class="bg-light d-flex p-1 align-items-center border-bottom border-secondary border-opacity-25">
                                                    <span class="d-block p-1 bg-dark-lighten rounded me-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-auto"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                </span>
                                                <span class="bg-light d-block p-1"></span>
                                            </span>
                                        </div>
                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Boxed</h5>
                            </div>

                            <div class="col-4" id="layout-detached">
                                <div class="form-check sidebar-setting card-radio">
                                    <input class="form-check-input" type="radio" name="data-layout-mode" id="data-layout-detached" value="detached">
                                    <label class="form-check-label p-0 avatar-md w-100" for="data-layout-detached">
                                        <span class="d-flex h-100 flex-column">
                                            <span class="bg-light d-flex p-1 align-items-center border-bottom ">
                                                <span class="d-block p-1 bg-dark-lighten rounded me-1"></span>
                                                <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-auto"></span>
                                                <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                            </span>
                                            <span class="d-flex h-100 p-1 px-2">
                                                <span class="flex-shrink-0">
                                                    <span class="bg-light d-flex h-100 flex-column p-1 px-2">
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100"></span>
                                                    </span>
                                                </span>
                                            </span>
                                            <span class="bg-light d-block p-1 mt-auto px-2"></span>
                                        </span>

                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Detached</h5>
                            </div>
                        </div>
                    </div>

                    <h5 class="my-3 font-16 fw-bold">Topbar Color</h5>

                    <div class="row">
                        <div class="col-4">
                            <div class="form-check card-radio">
                                <input class="form-check-input" type="radio" name="data-topbar-color" id="topbar-color-light" value="light">
                                <label class="form-check-label p-0 avatar-md w-100" for="topbar-color-light">
                                    <div id="sidebar-size">
                                        <span class="d-flex h-100">
                                            <span class="flex-shrink-0">
                                                <span class="bg-light d-flex h-100 border-end  flex-column p-1 px-2">
                                                    <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                </span>
                                            </span>
                                            <span class="flex-grow-1">
                                                <span class="d-flex h-100 flex-column">
                                                    <span class="bg-light d-block p-1"></span>
                                                </span>
                                            </span>
                                        </span>
                                    </div>

                                    <div id="topnav-color">
                                        <span class="d-flex h-100 flex-column">
                                            <span class="bg-light d-flex p-1 align-items-center border-bottom border-secondary border-opacity-25">
                                                <span class="d-block p-1 bg-dark-lighten rounded me-1"></span>
                                                <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-auto"></span>
                                                <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                            </span>
                                            <span class="bg-light d-block p-1"></span>
                                        </span>
                                    </div>
                                </label>
                            </div>
                            <h5 class="font-14 text-center text-muted mt-2">Light</h5>
                        </div>

                        <div class="col-4" style="--ct-dark-rgb: 64,73,84;">
                            <div class="form-check card-radio">
                                <input class="form-check-input" type="radio" name="data-topbar-color" id="topbar-color-dark" value="dark">
                                <label class="form-check-label p-0 avatar-md w-100" for="topbar-color-dark">
                                    <div id="sidebar-size">
                                        <span class="d-flex h-100">
                                            <span class="flex-shrink-0">
                                                <span class="bg-light d-flex h-100 border-end  flex-column p-1 px-2">
                                                    <span class="d-block p-1 bg-primary-lighten rounded mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                </span>
                                            </span>
                                            <span class="flex-grow-1">
                                                <span class="d-flex h-100 flex-column">
                                                    <span class="bg-dark d-block p-1"></span>
                                                </span>
                                            </span>
                                        </span>
                                    </div>

                                    <div id="topnav-color">
                                        <span class="d-flex h-100 flex-column">
                                            <span class="bg-dark d-flex p-1 align-items-center border-bottom border-secondary border-opacity-25">
                                                <span class="d-block p-1 bg-primary-lighten rounded me-1"></span>
                                                <span class="d-block border border-primary border-opacity-25 border-3 rounded ms-auto"></span>
                                                <span class="d-block border border-primary border-opacity-25 border-3 rounded ms-1"></span>
                                                <span class="d-block border border-primary border-opacity-25 border-3 rounded ms-1"></span>
                                                <span class="d-block border border-primary border-opacity-25 border-3 rounded ms-1"></span>
                                            </span>
                                            <span class="bg-light d-block p-1"></span>
                                        </span>
                                    </div>
                                </label>
                            </div>
                            <h5 class="font-14 text-center text-muted mt-2">Dark</h5>
                        </div>

                        <div class="col-4">
                            <div class="form-check card-radio">
                                <input class="form-check-input" type="radio" name="data-topbar-color" id="topbar-color-brand" value="brand">
                                <label class="form-check-label p-0 avatar-md w-100" for="topbar-color-brand">
                                    <div id="sidebar-size">
                                        <span class="d-flex h-100">
                                            <span class="flex-shrink-0">
                                                <span class="bg-light d-flex h-100 border-end  flex-column p-1 px-2">
                                                    <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                </span>
                                            </span>
                                            <span class="flex-grow-1">
                                                <span class="d-flex h-100 flex-column">
                                                    <span class="bg-primary bg-gradient d-block p-1"></span>
                                                </span>
                                            </span>
                                        </span>
                                    </div>

                                    <div id="topnav-color">
                                        <span class="d-flex h-100 flex-column">
                                            <span class="bg-primary bg-gradient d-flex p-1 align-items-center border-bottom border-secondary border-opacity-25">
                                                <span class="d-block p-1 bg-light opacity-25 rounded me-1"></span>
                                                <span class="d-block border border-3 border opacity-25 rounded ms-auto"></span>
                                                <span class="d-block border border-3 border opacity-25 rounded ms-1"></span>
                                                <span class="d-block border border-3 border opacity-25 rounded ms-1"></span>
                                                <span class="d-block border border-3 border opacity-25 rounded ms-1"></span>
                                            </span>
                                            <span class="bg-light d-block p-1"></span>
                                        </span>
                                    </div>
                                </label>
                            </div>
                            <h5 class="font-14 text-center text-muted mt-2">Brand</h5>
                        </div>
                    </div>

                    <div>
                        <h5 class="my-3 font-16 fw-bold">Menu Color</h5>

                        <div class="row">
                            <div class="col-4">
                                <div class="form-check sidebar-setting card-radio">
                                    <input class="form-check-input" type="radio" name="data-menu-color" id="leftbar-color-light" value="light">
                                    <label class="form-check-label p-0 avatar-md w-100" for="leftbar-color-light">
                                        <div id="sidebar-size">
                                            <span class="d-flex h-100">
                                                <span class="flex-shrink-0">
                                                    <span class="bg-light d-flex h-100 border-end  flex-column p-1 px-2">
                                                        <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                        <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    </span>
                                                </span>
                                                <span class="flex-grow-1">
                                                    <span class="d-flex h-100 flex-column">
                                                        <span class="bg-light d-block p-1"></span>
                                                    </span>
                                                </span>
                                            </span>
                                        </div>

                                        <div id="topnav-color">
                                            <span class="d-flex h-100 flex-column">
                                                <span class="bg-light d-flex p-1 align-items-center border-bottom border-secondary border-opacity-25">
                                                    <span class="d-block p-1 bg-dark-lighten rounded me-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-auto"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                </span>
                                                <span class="bg-light d-block p-1"></span>
                                            </span>
                                        </div>
                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Light</h5>
                            </div>

                            <div class="col-4" style="--ct-dark-rgb: 64,73,84;">
                                <div class="form-check sidebar-setting card-radio">
                                    <input class="form-check-input" type="radio" name="data-menu-color" id="leftbar-color-dark" value="dark">
                                    <label class="form-check-label p-0 avatar-md w-100" for="leftbar-color-dark">
                                        <div id="sidebar-size">
                                            <span class="d-flex h-100">
                                                <span class="flex-shrink-0">
                                                    <span class="bg-dark d-flex h-100 flex-column p-1 px-2">
                                                        <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                        <span class="d-block border border-secondary rounded border-opacity-25 border-3 w-100 mb-1"></span>
                                                        <span class="d-block border border-secondary rounded border-opacity-25 border-3 w-100 mb-1"></span>
                                                        <span class="d-block border border-secondary rounded border-opacity-25 border-3 w-100 mb-1"></span>
                                                        <span class="d-block border border-secondary rounded border-opacity-25 border-3 w-100 mb-1"></span>
                                                    </span>
                                                </span>
                                                <span class="flex-grow-1">
                                                    <span class="d-flex h-100 flex-column">
                                                        <span class="bg-light d-block p-1"></span>
                                                    </span>
                                                </span>
                                            </span>
                                        </div>

                                        <div id="topnav-color">
                                            <span class="d-flex h-100 flex-column">
                                                <span class="bg-light d-flex p-1 align-items-center border-bottom border-secondary border-primary border-opacity-25">
                                                    <span class="d-block p-1 bg-primary-lighten rounded me-1"></span>
                                                    <span class="d-block border border-secondary rounded border-opacity-25 border-3 ms-auto"></span>
                                                    <span class="d-block border border-secondary rounded border-opacity-25 border-3 ms-1"></span>
                                                    <span class="d-block border border-secondary rounded border-opacity-25 border-3 ms-1"></span>
                                                    <span class="d-block border border-secondary rounded border-opacity-25 border-3 ms-1"></span>
                                                </span>
                                                <span class="bg-dark d-block p-1"></span>
                                            </span>
                                        </div>
                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Dark</h5>
                            </div>
                            <div class="col-4">
                                <div class="form-check sidebar-setting card-radio">
                                    <input class="form-check-input" type="radio" name="data-menu-color" id="leftbar-color-brand" value="brand">
                                    <label class="form-check-label p-0 avatar-md w-100" for="leftbar-color-brand">
                                        <div id="sidebar-size">
                                            <span class="d-flex h-100">
                                                <span class="flex-shrink-0">
                                                    <span class="bg-primary bg-gradient d-flex h-100 flex-column p-1 px-2">
                                                        <span class="d-block p-1 bg-light-lighten rounded mb-1"></span>
                                                        <span class="d-block border opacity-25 rounded border-3 w-100 mb-1"></span>
                                                        <span class="d-block border opacity-25 rounded border-3 w-100 mb-1"></span>
                                                        <span class="d-block border opacity-25 rounded border-3 w-100 mb-1"></span>
                                                        <span class="d-block border opacity-25 rounded border-3 w-100 mb-1"></span>
                                                    </span>
                                                </span>
                                                <span class="flex-grow-1">
                                                    <span class="d-flex h-100 flex-column">
                                                        <span class="bg-light d-block p-1"></span>
                                                    </span>
                                                </span>
                                            </span>
                                        </div>

                                        <div id="topnav-color">
                                            <span class="d-flex h-100 flex-column">
                                                <span class="bg-light d-flex p-1 align-items-center border-bottom border-secondary">
                                                    <span class="d-block p-1 bg-dark-lighten rounded me-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-auto"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded ms-1"></span>
                                                </span>
                                                <span class="bg-primary bg-gradient d-block p-1"></span>
                                            </span>
                                        </div>

                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Brand</h5>
                            </div>
                        </div>
                    </div>

                    <div id="sidebar-size">
                        <h5 class="my-3 font-16 fw-bold">Sidebar Size</h5>

                        <div class="row">
                            <div class="col-4">
                                <div class="form-check sidebar-setting card-radio">
                                    <input class="form-check-input" type="radio" name="data-sidenav-size" id="leftbar-size-default" value="default">
                                    <label class="form-check-label p-0 avatar-md w-100" for="leftbar-size-default">
                                        <span class="d-flex h-100">
                                            <span class="flex-shrink-0">
                                                <span class="bg-light d-flex h-100 border-end  flex-column p-1 px-2">
                                                    <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                </span>
                                            </span>
                                            <span class="flex-grow-1">
                                                <span class="d-flex h-100 flex-column">
                                                    <span class="bg-light d-block p-1"></span>
                                                </span>
                                            </span>
                                        </span>
                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Default</h5>
                            </div>

                            <div class="col-4">
                                <div class="form-check sidebar-setting card-radio">
                                    <input class="form-check-input" type="radio" name="data-sidenav-size" id="leftbar-size-compact" value="compact">
                                    <label class="form-check-label p-0 avatar-md w-100" for="leftbar-size-compact">
                                        <span class="d-flex h-100">
                                            <span class="flex-shrink-0">
                                                <span class="bg-light d-flex h-100 border-end  flex-column p-1">
                                                    <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                </span>
                                            </span>
                                            <span class="flex-grow-1">
                                                <span class="d-flex h-100 flex-column">
                                                    <span class="bg-light d-block p-1"></span>
                                                </span>
                                            </span>
                                        </span>
                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Compact</h5>
                            </div>

                            <div class="col-4">
                                <div class="form-check sidebar-setting card-radio">
                                    <input class="form-check-input" type="radio" name="data-sidenav-size" id="leftbar-size-small" value="condensed">
                                    <label class="form-check-label p-0 avatar-md w-100" for="leftbar-size-small">
                                        <span class="d-flex h-100">
                                            <span class="flex-shrink-0">
                                                <span class="bg-light d-flex h-100 border-end flex-column" style="padding: 2px;">
                                                    <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                </span>
                                            </span>
                                            <span class="flex-grow-1">
                                                <span class="d-flex h-100 flex-column">
                                                    <span class="bg-light d-block p-1"></span>
                                                </span>
                                            </span>
                                        </span>
                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Condensed</h5>
                            </div>

                            <div class="col-4">
                                <div class="form-check sidebar-setting card-radio">
                                    <input class="form-check-input" type="radio" name="data-sidenav-size" id="leftbar-size-small-hover" value="sm-hover">
                                    <label class="form-check-label p-0 avatar-md w-100" for="leftbar-size-small-hover">
                                        <span class="d-flex h-100">
                                            <span class="flex-shrink-0">
                                                <span class="bg-light d-flex h-100 border-end flex-column" style="padding: 2px;">
                                                    <span class="d-block p-1 bg-dark-lighten rounded mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                    <span class="d-block border border-3 border-secondary border-opacity-25 rounded w-100 mb-1"></span>
                                                </span>
                                            </span>
                                            <span class="flex-grow-1">
                                                <span class="d-flex h-100 flex-column">
                                                    <span class="bg-light d-block p-1"></span>
                                                </span>
                                            </span>
                                        </span>
                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Hover View</h5>
                            </div>

                            <div class="col-4">
                                <div class="form-check sidebar-setting card-radio">
                                    <input class="form-check-input" type="radio" name="data-sidenav-size" id="leftbar-size-full" value="full">
                                    <label class="form-check-label p-0 avatar-md w-100" for="leftbar-size-full">
                                        <span class="d-flex h-100">
                                            <span class="flex-shrink-0">
                                                <span class="d-flex h-100 flex-column">
                                                    <span class="d-block p-1 bg-dark-lighten mb-1"></span>
                                                </span>
                                            </span>
                                            <span class="flex-grow-1">
                                                <span class="d-flex h-100 flex-column">
                                                    <span class="bg-light d-block p-1"></span>
                                                </span>
                                            </span>
                                        </span>
                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Full Layout</h5>
                            </div>

                            <div class="col-4">
                                <div class="form-check sidebar-setting card-radio">
                                    <input class="form-check-input" type="radio" name="data-sidenav-size" id="leftbar-size-fullscreen" value="fullscreen">
                                    <label class="form-check-label p-0 avatar-md w-100" for="leftbar-size-fullscreen">
                                        <span class="d-flex h-100">
                                            <span class="flex-grow-1">
                                                <span class="d-flex h-100 flex-column">
                                                    <span class="bg-light d-block p-1"></span>
                                                </span>
                                            </span>
                                        </span>
                                    </label>
                                </div>
                                <h5 class="font-14 text-center text-muted mt-2">Fullscreen Layout</h5>
                            </div>
                        </div>
                    </div>

                    <div id="layout-position">
                        <h5 class="my-3 font-16 fw-bold">Layout Position</h5>

                        <div class="btn-group radio" role="group">
                            <input type="radio" class="btn-check" name="data-layout-position" id="layout-position-fixed" value="fixed">
                            <label class="btn btn-soft-primary w-sm" for="layout-position-fixed">Fixed</label>

                            <input type="radio" class="btn-check" name="data-layout-position" id="layout-position-scrollable" value="scrollable">
                            <label class="btn btn-soft-primary w-sm ms-0" for="layout-position-scrollable">Scrollable</label>
                        </div>
                    </div>

                    <div id="sidebar-user">
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <label class="font-16 fw-bold m-0" for="sidebaruser-check">Sidebar User Info</label>
                            <div class="form-check form-switch">
                                <input type="checkbox" class="form-check-input" name="sidebar-user" id="sidebaruser-check">
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
        <div class="offcanvas-footer border-top p-3 text-center">
            <div class="row">
                <div class="col-6">
                    <button type="button" class="btn btn-light w-100" id="reset-layout">Reset</button>
                </div>
                <div class="col-6">
                    <a href="https://themes.getbootstrap.com/product/hyper-responsive-admin-dashboard-template/" target="_blank" role="button" class="btn btn-primary w-100">Buy Now</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Vendor js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/vendor.min.js"></script>

    <!-- Code Highlight js -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/highlightjs/highlight.pack.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/clipboard/clipboard.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/hyper-syntax.js"></script>

    <script src="${pageContext.request.contextPath }/resources/assets/vendor/jquery-toast-plugin/jquery.toast.min.js"></script>

    <!-- Toastr Demo js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.toastr.js"></script>

    <!-- App js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>

</body>

</html>