<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page session="true" contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<title>Admin Page | AntiFraud</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="resources/Ionicons/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="resources/dist/css/AdminLTE.min.css">
	<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect. -->
	<link rel="stylesheet" href="resources/dist/css/skins/skin-blue.min.css">


	<link href="resources/nprogress/nprogress.css" rel="stylesheet">
	<link href="resources/pnotify/pnotify.css" rel="stylesheet">
	<link href="resources/pnotify/pnotify.buttons.css" rel="stylesheet">
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="resources/dist/js/html5shiv.min.js"></script>
	<script src="resources/dist/js/respond.min.js"></script>
	<![endif]-->
	<link rel="stylesheet" href="/resources/singlePage/assets/css/spapp.css" />

	<!-- Google Font -->
	<link rel="stylesheet" href="resources/dist/css/google-font.css">
</head>

<div class="modal modal-form fade bs-example-modal-nm" id="update-profile-modal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-nm">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" class="place-progress" id="update-profile">Обновление Профиля</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-5">

						<!-- Profile Image -->
						<div class="box box-primary">
							<div class="box-body box-profile">
								<img class="img-responsive" id="preload-profile" src="/admin/getAvatar/${login}"  onerror="this.src='/resources/project/images/admin.png'" alt="User profile picture">

								<h3 class="profile-username text-center"></h3>
								<p class="text-muted text-center" profile-username-position></p>
							</div>
							<input type="file"  name="file" id="fileLoader"  value="browse" onchange="readURL(this);" />
							<input type="button" id="fileSubmit" value="change image"/>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-md-7">
						<div class="box box-primary" id="profile" class="x_panel">
							<div class="box-header">
								<i class="fa fa-user"></i>
								<h3 class="box-title">Профиль</h3>

							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="x_content">
									<form id="update-profile-form" data-parsley-validate class="form-horizontal form-label-left">
										<%--<input id="update-profile-login" style="display: none" value="${login}">--%>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12" for="profile-name">Имя
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" id="profile-name" name="firstname" value ="${firstname}"name="profileName" class="form-control" autocomplete="off">
											</div>
										</div>
										<p>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12" for="profile-lastName">Фамилия
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" id="profile-lastName" name="lastname" value ="${lastname}" name="profileLastName" class="form-control" autocomplete="off">
											</div>
										</div>
										<p>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12" for="profile-position">Должность
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" id="profile-position" name="position" value ="${position}" name="profileLastName" class="form-control" autocomplete="off">
											</div>
										</div>
										<p>

									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
				<button type="submit" class="btn btn-success" id="update-profile-submit">Сохранить</button>
			</div>

		</div>
	</div>
