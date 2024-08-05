<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Dragula | Hyper - Responsive Bootstrap 5 Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />

    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.ico">

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
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Extended UI</a></li>
                                        <li class="breadcrumb-item active">Dragula</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Dragula</h4>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Simple Drag and Drop Example</h4>
                                    <p class="text-muted font-14">
                                        Just specify the data attribute <code>data-plugin='dragula'</code> to have drag and drop support in your container.
                                    </p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#simple-drag-preview" data-bs-toggle="tab" aria-expanded="false" class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#simple-drag-code" data-bs-toggle="tab" aria-expanded="true" class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="simple-drag-preview">
                                            <div class="row" id="simple-dragula" data-plugin="dragula">
                                                <div class="col-md-4">
                                                    <div class="card mb-0 mt-3 text-white bg-primary">
                                                        <div class="card-body">
                                                            <blockquote class="card-bodyquote mb-0">
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere
                                                                    erat a ante.</p>
                                                                <footer>Someone famous in <cite title="Source Title">Source Title</cite>
                                                                </footer>
                                                            </blockquote>
                                                        </div> <!-- end card-body-->
                                                    </div> <!-- end card-->
                                                </div> <!-- end col-->

                                                <div class="col-md-4">
                                                    <div class="card mb-0 mt-3 bg-secondary text-white">
                                                        <div class="card-body">
                                                            <blockquote class="card-bodyquote mb-0">
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere
                                                                    erat a ante.</p>
                                                                <footer>Someone famous in <cite title="Source Title">Source Title</cite>
                                                                </footer>
                                                            </blockquote>
                                                        </div> <!-- end card-body-->
                                                    </div> <!-- end card-->
                                                </div> <!-- end col-->

                                                <div class="col-md-4">
                                                    <div class="card mb-0 mt-3 text-white bg-success">
                                                        <div class="card-body">
                                                            <blockquote class="card-bodyquote mb-0">
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere
                                                                    erat a ante.</p>
                                                                <footer>Someone famous in <cite title="Source Title">Source Title</cite>
                                                                </footer>
                                                            </blockquote>
                                                        </div> <!-- end card-body-->
                                                    </div> <!-- end card-->
                                                </div> <!-- end col-->

                                                <div class="col-md-4">
                                                    <div class="card mb-0 mt-3 text-white bg-info text-xs-center">
                                                        <div class="card-body">
                                                            <blockquote class="card-bodyquote mb-0">
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere
                                                                    erat a ante.</p>
                                                                <footer>Someone famous in <cite title="Source Title">Source Title</cite>
                                                                </footer>
                                                            </blockquote>
                                                        </div> <!-- end card-body-->
                                                    </div> <!-- end card-->
                                                </div> <!-- end col-->

                                                <div class="col-md-4">
                                                    <div class="card mb-0 mt-3 text-white bg-warning text-xs-center">
                                                        <div class="card-body">
                                                            <blockquote class="card-bodyquote mb-0">
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere
                                                                    erat a ante.</p>
                                                                <footer>Someone famous in <cite title="Source Title">Source Title</cite>
                                                                </footer>
                                                            </blockquote>
                                                        </div> <!-- end card-body-->
                                                    </div> <!-- end card-->
                                                </div> <!-- end col-->

                                                <div class="col-md-4">
                                                    <div class="card mb-0 mt-3 text-white bg-danger text-xs-center">
                                                        <div class="card-body">
                                                            <blockquote class="card-bodyquote mb-0">
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere
                                                                    erat a ante.</p>
                                                                <footer>Someone famous in <cite title="Source Title">Source Title</cite>
                                                                </footer>
                                                            </blockquote>
                                                        </div> <!-- end card-body-->
                                                    </div> <!-- end card-->
                                                </div> <!-- end col-->

                                            </div>
                                            <!-- end row-->
                                        </div> <!-- end preview-->

                                        <div class="tab-pane code" id="simple-drag-code">
                                            <p class="m-2">Make sure to include following js files at end of <code>body element</code></p>

                                            <button class="btn-copy-clipboard" data-clipboard-action="copy">Copy</button>
                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;script src=&quot;${pageContext.request.contextPath }/resources/assets/vendor/dragula/dragula.min.js&quot;&gt;&lt;/script&gt;
                                                        &lt;script src=&quot;${pageContext.request.contextPath }/resources/assets/js/ui/component.dragula.js&quot;&gt;&lt;/script&gt;
                                                    </span>
                                               
                                                    <span class="html escape">
                                                        &lt;div class=&quot;row&quot; id=&quot;simple-dragula&quot; data-plugin=&quot;dragula&quot;&gt;
                                                            &lt;div class=&quot;col-md-4&quot;&gt;
                                                                &lt;div class=&quot;card mb-0 mt-3 text-white bg-primary&quot;&gt;
                                                                    &lt;div class=&quot;card-body&quot;&gt;
                                                                        &lt;blockquote class=&quot;card-bodyquote mb-0&quot;&gt;
                                                                            &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere
                                                                                erat a ante.&lt;/p&gt;
                                                                            &lt;footer&gt;Someone famous in &lt;cite title=&quot;Source Title&quot;&gt;Source Title&lt;/cite&gt;
                                                                            &lt;/footer&gt;
                                                                        &lt;/blockquote&gt;
                                                                    &lt;/div&gt; &lt;!-- end card-body--&gt;
                                                                &lt;/div&gt; &lt;!-- end card--&gt;
                                                            &lt;/div&gt; &lt;!-- end col--&gt;
                
                                                            &lt;div class=&quot;col-md-4&quot;&gt;
                                                                &lt;div class=&quot;card mb-0 mt-3 bg-secondary text-white&quot;&gt;
                                                                    &lt;div class=&quot;card-body&quot;&gt;
                                                                        &lt;blockquote class=&quot;card-bodyquote mb-0&quot;&gt;
                                                                            &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere
                                                                                erat a ante.&lt;/p&gt;
                                                                            &lt;footer&gt;Someone famous in &lt;cite title=&quot;Source Title&quot;&gt;Source Title&lt;/cite&gt;
                                                                            &lt;/footer&gt;
                                                                        &lt;/blockquote&gt;
                                                                    &lt;/div&gt; &lt;!-- end card-body--&gt;
                                                                &lt;/div&gt; &lt;!-- end card--&gt;
                                                            &lt;/div&gt; &lt;!-- end col--&gt;                    
                                
                                                            &lt;div class=&quot;col-md-4&quot;&gt;
                                                                &lt;div class=&quot;card mb-0 mt-3 text-white bg-success&quot;&gt;
                                                                    &lt;div class=&quot;card-body&quot;&gt;
                                                                        &lt;blockquote class=&quot;card-bodyquote mb-0&quot;&gt;
                                                                            &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere
                                                                                erat a ante.&lt;/p&gt;
                                                                            &lt;footer&gt;Someone famous in &lt;cite title=&quot;Source Title&quot;&gt;Source Title&lt;/cite&gt;
                                                                            &lt;/footer&gt;
                                                                        &lt;/blockquote&gt;
                                                                    &lt;/div&gt; &lt;!-- end card-body--&gt;
                                                                &lt;/div&gt; &lt;!-- end card--&gt;
                                                            &lt;/div&gt; &lt;!-- end col--&gt;   
                                                            
                                                            &lt;div class=&quot;col-md-4&quot;&gt;
                                                                &lt;div class=&quot;card mb-0 mt-3 text-white bg-info text-xs-center&quot;&gt;
                                                                    &lt;div class=&quot;card-body&quot;&gt;
                                                                        &lt;blockquote class=&quot;card-bodyquote mb-0&quot;&gt;
                                                                            &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere
                                                                                erat a ante.&lt;/p&gt;
                                                                            &lt;footer&gt;Someone famous in &lt;cite title=&quot;Source Title&quot;&gt;Source Title&lt;/cite&gt;
                                                                            &lt;/footer&gt;
                                                                        &lt;/blockquote&gt;
                                                                    &lt;/div&gt; &lt;!-- end card-body--&gt;
                                                                &lt;/div&gt; &lt;!-- end card--&gt;
                                                            &lt;/div&gt; &lt;!-- end col--&gt;
                                
                                                            &lt;div class=&quot;col-md-4&quot;&gt;
                                                                &lt;div class=&quot;card mb-0 mt-3 text-white bg-warning text-xs-center&quot;&gt;
                                                                    &lt;div class=&quot;card-body&quot;&gt;
                                                                        &lt;blockquote class=&quot;card-bodyquote mb-0&quot;&gt;
                                                                            &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere
                                                                                erat a ante.&lt;/p&gt;
                                                                            &lt;footer&gt;Someone famous in &lt;cite title=&quot;Source Title&quot;&gt;Source Title&lt;/cite&gt;
                                                                            &lt;/footer&gt;
                                                                        &lt;/blockquote&gt;
                                                                    &lt;/div&gt; &lt;!-- end card-body--&gt;
                                                                &lt;/div&gt; &lt;!-- end card--&gt;
                                                            &lt;/div&gt; &lt;!-- end col--&gt;
                                
                                                            &lt;div class=&quot;col-md-4&quot;&gt;
                                                                &lt;div class=&quot;card mb-0 mt-3 text-white bg-danger text-xs-center&quot;&gt;
                                                                    &lt;div class=&quot;card-body&quot;&gt;
                                                                        &lt;blockquote class=&quot;card-bodyquote mb-0&quot;&gt;
                                                                            &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere
                                                                                erat a ante.&lt;/p&gt;
                                                                            &lt;footer&gt;Someone famous in &lt;cite title=&quot;Source Title&quot;&gt;Source Title&lt;/cite&gt;
                                                                            &lt;/footer&gt;
                                                                        &lt;/blockquote&gt;
                                                                    &lt;/div&gt; &lt;!-- end card-body--&gt;
                                                                &lt;/div&gt; &lt;!-- end card--&gt;
                                                            &lt;/div&gt; &lt;!-- end col--&gt; 
                                                        &lt;/div&gt;
                                                        &lt;!-- end row--&gt;
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->

                                </div> <!-- end card-body-->
                            </div> <!-- end card-->
                        </div> <!-- end col-->
                    </div> <!-- end row -->


                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Move stuff between containers</h4>
                                    <p class="text-muted font-14 mb-3">
                                        Just specify the data attribute
                                        <code>data-plugin='dragula'</code> and
                                        <code>data-containers='["first-container-id", "second-container-id"]'</code>.
                                    </p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#move-stuff-preview" data-bs-toggle="tab" aria-expanded="false" class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#move-stuff-code" data-bs-toggle="tab" aria-expanded="true" class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="move-stuff-preview">
                                            <div class="row" data-plugin="dragula" data-containers='["company-list-left", "company-list-right"]'>
                                                <div class="col-md-6">
                                                    <div class="bg-dragula p-2 p-lg-4">
                                                        <h5 class="mt-0">Part 1</h5>
                                                        <div id="company-list-left" class="py-2">

                                                            <div class="card mb-0 mt-2">
                                                                <div class="card-body">
                                                                    <div class="d-flex align-items-start">
                                                                        <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-1.jpg" alt="image" class="me-3 d-none d-sm-block avatar-sm rounded-circle">
                                                                        <div class="w-100 overflow-hidden">
                                                                            <h5 class="mb-1 mt-0">Louis K. Bond</h5>
                                                                            <p> Founder & CEO </p>
                                                                            <p class="mb-0 text-muted">
                                                                                <span class="fst-italic"><b>"</b>Disrupt pork belly poutine, asymmetrical tousled succulents selfies. You probably haven't heard of them tattooed master cleanse live-edge keffiyeh.</span>
                                                                            </p>
                                                                        </div> <!-- end w-100 -->
                                                                    </div> <!-- end d-flex -->
                                                                </div> <!-- end card-body -->
                                                            </div> <!-- end col -->

                                                            <div class="card mb-0 mt-2">
                                                                <div class="card-body">
                                                                    <div class="d-flex align-items-start">
                                                                        <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-2.jpg" alt="image" class="me-3 d-none d-sm-block avatar-sm rounded-circle">
                                                                        <div class="w-100 overflow-hidden">
                                                                            <h5 class="mb-1 mt-0">Dennis N. Cloutier</h5>
                                                                            <p> Software Engineer </p>
                                                                            <p class="mb-0 text-muted">
                                                                                <span class="fst-italic"><b>"</b>Disrupt pork belly poutine, asymmetrical tousled succulents selfies. You probably haven't heard of them tattooed master cleanse live-edge keffiyeh.</span>
                                                                            </p>
                                                                        </div> <!-- end w-100 -->
                                                                    </div> <!-- end d-flex -->
                                                                </div> <!-- end card-body -->
                                                            </div> <!-- end col -->

                                                            <div class="card mb-0 mt-2">
                                                                <div class="card-body">
                                                                    <div class="d-flex align-items-start">
                                                                        <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-3.jpg" alt="image" class="me-3 d-none d-sm-block avatar-sm rounded-circle">
                                                                        <div class="w-100 overflow-hidden">
                                                                            <h5 class="mb-1 mt-0">Susan J. Sander</h5>
                                                                            <p> Web Designer </p>
                                                                            <p class="mb-0 text-muted">
                                                                                <span class="fst-italic"><b>"</b>Disrupt pork belly poutine, asymmetrical tousled succulents selfies. You probably haven't heard of them tattooed master cleanse live-edge keffiyeh.</span>
                                                                            </p>
                                                                        </div> <!-- end w-100 -->
                                                                    </div> <!-- end d-flex -->
                                                                </div> <!-- end card-body -->
                                                            </div> <!-- end col -->

                                                        </div> <!-- end company-list-1-->
                                                    </div> <!-- end div.bg-light-->
                                                </div> <!-- end col -->

                                                <div class="col-md-6">
                                                    <div class="bg-dragula p-2 p-lg-4">
                                                        <h5 class="mt-0">Part 2</h5>
                                                        <div id="company-list-right" class="py-2">
                                                            <div class="card mb-0 mt-2">

                                                                <div class="card-body p-3">
                                                                    <div class="d-flex align-items-start">
                                                                        <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-4.jpg" alt="image" class="me-3 d-none d-sm-block avatar-sm rounded-circle">
                                                                        <div class="w-100 overflow-hidden">
                                                                            <h5 class="mb-1 mt-0">James M. Short</h5>
                                                                            <p> Web Developer </p>
                                                                            <p class="mb-0 text-muted">
                                                                                <span class="fst-italic"><b>"</b>Disrupt pork belly poutine, asymmetrical tousled succulents selfies. You probably haven't heard of them tattooed master cleanse live-edge keffiyeh </span>
                                                                            </p>
                                                                        </div> <!-- end w-100 -->
                                                                    </div> <!-- end d-flex -->
                                                                </div> <!-- end card-body -->
                                                            </div> <!-- end col -->

                                                            <div class="card mb-0 mt-2">
                                                                <div class="card-body p-3">
                                                                    <div class="d-flex align-items-start">
                                                                        <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-5.jpg" alt="image" class="me-3 d-none d-sm-block avatar-sm rounded-circle">
                                                                        <div class="w-100 overflow-hidden">
                                                                            <h5 class="mb-1 mt-0">Gabriel J. Snyder</h5>
                                                                            <p> Business Analyst </p>
                                                                            <p class="mb-0 text-muted">
                                                                                <span class="fst-italic"><b>"</b>Disrupt pork belly poutine, asymmetrical tousled succulents selfies. You probably haven't heard of them tattooed master cleanse live-edge keffiyeh </span>
                                                                            </p>
                                                                        </div> <!-- end w-100 -->
                                                                    </div> <!-- end d-flex -->
                                                                </div> <!-- end card-body -->
                                                            </div> <!-- end col -->

                                                            <div class="card mb-0 mt-2">
                                                                <div class="card-body p-3">
                                                                    <div class="d-flex align-items-start">
                                                                        <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-6.jpg" alt="image" class="me-3 d-none d-sm-block avatar-sm rounded-circle">
                                                                        <div class="w-100 overflow-hidden">
                                                                            <h5 class="mb-1 mt-0">Louie C. Mason</h5>
                                                                            <p>Human Resources</p>
                                                                            <p class="mb-0 text-muted">
                                                                                <span class="fst-italic"><b>"</b>Disrupt pork belly poutine, asymmetrical tousled succulents selfies. You probably haven't heard of them tattooed master cleanse live-edge keffiyeh </span>
                                                                            </p>
                                                                        </div> <!-- end w-100 -->
                                                                    </div> <!-- end d-flex -->
                                                                </div> <!-- end card-body -->
                                                            </div> <!-- end col -->

                                                        </div> <!-- end company-list-2-->
                                                    </div> <!-- end div.bg-light-->
                                                </div> <!-- end col -->

                                            </div> <!-- end row -->
                                        </div> <!-- end preview-->

                                        <div class="tab-pane code" id="move-stuff-code">
                                            <p class="m-2">Make sure to include following js files at end of <code>body element</code></p>

                                            <button class="btn-copy-clipboard" data-clipboard-action="copy">Copy</button>
                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;script src=&quot;${pageContext.request.contextPath }/resources/assets/vendor/dragula/dragula.min.js&quot;&gt;&lt;/script&gt;
                                                        &lt;script src=&quot;${pageContext.request.contextPath }/resources/assets/js/ui/component.dragula.js&quot;&gt;&lt;/script&gt;
                                                    </span>
                                               
                                                    <span class="html escape">
                                                        &lt;div class=&quot;row&quot; data-plugin=&quot;dragula&quot; data-containers='[&quot;company-list-left&quot;, &quot;company-list-right&quot;]'&gt;
                                                            &lt;div class=&quot;col-md-6&quot;&gt;
                                                                &lt;div class=&quot;bg-dragula p-2 p-lg-4&quot;&gt;
                                                                    &lt;h5 class=&quot;mt-0&quot;&gt;Part 1&lt;/h5&gt;
                                                                    &lt;div id=&quot;company-list-left&quot; class=&quot;py-2&quot;&gt;
                
                                                                        &lt;div class=&quot;card mb-0 mt-2&quot;&gt;
                                                                            &lt;div class=&quot;card-body&quot;&gt;
                                                                                &lt;div class=&quot;d-flex align-items-start&quot;&gt;
                                                                                    &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/users/avatar-1.jpg&quot; alt=&quot;image&quot; class=&quot;me-3 d-none d-sm-block avatar-sm rounded-circle&quot;&gt;
                                                                                    &lt;div class=&quot;w-100 overflow-hidden&quot;&gt;
                                                                                        &lt;h5 class=&quot;mb-1 mt-0&quot;&gt;Louis K. Bond&lt;/h5&gt;
                                                                                        &lt;p&gt; Founder &amp; CEO &lt;/p&gt;
                                                                                        &lt;p class=&quot;mb-0 text-muted&quot;&gt;
                                                                                            &lt;span class=&quot;fst-italic&quot;&gt;&lt;b&gt;&quot;&lt;/b&gt;Disrupt pork belly poutine, asymmetrical tousled succulents selfies. You probably haven't heard of them tattooed master cleanse live-edge keffiyeh.&lt;/span&gt;
                                                                                        &lt;/p&gt;
                                                                                    &lt;/div&gt; &lt;!-- end w-100 --&gt;
                                                                                &lt;/div&gt; &lt;!-- end d-flex --&gt;
                                                                            &lt;/div&gt; &lt;!-- end card-body --&gt;
                                                                        &lt;/div&gt; &lt;!-- end col --&gt;
                
                                                                        &lt;div class=&quot;card mb-0 mt-2&quot;&gt;
                                                                            &lt;div class=&quot;card-body&quot;&gt;
                                                                                &lt;div class=&quot;d-flex align-items-start&quot;&gt;
                                                                                    &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/users/avatar-2.jpg&quot; alt=&quot;image&quot; class=&quot;me-3 d-none d-sm-block avatar-sm rounded-circle&quot;&gt;
                                                                                    &lt;div class=&quot;w-100 overflow-hidden&quot;&gt;
                                                                                        &lt;h5 class=&quot;mb-1 mt-0&quot;&gt;Dennis N. Cloutier&lt;/h5&gt;
                                                                                        &lt;p&gt; Software Engineer &lt;/p&gt;
                                                                                        &lt;p class=&quot;mb-0 text-muted&quot;&gt;
                                                                                            &lt;span class=&quot;fst-italic&quot;&gt;&lt;b&gt;&quot;&lt;/b&gt;Disrupt pork belly poutine, asymmetrical tousled succulents selfies. You probably haven't heard of them tattooed master cleanse live-edge keffiyeh.&lt;/span&gt;
                                                                                        &lt;/p&gt;
                                                                                    &lt;/div&gt; &lt;!-- end w-100 --&gt;
                                                                                &lt;/div&gt; &lt;!-- end d-flex --&gt;
                                                                            &lt;/div&gt; &lt;!-- end card-body --&gt;
                                                                        &lt;/div&gt; &lt;!-- end col --&gt;
                
                                                                        &lt;div class=&quot;card mb-0 mt-2&quot;&gt;
                                                                            &lt;div class=&quot;card-body&quot;&gt;
                                                                                &lt;div class=&quot;d-flex align-items-start&quot;&gt;
                                                                                    &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/users/avatar-3.jpg&quot; alt=&quot;image&quot; class=&quot;me-3 d-none d-sm-block avatar-sm rounded-circle&quot;&gt;
                                                                                    &lt;div class=&quot;w-100 overflow-hidden&quot;&gt;
                                                                                        &lt;h5 class=&quot;mb-1 mt-0&quot;&gt;Susan J. Sander&lt;/h5&gt;
                                                                                        &lt;p&gt; Web Designer &lt;/p&gt;
                                                                                        &lt;p class=&quot;mb-0 text-muted&quot;&gt;
                                                                                            &lt;span class=&quot;fst-italic&quot;&gt;&lt;b&gt;&quot;&lt;/b&gt;Disrupt pork belly poutine, asymmetrical tousled succulents selfies. You probably haven't heard of them tattooed master cleanse live-edge keffiyeh.&lt;/span&gt;
                                                                                        &lt;/p&gt;
                                                                                    &lt;/div&gt; &lt;!-- end w-100 --&gt;
                                                                                &lt;/div&gt; &lt;!-- end d-flex --&gt;
                                                                            &lt;/div&gt; &lt;!-- end card-body --&gt;
                                                                        &lt;/div&gt; &lt;!-- end col --&gt;
                                                                        
                                                                    &lt;/div&gt; &lt;!-- end company-list-1--&gt;
                                                                &lt;/div&gt; &lt;!-- end div.bg-light--&gt;
                                                            &lt;/div&gt; &lt;!-- end col --&gt;
                
                                                            &lt;div class=&quot;col-md-6&quot;&gt;
                                                                &lt;div class=&quot;bg-dragula p-2 p-lg-4&quot;&gt;
                                                                    &lt;h5 class=&quot;mt-0&quot;&gt;Part 2&lt;/h5&gt;
                                                                    &lt;div id=&quot;company-list-right&quot; class=&quot;py-2&quot;&gt;
                                                                        &lt;div class=&quot;card mb-0 mt-2&quot;&gt;
                
                                                                            &lt;div class=&quot;card-body p-3&quot;&gt;
                                                                                &lt;div class=&quot;d-flex align-items-start&quot;&gt;
                                                                                    &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/users/avatar-4.jpg&quot; alt=&quot;image&quot; class=&quot;me-3 d-none d-sm-block avatar-sm rounded-circle&quot;&gt;
                                                                                    &lt;div class=&quot;w-100 overflow-hidden&quot;&gt;
                                                                                        &lt;h5 class=&quot;mb-1 mt-0&quot;&gt;James M. Short&lt;/h5&gt;
                                                                                        &lt;p&gt; Web Developer &lt;/p&gt;
                                                                                        &lt;p class=&quot;mb-0 text-muted&quot;&gt;
                                                                                            &lt;span class=&quot;fst-italic&quot;&gt;&lt;b&gt;&quot;&lt;/b&gt;Disrupt pork belly poutine, asymmetrical tousled succulents selfies. You probably haven't heard of them tattooed master cleanse live-edge keffiyeh &lt;/span&gt;
                                                                                        &lt;/p&gt;
                                                                                    &lt;/div&gt; &lt;!-- end w-100 --&gt;
                                                                                &lt;/div&gt; &lt;!-- end d-flex --&gt;
                                                                            &lt;/div&gt; &lt;!-- end card-body --&gt;
                                                                        &lt;/div&gt; &lt;!-- end col --&gt;
                
                                                                        &lt;div class=&quot;card mb-0 mt-2&quot;&gt;
                                                                            &lt;div class=&quot;card-body p-3&quot;&gt;
                                                                                &lt;div class=&quot;d-flex align-items-start&quot;&gt;
                                                                                    &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/users/avatar-5.jpg&quot; alt=&quot;image&quot; class=&quot;me-3 d-none d-sm-block avatar-sm rounded-circle&quot;&gt;
                                                                                    &lt;div class=&quot;w-100 overflow-hidden&quot;&gt;
                                                                                        &lt;h5 class=&quot;mb-1 mt-0&quot;&gt;Gabriel J. Snyder&lt;/h5&gt;
                                                                                        &lt;p&gt; Business Analyst &lt;/p&gt;
                                                                                        &lt;p class=&quot;mb-0 text-muted&quot;&gt;
                                                                                            &lt;span class=&quot;fst-italic&quot;&gt;&lt;b&gt;&quot;&lt;/b&gt;Disrupt pork belly poutine, asymmetrical tousled succulents selfies. You probably haven't heard of them tattooed master cleanse live-edge keffiyeh &lt;/span&gt;
                                                                                        &lt;/p&gt;
                                                                                    &lt;/div&gt; &lt;!-- end w-100 --&gt;
                                                                                &lt;/div&gt; &lt;!-- end d-flex --&gt;
                                                                            &lt;/div&gt; &lt;!-- end card-body --&gt;
                                                                        &lt;/div&gt; &lt;!-- end col --&gt;
                
                                                                        &lt;div class=&quot;card mb-0 mt-2&quot;&gt;
                                                                            &lt;div class=&quot;card-body p-3&quot;&gt;
                                                                                &lt;div class=&quot;d-flex align-items-start&quot;&gt;
                                                                                    &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/users/avatar-6.jpg&quot; alt=&quot;image&quot; class=&quot;me-3 d-none d-sm-block avatar-sm rounded-circle&quot;&gt;
                                                                                    &lt;div class=&quot;w-100 overflow-hidden&quot;&gt;
                                                                                        &lt;h5 class=&quot;mb-1 mt-0&quot;&gt;Louie C. Mason&lt;/h5&gt;
                                                                                        &lt;p&gt;Human Resources&lt;/p&gt;
                                                                                        &lt;p class=&quot;mb-0 text-muted&quot;&gt;
                                                                                            &lt;span class=&quot;fst-italic&quot;&gt;&lt;b&gt;&quot;&lt;/b&gt;Disrupt pork belly poutine, asymmetrical tousled succulents selfies. You probably haven't heard of them tattooed master cleanse live-edge keffiyeh &lt;/span&gt;
                                                                                        &lt;/p&gt;
                                                                                    &lt;/div&gt; &lt;!-- end w-100 --&gt;
                                                                                &lt;/div&gt; &lt;!-- end d-flex --&gt;
                                                                            &lt;/div&gt; &lt;!-- end card-body --&gt;
                                                                        &lt;/div&gt; &lt;!-- end col --&gt;
                                                                        
                                                                    &lt;/div&gt; &lt;!-- end company-list-2--&gt;
                                                                &lt;/div&gt; &lt;!-- end div.bg-light--&gt;
                                                            &lt;/div&gt; &lt;!-- end col --&gt;
                
                                                        &lt;/div&gt; &lt;!-- end row --&gt; 
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->
                                </div> <!-- end card-body -->
                            </div> <!-- end card -->
                        </div> <!-- end col -->
                    </div> <!-- end row -->


                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Move stuff between containers using handle</h4>
                                    <p class="text-muted font-14 mb-3">
                                        Just specify the data attribute
                                        <code>data-plugin='dragula'</code>,
                                        <code>data-containers='["first-container-id", "second-container-id"]'</code> and
                                        <code>data-handle-class='dragula-handle'</code>.
                                    </p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#move-stuff-handle-preview" data-bs-toggle="tab" aria-expanded="false" class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#move-stuff-handle-code" data-bs-toggle="tab" aria-expanded="true" class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="move-stuff-handle-preview">
                                            <div class="row" data-plugin="dragula" data-containers='["handle-dragula-left", "handle-dragula-right"]' data-handleClass="dragula-handle">
                                                <div class="col-md-6">
                                                    <div class="bg-dragula p-2 p-lg-4">
                                                        <h5 class="mt-0">Part 1</h5>
                                                        <div id="handle-dragula-left" class="py-2">

                                                            <div class="card mb-0 mt-2">
                                                                <div class="card-body">
                                                                    <div class="d-flex align-items-start">
                                                                        <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-7.jpg" alt="image" class="me-3 d-none d-sm-block avatar-sm rounded-circle">
                                                                        <div class="w-100 overflow-hidden">
                                                                            <h5 class="mb-1 mt-1">Louis K. Bond</h5>
                                                                            <p class="mb-0"> Founder & CEO </p>
                                                                        </div> <!-- end w-100 -->
                                                                        <span class="dragula-handle"></span>
                                                                    </div> <!-- end d-flex -->
                                                                </div> <!-- end card-body -->
                                                            </div> <!-- end col -->

                                                            <div class="card mb-0 mt-2">
                                                                <div class="card-body">
                                                                    <div class="d-flex align-items-start">
                                                                        <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-8.jpg" alt="image" class="me-3 d-none d-sm-block avatar-sm rounded-circle">
                                                                        <div class="w-100 overflow-hidden">
                                                                            <h5 class="mb-1 mt-1">Dennis N. Cloutier</h5>
                                                                            <p class="mb-0"> Software Engineer </p>
                                                                        </div> <!-- end w-100 -->
                                                                        <span class="dragula-handle"></span>
                                                                    </div> <!-- end d-flex -->
                                                                </div> <!-- end card-body -->
                                                            </div> <!-- end col -->

                                                            <div class="card mb-0 mt-2">
                                                                <div class="card-body">
                                                                    <div class="d-flex align-items-start">
                                                                        <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-9.jpg" alt="image" class="me-3 d-none d-sm-block avatar-sm rounded-circle">
                                                                        <div class="w-100 overflow-hidden">
                                                                            <h5 class="mb-1 mt-1">Susan J. Sander</h5>
                                                                            <p class="mb-0"> Web Designer </p>
                                                                        </div> <!-- end w-100 -->
                                                                        <span class="dragula-handle"></span>
                                                                    </div> <!-- end d-flex -->
                                                                </div> <!-- end card-body -->
                                                            </div> <!-- end col -->

                                                        </div> <!-- end company-list-1-->
                                                    </div> <!-- end div.bg-light-->
                                                </div> <!-- end col -->

                                                <div class="col-md-6">
                                                    <div class="bg-dragula p-2 p-lg-4">
                                                        <h5 class="mt-0">Part 2</h5>
                                                        <div id="handle-dragula-right" class="py-2">
                                                            <div class="card mb-0 mt-2">

                                                                <div class="card-body p-3">
                                                                    <div class="d-flex align-items-start">
                                                                        <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-10.jpg" alt="image" class="me-3 d-none d-sm-block avatar-sm rounded-circle">
                                                                        <div class="w-100 overflow-hidden">
                                                                            <h5 class="mb-1 mt-1">James M. Short</h5>
                                                                            <p class="mb-0"> Web Developer </p>
                                                                        </div> <!-- end w-100 -->
                                                                        <span class="dragula-handle"></span>
                                                                    </div> <!-- end d-flex -->
                                                                </div> <!-- end card-body -->
                                                            </div> <!-- end col -->

                                                            <div class="card mb-0 mt-2">
                                                                <div class="card-body p-3">
                                                                    <div class="d-flex align-items-start">
                                                                        <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-5.jpg" alt="image" class="me-3 d-none d-sm-block avatar-sm rounded-circle">
                                                                        <div class="w-100 overflow-hidden">
                                                                            <h5 class="mb-1 mt-1">Gabriel J. Snyder</h5>
                                                                            <p class="mb-0"> Business Analyst </p>
                                                                        </div> <!-- end w-100 -->
                                                                        <span class="dragula-handle"></span>
                                                                    </div> <!-- end d-flex -->
                                                                </div> <!-- end card-body -->
                                                            </div> <!-- end col -->

                                                            <div class="card mb-0 mt-2">
                                                                <div class="card-body p-3">
                                                                    <div class="d-flex align-items-start">
                                                                        <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-3.jpg" alt="image" class="me-3 d-none d-sm-block avatar-sm rounded-circle">
                                                                        <div class="w-100 overflow-hidden">
                                                                            <h5 class="mb-1 mt-1">Louie C. Mason</h5>
                                                                            <p class="mb-0">Human Resources</p>
                                                                        </div> <!-- end w-100 -->
                                                                        <span class="dragula-handle"></span>
                                                                    </div> <!-- end d-flex -->
                                                                </div> <!-- end card-body -->
                                                            </div> <!-- end col -->

                                                        </div> <!-- end company-list-2-->
                                                    </div> <!-- end div.bg-light-->
                                                </div> <!-- end col -->

                                            </div> <!-- end row -->
                                        </div> <!-- end preview-->

                                        <div class="tab-pane code" id="move-stuff-handle-code">
                                            <p class="m-2">Make sure to include following js files at end of <code>body element</code></p>

                                            <button class="btn-copy-clipboard" data-clipboard-action="copy">Copy</button>

                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;script src=&quot;${pageContext.request.contextPath }/resources/assets/vendor/dragula/dragula.min.js&quot;&gt;&lt;/script&gt;
                                                        &lt;script src=&quot;${pageContext.request.contextPath }/resources/assets/js/ui/component.dragula.js&quot;&gt;&lt;/script&gt;
                                                    </span>

                                                    <span class="html escape">
                                                        &lt;div class=&quot;row&quot; data-plugin=&quot;dragula&quot; data-containers='[&quot;handle-dragula-left&quot;, &quot;handle-dragula-right&quot;]' data-handleClass=&quot;dragula-handle&quot;&gt;
                                                            &lt;div class=&quot;col-md-6&quot;&gt;
                                                                &lt;div class=&quot;bg-dragula p-2 p-lg-4&quot;&gt;
                                                                    &lt;h5 class=&quot;mt-0&quot;&gt;Part 1&lt;/h5&gt;
                                                                    &lt;div id=&quot;handle-dragula-left&quot; class=&quot;py-2&quot;&gt;
                
                                                                        &lt;div class=&quot;card mb-0 mt-2&quot;&gt;
                                                                            &lt;div class=&quot;card-body&quot;&gt;
                                                                                &lt;div class=&quot;d-flex align-items-start&quot;&gt;
                                                                                    &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/users/avatar-7.jpg&quot; alt=&quot;image&quot; class=&quot;me-3 d-none d-sm-block avatar-sm rounded-circle&quot;&gt;
                                                                                    &lt;div class=&quot;w-100 overflow-hidden&quot;&gt;
                                                                                        &lt;h5 class=&quot;mb-1 mt-1&quot;&gt;Louis K. Bond&lt;/h5&gt;
                                                                                        &lt;p class=&quot;mb-0&quot;&gt; Founder &amp; CEO &lt;/p&gt;
                                                                                    &lt;/div&gt; &lt;!-- end w-100 --&gt;
                                                                                    &lt;span class=&quot;dragula-handle&quot;&gt;&lt;/span&gt;
                                                                                &lt;/div&gt; &lt;!-- end d-flex --&gt;
                                                                            &lt;/div&gt; &lt;!-- end card-body --&gt;
                                                                        &lt;/div&gt; &lt;!-- end col --&gt;
                
                                                                        &lt;div class=&quot;card mb-0 mt-2&quot;&gt;
                                                                            &lt;div class=&quot;card-body&quot;&gt;
                                                                                &lt;div class=&quot;d-flex align-items-start&quot;&gt;
                                                                                    &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/users/avatar-8.jpg&quot; alt=&quot;image&quot; class=&quot;me-3 d-none d-sm-block avatar-sm rounded-circle&quot;&gt;
                                                                                    &lt;div class=&quot;w-100 overflow-hidden&quot;&gt;
                                                                                        &lt;h5 class=&quot;mb-1 mt-1&quot;&gt;Dennis N. Cloutier&lt;/h5&gt;
                                                                                        &lt;p class=&quot;mb-0&quot;&gt; Software Engineer &lt;/p&gt;
                                                                                    &lt;/div&gt; &lt;!-- end w-100 --&gt;
                                                                                    &lt;span class=&quot;dragula-handle&quot;&gt;&lt;/span&gt;
                                                                                &lt;/div&gt; &lt;!-- end d-flex --&gt;
                                                                            &lt;/div&gt; &lt;!-- end card-body --&gt;
                                                                        &lt;/div&gt; &lt;!-- end col --&gt;
                
                                                                        &lt;div class=&quot;card mb-0 mt-2&quot;&gt;
                                                                            &lt;div class=&quot;card-body&quot;&gt;
                                                                                &lt;div class=&quot;d-flex align-items-start&quot;&gt;
                                                                                    &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/users/avatar-9.jpg&quot; alt=&quot;image&quot; class=&quot;me-3 d-none d-sm-block avatar-sm rounded-circle&quot;&gt;
                                                                                    &lt;div class=&quot;w-100 overflow-hidden&quot;&gt;
                                                                                        &lt;h5 class=&quot;mb-1 mt-1&quot;&gt;Susan J. Sander&lt;/h5&gt;
                                                                                        &lt;p class=&quot;mb-0&quot;&gt; Web Designer &lt;/p&gt;
                                                                                    &lt;/div&gt; &lt;!-- end w-100 --&gt;
                                                                                    &lt;span class=&quot;dragula-handle&quot;&gt;&lt;/span&gt;
                                                                                &lt;/div&gt; &lt;!-- end d-flex --&gt;
                                                                            &lt;/div&gt; &lt;!-- end card-body --&gt;
                                                                        &lt;/div&gt; &lt;!-- end col --&gt;
                                                                        
                                                                    &lt;/div&gt; &lt;!-- end company-list-1--&gt;
                                                                &lt;/div&gt; &lt;!-- end div.bg-light--&gt;
                                                            &lt;/div&gt; &lt;!-- end col --&gt;
                
                                                            &lt;div class=&quot;col-md-6&quot;&gt;
                                                                &lt;div class=&quot;bg-dragula p-2 p-lg-4&quot;&gt;
                                                                    &lt;h5 class=&quot;mt-0&quot;&gt;Part 2&lt;/h5&gt;
                                                                    &lt;div id=&quot;handle-dragula-right&quot; class=&quot;py-2&quot;&gt;
                                                                        &lt;div class=&quot;card mb-0 mt-2&quot;&gt;
                
                                                                            &lt;div class=&quot;card-body p-3&quot;&gt;
                                                                                &lt;div class=&quot;d-flex align-items-start&quot;&gt;
                                                                                    &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/users/avatar-10.jpg&quot; alt=&quot;image&quot; class=&quot;me-3 d-none d-sm-block avatar-sm rounded-circle&quot;&gt;
                                                                                    &lt;div class=&quot;w-100 overflow-hidden&quot;&gt;
                                                                                        &lt;h5 class=&quot;mb-1 mt-1&quot;&gt;James M. Short&lt;/h5&gt;
                                                                                        &lt;p class=&quot;mb-0&quot;&gt; Web Developer &lt;/p&gt;
                                                                                    &lt;/div&gt; &lt;!-- end w-100 --&gt;
                                                                                    &lt;span class=&quot;dragula-handle&quot;&gt;&lt;/span&gt;
                                                                                &lt;/div&gt; &lt;!-- end d-flex --&gt;
                                                                            &lt;/div&gt; &lt;!-- end card-body --&gt;
                                                                        &lt;/div&gt; &lt;!-- end col --&gt;
                
                                                                        &lt;div class=&quot;card mb-0 mt-2&quot;&gt;
                                                                            &lt;div class=&quot;card-body p-3&quot;&gt;
                                                                                &lt;div class=&quot;d-flex align-items-start&quot;&gt;
                                                                                    &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/users/avatar-5.jpg&quot; alt=&quot;image&quot; class=&quot;me-3 d-none d-sm-block avatar-sm rounded-circle&quot;&gt;
                                                                                    &lt;div class=&quot;w-100 overflow-hidden&quot;&gt;
                                                                                        &lt;h5 class=&quot;mb-1 mt-1&quot;&gt;Gabriel J. Snyder&lt;/h5&gt;
                                                                                        &lt;p class=&quot;mb-0&quot;&gt; Business Analyst &lt;/p&gt;
                                                                                    &lt;/div&gt; &lt;!-- end w-100 --&gt;
                                                                                    &lt;span class=&quot;dragula-handle&quot;&gt;&lt;/span&gt;
                                                                                &lt;/div&gt; &lt;!-- end d-flex --&gt;
                                                                            &lt;/div&gt; &lt;!-- end card-body --&gt;
                                                                        &lt;/div&gt; &lt;!-- end col --&gt;
                
                                                                        &lt;div class=&quot;card mb-0 mt-2&quot;&gt;
                                                                            &lt;div class=&quot;card-body p-3&quot;&gt;
                                                                                &lt;div class=&quot;d-flex align-items-start&quot;&gt;
                                                                                    &lt;img src=&quot;${pageContext.request.contextPath }/resources/assets/images/users/avatar-3.jpg&quot; alt=&quot;image&quot; class=&quot;me-3 d-none d-sm-block avatar-sm rounded-circle&quot;&gt;
                                                                                    &lt;div class=&quot;w-100 overflow-hidden&quot;&gt;
                                                                                        &lt;h5 class=&quot;mb-1 mt-1&quot;&gt;Louie C. Mason&lt;/h5&gt;
                                                                                        &lt;p class=&quot;mb-0&quot;&gt;Human Resources&lt;/p&gt;
                                                                                    &lt;/div&gt; &lt;!-- end w-100 --&gt;
                                                                                    &lt;span class=&quot;dragula-handle&quot;&gt;&lt;/span&gt;
                                                                                &lt;/div&gt; &lt;!-- end d-flex --&gt;
                                                                            &lt;/div&gt; &lt;!-- end card-body --&gt;
                                                                        &lt;/div&gt; &lt;!-- end col --&gt;
                                                                        
                                                                    &lt;/div&gt; &lt;!-- end company-list-2--&gt;
                                                                &lt;/div&gt; &lt;!-- end div.bg-light--&gt;
                                                            &lt;/div&gt; &lt;!-- end col --&gt;
                
                                                        &lt;/div&gt; &lt;!-- end row --&gt;
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->

                                </div> <!-- end card-body -->
                            </div> <!-- end card -->
                        </div> <!-- end col -->
                    </div> <!-- end row -->

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

    <!-- Dragula js-->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/dragula/dragula.min.js"></script>

    <!-- Dragula Demo Component js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/ui/component.dragula.js"></script>

    <!-- App js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>

</body>

</html>