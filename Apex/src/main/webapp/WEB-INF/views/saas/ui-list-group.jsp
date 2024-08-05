<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>List Group | Hyper - Responsive Bootstrap 5 Admin Dashboard</title>
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
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Base UI</a></li>
                                        <li class="breadcrumb-item active">List Group</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">List Group</h4>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-xl-4">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Basic example</h4>

                                    <p class="text-muted font-14">The most basic list group is an unordered list with
                                        list items and the proper classes.
                                        Build upon it with the options that follow, or with your own CSS as needed.
                                    </p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#basic-example-preview" data-bs-toggle="tab" aria-expanded="false"
                                                class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#basic-example-code" data-bs-toggle="tab" aria-expanded="true"
                                                class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="basic-example-preview">
                                            <ul class="list-group">
                                                <li class="list-group-item"><i class="uil-google-drive-alt me-1"></i>
                                                    Google Drive</li>
                                                <li class="list-group-item"><i class="uil-facebook-messenger me-1"></i>
                                                    Facebook Messenger</li>
                                                <li class="list-group-item"><i class="uil-apple me-1"></i> Apple
                                                    Technology Company</li>
                                                <li class="list-group-item"><i class="uil-intercom me-1"></i> Intercom
                                                    Support System</li>
                                                <li class="list-group-item"><i class="uil-paypal me-1"></i> Paypal
                                                    Payment Gateway</li>
                                            </ul>
                                        </div> <!-- end preview-->

                                        <div class="tab-pane code" id="basic-example-code">
                                            <button class="btn-copy-clipboard"
                                                data-clipboard-action="copy">Copy</button>
                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;ul class=&quot;list-group&quot;&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;uil-google-drive-alt me-1&quot;&gt;&lt;/i&gt; Google Drive&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;uil-facebook-messenger me-1&quot;&gt;&lt;/i&gt; Facebook Messenger&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;uil-apple me-1&quot;&gt;&lt;/i&gt; Apple Technology Company&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;uil-intercom me-1&quot;&gt;&lt;/i&gt; Intercom Support System&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;uil-paypal me-1&quot;&gt;&lt;/i&gt; Paypal Payment Gateway&lt;/li&gt;
                                                        &lt;/ul&gt;  
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->
                                </div> <!-- end card-body -->
                            </div> <!-- end card-->
                        </div> <!-- end col -->

                        <div class="col-xl-4">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Active items</h4>
                                    <p class="text-muted font-14">Add <code>.active</code> to a
                                        <code>.list-group-item</code> to indicate the current active selection.
                                    </p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#active-items-preview" data-bs-toggle="tab" aria-expanded="false"
                                                class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#active-items-code" data-bs-toggle="tab" aria-expanded="true"
                                                class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="active-items-preview">
                                            <ul class="list-group">
                                                <li class="list-group-item active"><i
                                                        class="uil-google-drive-alt me-1"></i> Google Drive</li>
                                                <li class="list-group-item"><i class="uil-facebook-messenger me-1"></i>
                                                    Facebook Messenger</li>
                                                <li class="list-group-item"><i class="uil-apple me-1"></i> Apple
                                                    Technology Company</li>
                                                <li class="list-group-item"><i class="uil-intercom me-1"></i> Intercom
                                                    Support System</li>
                                                <li class="list-group-item"><i class="uil-paypal me-1"></i> Paypal
                                                    Payment Gateway</li>
                                            </ul>
                                        </div> <!-- end preview-->

                                        <div class="tab-pane code" id="active-items-code">
                                            <button class="btn-copy-clipboard"
                                                data-clipboard-action="copy">Copy</button>
                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;ul class=&quot;list-group&quot;&gt;
                                                            &lt;li class=&quot;list-group-item active&quot;&gt;&lt;i class=&quot;uil-google-drive-alt me-1&quot;&gt;&lt;/i&gt; Google Drive&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;uil-facebook-messenger me-1&quot;&gt;&lt;/i&gt; Facebook Messenger&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;uil-apple me-1&quot;&gt;&lt;/i&gt; Apple Technology Company&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;uil-intercom me-1&quot;&gt;&lt;/i&gt; Intercom Support System&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;uil-paypal me-1&quot;&gt;&lt;/i&gt; Paypal Payment Gateway&lt;/li&gt;
                                                        &lt;/ul&gt;
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->
                                </div> <!-- end card-body -->
                            </div> <!-- end card-->
                        </div> <!-- end col -->

                        <div class="col-xl-4">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Disabled items</h4>
                                    <p>Add <code>.disabled</code> to a <code>.list-group-item</code> to make it
                                        <em>appear</em> disabled.
                                    </p>
                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#disabled-items-preview" data-bs-toggle="tab" aria-expanded="false"
                                                class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#disabled-items-code" data-bs-toggle="tab" aria-expanded="true"
                                                class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="disabled-items-preview">
                                            <ul class="list-group">
                                                <li class="list-group-item disabled" aria-disabled="true"><i
                                                        class="uil-google-drive-alt me-1"></i> Google Drive</li>
                                                <li class="list-group-item"><i class="uil-facebook-messenger me-1"></i>
                                                    Facebook Messenger</li>
                                                <li class="list-group-item"><i class="uil-apple me-1"></i> Apple
                                                    Technology Company</li>
                                                <li class="list-group-item"><i class="uil-intercom me-1"></i> Intercom
                                                    Support System</li>
                                                <li class="list-group-item"><i class="uil-paypal me-1"></i> Paypal
                                                    Payment Gateway</li>
                                            </ul>
                                        </div> <!-- end preview-->

                                        <div class="tab-pane code" id="disabled-items-code">
                                            <button class="btn-copy-clipboard"
                                                data-clipboard-action="copy">Copy</button>
                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;ul class=&quot;list-group&quot;&gt;
                                                            &lt;li class=&quot;list-group-item disabled&quot; aria-disabled=&quot;true&quot;&gt;&lt;i class=&quot;uil-google-drive-alt me-1&quot;&gt;&lt;/i&gt; Google Drive&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;uil-facebook-messenger me-1&quot;&gt;&lt;/i&gt; Facebook Messenger&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;uil-apple me-1&quot;&gt;&lt;/i&gt; Apple Technology Company&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;uil-intercom me-1&quot;&gt;&lt;/i&gt; Intercom Support System&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;&lt;i class=&quot;uil-paypal me-1&quot;&gt;&lt;/i&gt; Paypal Payment Gateway&lt;/li&gt;
                                                        &lt;/ul&gt;  
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->
                                </div> <!-- end card-body -->
                            </div> <!-- end card-->
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-xl-4">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Links and Buttons</h4>
                                    <p class="text-muted font-14">Use <code>&lt;a&gt;</code>s or
                                        <code>&lt;button&gt;</code>s to create <em>actionable</em> list group items with
                                        hover, disabled, and active states by adding
                                        <code>.list-group-item-action</code>.
                                    </p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#links-buttons-preview" data-bs-toggle="tab" aria-expanded="false"
                                                class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#links-buttons-code" data-bs-toggle="tab" aria-expanded="true"
                                                class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="links-buttons-preview">
                                            <div class="list-group">
                                                <a href="#" class="list-group-item list-group-item-action active">
                                                    Paypal Payment Gateway
                                                </a>
                                                <a href="#" class="list-group-item list-group-item-action">Google
                                                    Drive</a>
                                                <button type="button"
                                                    class="list-group-item list-group-item-action">Facebook
                                                    Messenger</button>
                                                <button type="button"
                                                    class="list-group-item list-group-item-action">Apple Technology
                                                    Company</button>
                                                <a href="#" class="list-group-item list-group-item-action disabled"
                                                    tabindex="-1" aria-disabled="true">Intercom Support System</a>
                                            </div>
                                        </div> <!-- end preview-->

                                        <div class="tab-pane code" id="links-buttons-code">
                                            <button class="btn-copy-clipboard"
                                                data-clipboard-action="copy">Copy</button>
                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;div class=&quot;list-group&quot;&gt;
                                                            &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action active&quot;&gt;
                                                                Paypal Payment Gateway
                                                            &lt;/a&gt;
                                                            &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action&quot;&gt;Google Drive&lt;/a&gt;
                                                            &lt;button type=&quot;button&quot; class=&quot;list-group-item list-group-item-action&quot;&gt;Facebook Messenger&lt;/button&gt;
                                                            &lt;button type=&quot;button&quot; class=&quot;list-group-item list-group-item-action&quot;&gt;Apple Technology Company&lt;/button&gt;
                                                            &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action disabled&quot; tabindex=&quot;-1&quot; aria-disabled=&quot;true&quot;&gt;Intercom Support System&lt;/a&gt;
                                                        &lt;/div&gt; 
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->
                                </div> <!-- end card-body -->
                            </div> <!-- end card-->
                        </div> <!-- end col -->

                        <div class="col-xl-4">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Flush</h4>
                                    <p class="text-muted font-14">Add <code>.list-group-flush</code> to remove some
                                        borders and rounded corners to render list group items edge-to-edge in a parent
                                        container (e.g., cards).</p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#flush-preview" data-bs-toggle="tab" aria-expanded="false"
                                                class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#flush-code" data-bs-toggle="tab" aria-expanded="true"
                                                class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="flush-preview">
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item">Google Drive</li>
                                                <li class="list-group-item">Facebook Messenger</li>
                                                <li class="list-group-item">Apple Technology Company</li>
                                                <li class="list-group-item">Intercom Support System</li>
                                                <li class="list-group-item">Paypal Payment Gateway</li>
                                            </ul>
                                        </div> <!-- end preview-->

                                        <div class="tab-pane code" id="flush-code">
                                            <button class="btn-copy-clipboard"
                                                data-clipboard-action="copy">Copy</button>
                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;ul class=&quot;list-group list-group-flush&quot;&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;Google Drive&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;Facebook Messenger&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;Apple Technology Company&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;Intercom Support System&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;Paypal Payment Gateway&lt;/li&gt;
                                                        &lt;/ul&gt; 
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->
                                </div> <!-- end card-body -->
                            </div> <!-- end card-->
                        </div> <!-- end col -->

                        <div class="col-xl-4">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Horizontal</h4>
                                    <p class="text-muted font-14">Add <code>.list-group-horizontal</code> to change the
                                        layout of list group items from vertical to horizontal across all breakpoints.
                                        Alternatively, choose a responsive variant
                                        <code>.list-group-horizontal-{sm|md|lg|xl}</code> to make a list group
                                        horizontal starting at that breakpoint’s <code>min-width</code>.
                                    </p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#horizontal-preview" data-bs-toggle="tab" aria-expanded="false"
                                                class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#horizontal-code" data-bs-toggle="tab" aria-expanded="true"
                                                class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="horizontal-preview">
                                            <ul class="list-group list-group-horizontal mb-3">
                                                <li class="list-group-item">Google</li>
                                                <li class="list-group-item">Whatsapp</li>
                                                <li class="list-group-item">Facebook</li>
                                            </ul>

                                            <ul class="list-group list-group-horizontal-sm mb-3">
                                                <li class="list-group-item">Apple</li>
                                                <li class="list-group-item">PayPal</li>
                                                <li class="list-group-item">Intercom</li>
                                            </ul>

                                            <ul class="list-group list-group-horizontal-md">
                                                <li class="list-group-item">Google</li>
                                                <li class="list-group-item">Whatsapp</li>
                                                <li class="list-group-item">Facebook</li>
                                            </ul>
                                        </div> <!-- end preview-->

                                        <div class="tab-pane code" id="horizontal-code">
                                            <button class="btn-copy-clipboard"
                                                data-clipboard-action="copy">Copy</button>
                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;!-- Vertical --&gt;
                                                        &lt;ul class=&quot;list-group list-group-horizontal&quot;&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;Google&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;Whatsapp&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;Facebook&lt;/li&gt;
                                                        &lt;/ul&gt;
                                                        
                                                        &lt;!-- Responsive Small --&gt;
                                                        &lt;ul class=&quot;list-group list-group-horizontal-sm&quot;&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;Apple&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;PayPal&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;Intercom&lt;/li&gt;
                                                        &lt;/ul&gt;
                                                        
                                                        &lt;!-- Responsive Medium --&gt;
                                                        &lt;ul class=&quot;list-group list-group-horizontal-md&quot;&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;Google&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;Whatsapp&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;Facebook&lt;/li&gt;
                                                        &lt;/ul&gt;
                                                        
                                                        &lt;!-- Responsive Large --&gt;
                                                        &lt;ul class=&quot;list-group list-group-horizontal-lg&quot;&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;Google&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;Whatsapp&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;Facebook&lt;/li&gt;
                                                        &lt;/ul&gt;
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->
                                </div> <!-- end card-body -->
                            </div> <!-- end card-->
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-xl-4">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Contextual classes</h4>
                                    <p class="text-muted font-14">Use contextual classes to style list items with a
                                        stateful background and color.</p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#contextual-preview" data-bs-toggle="tab" aria-expanded="false"
                                                class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#contextual-code" data-bs-toggle="tab" aria-expanded="true"
                                                class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="contextual-preview">
                                            <ul class="list-group">
                                                <li class="list-group-item">Dapibus ac facilisis in</li>
                                                <li class="list-group-item list-group-item-primary">A simple primary
                                                    list group item</li>
                                                <li class="list-group-item list-group-item-secondary">A simple secondary
                                                    list group item</li>
                                                <li class="list-group-item list-group-item-success">A simple success
                                                    list group item</li>
                                                <li class="list-group-item list-group-item-danger">A simple danger list
                                                    group item</li>
                                                <li class="list-group-item list-group-item-warning">A simple warning
                                                    list group item</li>
                                                <li class="list-group-item list-group-item-info">A simple info list
                                                    group item</li>
                                                <li class="list-group-item list-group-item-light">A simple light list
                                                    group item</li>
                                                <li class="list-group-item list-group-item-dark">A simple dark list
                                                    group item</li>
                                            </ul>
                                        </div> <!-- end preview-->

                                        <div class="tab-pane code" id="contextual-code">
                                            <button class="btn-copy-clipboard"
                                                data-clipboard-action="copy">Copy</button>
                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;ul class=&quot;list-group&quot;&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;Dapibus ac facilisis in&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item list-group-item-primary&quot;&gt;A simple primary list group item&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item list-group-item-secondary&quot;&gt;A simple secondary list group item&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item list-group-item-success&quot;&gt;A simple success list group item&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item list-group-item-danger&quot;&gt;A simple danger list group item&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item list-group-item-warning&quot;&gt;A simple warning list group item&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item list-group-item-info&quot;&gt;A simple info list group item&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item list-group-item-light&quot;&gt;A simple light list group item&lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item list-group-item-dark&quot;&gt;A simple dark list group item&lt;/li&gt;
                                                        &lt;/ul&gt; 
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->
                                </div> <!-- end card-body -->
                            </div> <!-- end card-->
                        </div> <!-- end col -->

                        <div class="col-xl-4">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Contextual classes with Link</h4>
                                    <p class="text-muted font-14">Use contextual classes to style list items with a
                                        stateful background and color.</p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#contextual-link-preview" data-bs-toggle="tab"
                                                aria-expanded="false" class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#contextual-link-code" data-bs-toggle="tab" aria-expanded="true"
                                                class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="contextual-link-preview">
                                            <div class="list-group">
                                                <a href="#" class="list-group-item list-group-item-action">Dapibus ac
                                                    facilisis in</a>
                                                <a href="#"
                                                    class="list-group-item list-group-item-action list-group-item-primary">A
                                                    simple primary list group item</a>
                                                <a href="#"
                                                    class="list-group-item list-group-item-action list-group-item-secondary">A
                                                    simple secondary list group item</a>
                                                <a href="#"
                                                    class="list-group-item list-group-item-action list-group-item-success">A
                                                    simple success list group item</a>
                                                <a href="#"
                                                    class="list-group-item list-group-item-action list-group-item-danger">A
                                                    simple danger list group item</a>
                                                <a href="#"
                                                    class="list-group-item list-group-item-action list-group-item-warning">A
                                                    simple warning list group item</a>
                                                <a href="#"
                                                    class="list-group-item list-group-item-action list-group-item-info">A
                                                    simple info list group item</a>
                                                <a href="#"
                                                    class="list-group-item list-group-item-action list-group-item-light">A
                                                    simple light list group item</a>
                                                <a href="#"
                                                    class="list-group-item list-group-item-action list-group-item-dark">A
                                                    simple dark list group item</a>
                                            </div>
                                        </div> <!-- end preview-->

                                        <div class="tab-pane code" id="contextual-link-code">
                                            <button class="btn-copy-clipboard"
                                                data-clipboard-action="copy">Copy</button>
                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;div class=&quot;list-group&quot;&gt;
                                                            &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action&quot;&gt;Dapibus ac facilisis in&lt;/a&gt;
                                                            &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action list-group-item-primary&quot;&gt;A simple primary list group item&lt;/a&gt;
                                                            &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action list-group-item-secondary&quot;&gt;A simple secondary list group item&lt;/a&gt;
                                                            &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action list-group-item-success&quot;&gt;A simple success list group item&lt;/a&gt;
                                                            &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action list-group-item-danger&quot;&gt;A simple danger list group item&lt;/a&gt;
                                                            &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action list-group-item-warning&quot;&gt;A simple warning list group item&lt;/a&gt;
                                                            &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action list-group-item-info&quot;&gt;A simple info list group item&lt;/a&gt;
                                                            &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action list-group-item-light&quot;&gt;A simple light list group item&lt;/a&gt;
                                                            &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action list-group-item-dark&quot;&gt;A simple dark list group item&lt;/a&gt;
                                                        &lt;/div&gt; 
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->
                                </div> <!-- end card-body -->
                            </div> <!-- end card-->
                        </div> <!-- end col -->

                        <div class="col-xl-4">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Custom content</h4>
                                    <p class="text-muted font-14">Add nearly any HTML within, even for linked list
                                        groups like the one below, with the help of flexbox utilities.</p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#custom-content-preview" data-bs-toggle="tab" aria-expanded="false"
                                                class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#custom-content-code" data-bs-toggle="tab" aria-expanded="true"
                                                class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="custom-content-preview">
                                            <div class="list-group">
                                                <a href="#" class="list-group-item list-group-item-action active">
                                                    <div class="d-flex w-100 justify-content-between">
                                                        <h5 class="mb-1">List group item heading</h5>
                                                        <small>3 days ago</small>
                                                    </div>
                                                    <p class="mb-1">Donec id elit non mi porta gravida at eget metus.
                                                        Maecenas sed diam eget risus varius blandit.</p>
                                                    <small>Donec id elit non mi porta.</small>
                                                </a>
                                                <a href="#" class="list-group-item list-group-item-action">
                                                    <div class="d-flex w-100 justify-content-between">
                                                        <h5 class="mb-1">List group item heading</h5>
                                                        <small class="text-muted">3 days ago</small>
                                                    </div>
                                                    <p class="mb-1">Donec id elit non mi porta gravida at eget metus.
                                                        Maecenas sed diam eget risus varius blandit.</p>
                                                    <small class="text-muted">Donec id elit non mi porta.</small>
                                                </a>
                                                <a href="#" class="list-group-item list-group-item-action">
                                                    <div class="d-flex w-100 justify-content-between">
                                                        <h5 class="mb-1">List group item heading</h5>
                                                        <small class="text-muted">3 days ago</small>
                                                    </div>
                                                    <p class="mb-1">Donec id elit non mi porta gravida at eget metus.
                                                        Maecenas sed diam eget risus varius blandit.</p>
                                                    <small class="text-muted">Donec id elit non mi porta.</small>
                                                </a>
                                            </div>
                                        </div> <!-- end preview-->

                                        <div class="tab-pane code" id="custom-content-code">
                                            <button class="btn-copy-clipboard"
                                                data-clipboard-action="copy">Copy</button>
                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;div class=&quot;list-group&quot;&gt;
                                                            &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action active&quot;&gt;
                                                                &lt;div class=&quot;d-flex w-100 justify-content-between&quot;&gt;
                                                                    &lt;h5 class=&quot;mb-1&quot;&gt;List group item heading&lt;/h5&gt;
                                                                    &lt;small&gt;3 days ago&lt;/small&gt;
                                                                &lt;/div&gt;
                                                                &lt;p class=&quot;mb-1&quot;&gt;Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.&lt;/p&gt;
                                                                &lt;small&gt;Donec id elit non mi porta.&lt;/small&gt;
                                                            &lt;/a&gt;
                                                            &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action&quot;&gt;
                                                                &lt;div class=&quot;d-flex w-100 justify-content-between&quot;&gt;
                                                                    &lt;h5 class=&quot;mb-1&quot;&gt;List group item heading&lt;/h5&gt;
                                                                    &lt;small class=&quot;text-muted&quot;&gt;3 days ago&lt;/small&gt;
                                                                &lt;/div&gt;
                                                                &lt;p class=&quot;mb-1&quot;&gt;Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.&lt;/p&gt;
                                                                &lt;small class=&quot;text-muted&quot;&gt;Donec id elit non mi porta.&lt;/small&gt;
                                                            &lt;/a&gt;
                                                            &lt;a href=&quot;#&quot; class=&quot;list-group-item list-group-item-action&quot;&gt;
                                                                &lt;div class=&quot;d-flex w-100 justify-content-between&quot;&gt;
                                                                    &lt;h5 class=&quot;mb-1&quot;&gt;List group item heading&lt;/h5&gt;
                                                                    &lt;small class=&quot;text-muted&quot;&gt;3 days ago&lt;/small&gt;
                                                                &lt;/div&gt;
                                                                &lt;p class=&quot;mb-1&quot;&gt;Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.&lt;/p&gt;
                                                                &lt;small class=&quot;text-muted&quot;&gt;Donec id elit non mi porta.&lt;/small&gt;
                                                            &lt;/a&gt;
                                                        &lt;/div&gt;
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->
                                </div> <!-- end card-body -->
                            </div> <!-- end card-->
                        </div> <!-- end col -->

                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-xl-4">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">With badges</h4>
                                    <p class="text-muted font-14">Add badges to any list group item to show unread
                                        counts, activity, and more with the help of some utilities.</p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#with-badges-preview" data-bs-toggle="tab" aria-expanded="false"
                                                class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#with-badges-code" data-bs-toggle="tab" aria-expanded="true"
                                                class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="with-badges-preview">
                                            <ul class="list-group">
                                                <li
                                                    class="list-group-item d-flex justify-content-between align-items-center">
                                                    Gmail Emails
                                                    <span class="badge bg-primary rounded-pill">14</span>
                                                </li>
                                                <li
                                                    class="list-group-item d-flex justify-content-between align-items-center">
                                                    Pending Payments
                                                    <span class="badge bg-success rounded-pill">2</span>
                                                </li>
                                                <li
                                                    class="list-group-item d-flex justify-content-between align-items-center">
                                                    Action Needed
                                                    <span class="badge bg-danger rounded-pill">99+</span>
                                                </li>
                                                <li
                                                    class="list-group-item d-flex justify-content-between align-items-center">
                                                    Payments Done
                                                    <span class="badge bg-success rounded-pill">20+</span>
                                                </li>
                                                <li
                                                    class="list-group-item d-flex justify-content-between align-items-center">
                                                    Pending Payments
                                                    <span class="badge bg-warning rounded-pill">12</span>
                                                </li>
                                            </ul>
                                        </div> <!-- end preview-->

                                        <div class="tab-pane code" id="with-badges-code">
                                            <button class="btn-copy-clipboard"
                                                data-clipboard-action="copy">Copy</button>
                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;ul class=&quot;list-group&quot;&gt;
                                                            &lt;li class=&quot;list-group-item d-flex justify-content-between align-items-center&quot;&gt;
                                                                Gmail Emails
                                                                &lt;span class=&quot;badge bg-primary rounded-pill&quot;&gt;14&lt;/span&gt;
                                                            &lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item d-flex justify-content-between align-items-center&quot;&gt;
                                                                Pending Payments
                                                                &lt;span class=&quot;badge bg-success rounded-pill&quot;&gt;2&lt;/span&gt;
                                                            &lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item d-flex justify-content-between align-items-center&quot;&gt;
                                                                Action Needed
                                                                &lt;span class=&quot;badge bg-danger rounded-pill&quot;&gt;99+&lt;/span&gt;
                                                            &lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item d-flex justify-content-between align-items-center&quot;&gt;
                                                                Payments Done
                                                                &lt;span class=&quot;badge bg-success rounded-pill&quot;&gt;20+&lt;/span&gt;
                                                            &lt;/li&gt;
                                                        &lt;/ul&gt;    
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->
                                </div> <!-- end card-body -->
                            </div> <!-- end card-->
                        </div> <!-- end col -->

                        <div class="col-xl-4">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Checkboxes and radios</h4>
                                    <p class="text-muted font-14">Place Bootstrap’s checkboxes and radios within list
                                        group items and customize as needed. You can use them without
                                        <code>&lt;label&gt;</code>s, but please remember to include an
                                        <code>aria-label</code> attribute and value for accessibility.
                                    </p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#checkboxes-and-radios-preview" data-bs-toggle="tab"
                                                aria-expanded="false" class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#checkboxes-and-radios-code" data-bs-toggle="tab"
                                                aria-expanded="true" class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="checkboxes-and-radios-preview">
                                            <ul class="list-group">
                                                <li class="list-group-item">
                                                    <input class="form-check-input me-1" type="checkbox" value=""
                                                        id="firstCheckbox">
                                                    <label class="form-check-label" for="firstCheckbox">First
                                                        checkbox</label>
                                                </li>
                                                <li class="list-group-item">
                                                    <input class="form-check-input me-1" type="checkbox" value=""
                                                        id="secondCheckbox">
                                                    <label class="form-check-label" for="secondCheckbox">Second
                                                        checkbox</label>
                                                </li>
                                            </ul>

                                            <ul class="list-group mt-2">
                                                <li class="list-group-item">
                                                    <input class="form-check-input me-1" type="radio"
                                                        name="listGroupRadio" value="" id="firstRadio" checked>
                                                    <label class="form-check-label" for="firstRadio">First radio</label>
                                                </li>
                                                <li class="list-group-item">
                                                    <input class="form-check-input me-1" type="radio"
                                                        name="listGroupRadio" value="" id="secondRadio">
                                                    <label class="form-check-label" for="secondRadio">Second
                                                        radio</label>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="tab-pane code" id="checkboxes-and-radios-code">
                                            <button class="btn-copy-clipboard"
                                                data-clipboard-action="copy">Copy</button>
                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;ul class=&quot;list-group&quot;&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;
                                                                &lt;input class=&quot;form-check-input me-1&quot; type=&quot;checkbox&quot; value=&quot;&quot;
                                                                    id=&quot;firstCheckbox&quot;&gt;
                                                                &lt;label class=&quot;form-check-label&quot; for=&quot;firstCheckbox&quot;&gt;First
                                                                    checkbox&lt;/label&gt;
                                                            &lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;
                                                                &lt;input class=&quot;form-check-input me-1&quot; type=&quot;checkbox&quot; value=&quot;&quot;
                                                                    id=&quot;secondCheckbox&quot;&gt;
                                                                &lt;label class=&quot;form-check-label&quot; for=&quot;secondCheckbox&quot;&gt;Second
                                                                    checkbox&lt;/label&gt;
                                                            &lt;/li&gt;
                                                        &lt;/ul&gt;

                                                        &lt;ul class=&quot;list-group&quot;&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;
                                                                &lt;input class=&quot;form-check-input me-1&quot; type=&quot;radio&quot;
                                                                    name=&quot;listGroupRadio&quot; value=&quot;&quot; id=&quot;firstRadio&quot; checked&gt;
                                                                &lt;label class=&quot;form-check-label&quot; for=&quot;firstRadio&quot;&gt;First radio&lt;/label&gt;
                                                            &lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item&quot;&gt;
                                                                &lt;input class=&quot;form-check-input me-1&quot; type=&quot;radio&quot;
                                                                    name=&quot;listGroupRadio&quot; value=&quot;&quot; id=&quot;secondRadio&quot;&gt;
                                                                &lt;label class=&quot;form-check-label&quot; for=&quot;secondRadio&quot;&gt;Second
                                                                    radio&lt;/label&gt;
                                                            &lt;/li&gt;
                                                        &lt;/ul&gt;
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->
                                </div> <!-- end card-body -->
                            </div> <!-- end card-->
                        </div> <!-- end col -->

                        <div class="col-xl-4">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Numbered</h4>
                                    <p class="text-muted font-14">Numbers are generated by <code>counter-reset</code> on
                                        the <code>&lt;ol&gt;</code>, and then styled and placed with a
                                        <code>::before</code> psuedo-element on the <code>&lt;li&gt;</code> with
                                        <code>counter-increment</code> and <code>content</code>.
                                    </p>

                                    <ul class="nav nav-tabs nav-bordered mb-3">
                                        <li class="nav-item">
                                            <a href="#numbered-preview" data-bs-toggle="tab" aria-expanded="false"
                                                class="nav-link active">
                                                Preview
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#numbered-code" data-bs-toggle="tab" aria-expanded="true"
                                                class="nav-link">
                                                Code
                                            </a>
                                        </li>
                                    </ul> <!-- end nav-->
                                    <div class="tab-content">
                                        <div class="tab-pane show active" id="numbered-preview">
                                            <ol class="list-group list-group-numbered">
                                                <li
                                                    class="list-group-item d-flex justify-content-between align-items-start">
                                                    <div class="ms-2 me-auto">
                                                        <div class="fw-bold">Hyper Admin</div>
                                                        Hyper Admin
                                                    </div>
                                                    <span class="badge bg-primary rounded-pill">865</span>
                                                </li>
                                                <li
                                                    class="list-group-item d-flex justify-content-between align-items-start">
                                                    <div class="ms-2 me-auto">
                                                        <div class="fw-bold">Hyper React Admin</div>
                                                        Hyper React Admin
                                                    </div>
                                                    <span class="badge bg-primary rounded-pill">140</span>
                                                </li>
                                                <li
                                                    class="list-group-item d-flex justify-content-between align-items-start">
                                                    <div class="ms-2 me-auto">
                                                        <div class="fw-bold">Angular Version</div>
                                                        Angular Version
                                                    </div>
                                                    <span class="badge bg-primary rounded-pill">85</span>
                                                </li>
                                            </ol>
                                        </div>
                                        <div class="tab-pane code" id="numbered-code">
                                            <button class="btn-copy-clipboard"
                                                data-clipboard-action="copy">Copy</button>
                                            <pre class="mb-0">
                                                    <span class="html escape">
                                                        &lt;ol class=&quot;list-group list-group-numbered&quot;&gt;
                                                            &lt;li class=&quot;list-group-item d-flex justify-content-between align-items-start&quot;&gt;
                                                                &lt;div class=&quot;ms-2 me-auto&quot;&gt;
                                                                    &lt;div class=&quot;fw-bold&quot;&gt;Subheading&lt;/div&gt;
                                                                    Cras justo odio
                                                                &lt;/div&gt;
                                                                &lt;span class=&quot;badge bg-primary rounded-pill&quot;&gt;14&lt;/span&gt;
                                                            &lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item d-flex justify-content-between align-items-start&quot;&gt;
                                                                &lt;div class=&quot;ms-2 me-auto&quot;&gt;
                                                                    &lt;div class=&quot;fw-bold&quot;&gt;Subheading&lt;/div&gt;
                                                                    Cras justo odio
                                                                &lt;/div&gt;
                                                                &lt;span class=&quot;badge bg-primary rounded-pill&quot;&gt;14&lt;/span&gt;
                                                            &lt;/li&gt;
                                                            &lt;li class=&quot;list-group-item d-flex justify-content-between align-items-start&quot;&gt;
                                                                &lt;div class=&quot;ms-2 me-auto&quot;&gt;
                                                                    &lt;div class=&quot;fw-bold&quot;&gt;Subheading&lt;/div&gt;
                                                                    Cras justo odio
                                                                &lt;/div&gt;
                                                                &lt;span class=&quot;badge bg-primary rounded-pill&quot;&gt;14&lt;/span&gt;
                                                            &lt;/li&gt;
                                                        &lt;/ol&gt;
                                                    </span>
                                                </pre> <!-- end highlight-->
                                        </div> <!-- end preview code-->
                                    </div> <!-- end tab-content-->
                                </div> <!-- end card-body -->
                            </div> <!-- end card-->
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

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

    <!-- App js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>

</body>

</html>