</div>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

	<!-- Main Header -->
	<header class="main-header">

		<!-- Logo -->
		<a href="index2.html" class="logo">
			<!-- mini logo for sidebar mini 50x50 pixels -->
			<span class="logo-mini"><b>A</b>F</span>
			<!-- logo for regular state and mobile devices -->
			<span class="logo-lg"><b>Anti</b>Fraud</span>
		</a>

		<!-- Header Navbar -->
		<nav class="navbar navbar-static-top" role="navigation">
			<!-- Sidebar toggle button-->
			<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
				<span class="sr-only">Toggle navigation</span>
			</a>
			<!-- Navbar Right Menu -->
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
					<!-- Messages: style can be found in dropdown.less-->
					<li class="dropdown messages-menu">
						<!-- Menu toggle button -->
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-envelope-o"></i>
							<span class="label label-success">4</span>
						</a>
						<ul class="dropdown-menu">
							<li class="header">You have 4 messages</li>
							<li>
								<!-- inner menu: contains the messages -->
								<ul class="menu">
									<li><!-- start message -->
										<a href="#">
											<div class="pull-left">
												<!-- User Image -->
												<img src="/admin/getAvatar/${login}"  onerror="this.src='/resources/project/images/admin.png'" class="user-image" alt="User Image">
											</div>
											<!-- Message title and timestamp -->
											<h4>
												Support Team
												<small><i class="fa fa-clock-o"></i> 5 mins</small>
											</h4>
											<!-- The message -->
											<p>Why not buy a new awesome theme?</p>
										</a>
									</li>
									<!-- end message -->
								</ul>
								<!-- /.menu -->
							</li>
							<li class="footer"><a href="#">See All Messages</a></li>
						</ul>
					</li>
					<!-- /.messages-menu -->

					<!-- Notifications Menu -->
					<li class="dropdown notifications-menu">
						<!-- Menu toggle button -->
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-bell-o"></i>
							<span class="label label-warning">10</span>
						</a>
						<ul class="dropdown-menu">
							<li class="header">You have 10 notifications</li>
							<li>
								<!-- Inner Menu: contains the notifications -->
								<ul class="menu">
									<li><!-- start notification -->
										<a href="#">
											<i class="fa fa-users text-aqua"></i> 5 new members joined today
										</a>
									</li>
									<!-- end notification -->
								</ul>
							</li>
							<li class="footer"><a href="#">View all</a></li>
						</ul>
					</li>
					<!-- Tasks Menu -->
					<li class="dropdown tasks-menu">
						<!-- Menu Toggle Button -->
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-flag-o"></i>
							<span class="label label-danger">9</span>
						</a>
						<ul class="dropdown-menu">
							<li class="header">You have 9 tasks</li>
							<li>
								<!-- Inner menu: contains the tasks -->
								<ul class="menu">
									<li><!-- Task item -->
										<a href="#">
											<!-- Task title and progress text -->
											<h3>
												Design some buttons
												<small class="pull-right">20%</small>
											</h3>
											<!-- The progress bar -->
											<div class="progress xs">
												<!-- Change the css width attribute to simulate progress -->
												<div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"
													 aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
													<span class="sr-only">20% Complete</span>
												</div>
											</div>
										</a>
									</li>
									<!-- end task item -->
								</ul>
							</li>
							<li class="footer">
								<a href="#">View all tasks</a>
							</li>
						</ul>
					</li>
					<!-- User Account Menu -->
					<li class="dropdown user user-menu">
						<!-- Menu Toggle Button -->
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<!-- The user image in the navbar-->
							<img src="/admin/getAvatar/${login}"  onerror="this.src='/resources/project/images/admin.png'" class="user-image" alt="User Image">
							<!-- hidden-xs hides the username on small devices so only the image appears. -->
							<span class="hidden-xs">${firstname} ${lastname}</span>
						</a>
						<ul class="dropdown-menu">
							<!-- The user image in the menu -->
							<li class="user-header">
								<img src="/admin/getAvatar/${login}" onerror="this.src='/resources/project/images/admin.png'"  class="img-circle" alt="User Image">

								<p>
									${firstname} ${lastname} - ${position}
								</p>
							</li>
							<li class="user-footer">
								<div class="pull-left">
									<a  class="btn btn-primary btn-flat" onclick="getProfile();">Профиль</a>
								</div>
								<div class="pull-right">
									<a href="/logout" class="btn btn-primary btn-flat">Выйти</a>
								</div>
							</li>
						</ul>
					</li>
					<!-- Control Sidebar Toggle Button -->
					<li>
						<a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<!-- Left side column. contains the logo and sidebar -->
	<aside class="main-sidebar">

		<!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar">

			<!-- Sidebar user panel (optional) -->
			<div class="user-panel">
				<div class="pull-left image">
					<img src="/admin/getAvatar/${login}" onerror="this.src='/resources/project/images/admin.png'"  class="img-circle" alt="User Image">
				</div>
				<div class="pull-left info">
					<p>${firstname} ${lastname}</p>
					<!-- Status -->
					<a href="#"><i class="fa fa-circle text-success"></i> Онлайн</a>
				</div>
			</div>
