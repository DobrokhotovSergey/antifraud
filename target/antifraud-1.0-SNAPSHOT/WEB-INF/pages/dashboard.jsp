<%--
  Created by IntelliJ IDEA.
  User: Mr. Dobrik
  Date: 04.02.2018
  Time: 09:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page session="true" contentType="text/html;charset=UTF-8" language="java" %>

<div class="box box-primary" id="userDiv" class="x_panel">
    <div class="box-header">
        <i class="ion ion-clipboard"></i>
        <h3 class="box-title">Статистика Онлайна Пользователей</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <div class="x_content">
            <div class="col-md-6">
                <canvas id="pieChart" style="height:250px"></canvas>
                <div id="legend" class="chart-legend"></div>
            </div>

        </div>
    </div>
</div>