>

			<!-- Sidebar Menu -->
			<ul class="sidebar-menu" data-widget="tree">
				<li class="header">Главное</li>
				<li class="treeview">
					<a href="#" onclick="return false">
						<i class="fa fa-list"></i> <span>Таблица1</span>
					</a>
				</li>
				<li class="treeview">
					<a href="#" onclick="return false">
						<i class="fa fa-list"></i> <span>Таблица2</span>
					</a>
				</li>
				<!-- Optionally, you can add icons to the links -->
				<li class="header">Управление Пользователями</li>
				<%--<li class="treeview">--%>
					<%--<a href="#" onclick="getPageUsers();return false">--%>
						<%--<i class="fa fa-users"></i> <span>Пользователи</span>--%>
					<%--</a>--%>
				<%--</li>--%>
				<li><a href="#users"><i class="fa fa-users"></i> <span>Пользователи</span></a></li>
				<li><a href="#dashboard"><i class="fa fa-pie-chart"></i><span>Статистика</span></a></li>
				<li><a href="#view_3">go to view 3</a></li>
			</ul>
			<!-- /.sidebar-menu -->
		</section>
		<!-- /.sidebar -->
	</aside>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper" id="spapp" role="main">
		<!-- Content Header (Page header) -->
		<section id="dashboard" class="content container-fluid"></section>
		<section id="view_3" class="content container-fluid"><h1>view 3</h1></section>
		<section id="error_404" class="content container-fluid"><h1>Page not found</h1></section>
		<section id="users" class="content container-fluid" data-load="users"></section>
	</div>
	<!-- /.content-wrapper -->

	<!-- Main Footer -->
	<footer class="main-footer">
		<!-- To the right -->
		<div class="pull-right hidden-xs">

		</div>
		<!-- Default to the left -->

	</footer>

	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Create the tabs -->
		<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
			<li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
			<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content">
			<!-- Home tab content -->
			<div class="tab-pane active" id="control-sidebar-home-tab">
				<h3 class="control-sidebar-heading">Recent Activity</h3>
				<ul class="control-sidebar-menu">
					<li>
						<a href="javascript:;">
							<i class="menu-icon fa fa-birthday-cake bg-red"></i>

							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

								<p>Will be 23 on April 24th</p>
							</div>
						</a>
					</li>
				</ul>
				<!-- /.control-sidebar-menu -->

				<h3 class="control-sidebar-heading">Tasks Progress</h3>
				<ul class="control-sidebar-menu">
					<li>
						<a href="javascript:;">
							<h4 class="control-sidebar-subheading">
								Custom Template Design
								<span class="pull-right-container">
                    <span class="label label-danger pull-right">70%</span>
                  </span>
							</h4>

							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
							</div>
						</a>
					</li>
				</ul>
				<!-- /.control-sidebar-menu -->

			</div>
			<!-- /.tab-pane -->
			<!-- Stats tab content -->
			<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
			<!-- /.tab-pane -->
			<!-- Settings tab content -->
			<div class="tab-pane" id="control-sidebar-settings-tab">
				<form method="post">
					<h3 class="control-sidebar-heading">General Settings</h3>

					<div class="form-group">
						<label class="control-sidebar-subheading">
							Report panel usage
							<input type="checkbox" class="pull-right" checked>
						</label>

						<p>
							Some information about this general settings option
						</p>
					</div>
					<!-- /.form-group -->
				</form>
			</div>
			<!-- /.tab-pane -->
		</div>
	</aside>
	<!-- /.control-sidebar -->
	<!-- Add the sidebar's background. This div must be placed
    immediately after the control sidebar -->
	<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3 -->
<script src="resources/jquery/jquery.min.js"></script>
<script src="resources/project/js/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<link href="resources/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">

<style>
	.dataTables_wrapper .dt-buttons {
		float: left;
	}
	.dataTables_wrapper .dataTables_filter {
		float: right;
		text-align: right;
	}
	.dataTables_wrapper .dataTables_length {
		float: right;
		text-align: right;
		margin: auto;
		width: 50%;
	}

</style>

<script src="resources/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="resources/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<link href="resources/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
<link href="resources/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
<%--<link href="resources/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">--%>
<link href="resources/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
<script src="resources/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<!-- AdminLTE App -->
<script src="resources/dist/js/adminlte.min.js"></script>
<script src="resources/nprogress/nprogress.js"></script>
<script src="resources/pnotify/pnotify.js"></script>
<script src="resources/pnotify/pnotify.buttons.js"></script>
<script src="resources/chartjs/Chart.js"></script>
<script src="resources/build/js/custom.js"></script>
<script src="resources/project/js/project.js"></script>
<script src="resources/singlePage/assets/js/jquery.spapp.js"></script>
<script src="resources/singlePage/assets/js/custom.js"></script>

<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->

<style>
	.spinner {
		left: 50%;
		margin-left: -4em;
		color: red;
	}
</style>

</body>
</html>