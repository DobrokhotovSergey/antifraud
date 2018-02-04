<%--
  Created by IntelliJ IDEA.
  User: Mr. Dobrik
  Date: 04.02.2018
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal modal-form fade bs-example-modal-nm" id="deleteUser-modal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-nm">
        <div class="modal-content">
            <input id="username-user-delete" style="display: none"/>
            <input id="id-user-delete" style="display: none"/>
            <input id="pos-user-delete" style="display: none"/>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Удаление пользователя</h4>
            </div>
            <div class="modal-body">
                <form id="deleteUser-form" data-parsley-validate class="form-horizontal form-label-left">
                    Вы уверены, что хотите удалить Пользователя?
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                <button type="submit" class="btn btn-success" id="deleteUser-submit">Подтвердить</button>
            </div>

        </div>
    </div>
</div>
<div class="modal modal-form fade bs-example-modal-nm" id="addUser-modal"  role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-nm">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="addUserLabel">Добавление нового пользователя</h4>
            </div>
            <div class="modal-body">
                <form id="addUser-form" data-parsley-validate class="form-horizontal form-label-left">
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user-name">Логин<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="user-name" name="username" required="required" class="form-control col-md-7 col-xs-12" autocomplete="off">
                        </div>
                    </div>
                    <div class="form-group">

                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user-password">Пароль<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="password" id="user-password" name="password" required="required" class="form-control col-md-7 col-xs-12" autocomplete="off">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user-firstname">Имя<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="user-firstname" name="firstname" required="required" class="form-control col-md-7 col-xs-12" autocomplete="off">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user-lastname">Фамилия<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="user-lastname" name="lastname" required="required" class="form-control col-md-7 col-xs-12" autocomplete="off">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user-position">Должность<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="user-position" name="position" required="required" class="form-control col-md-7 col-xs-12" autocomplete="off">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="user-role">Роль<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control col-md-7 col-xs-12" name="userRole" id="user-role">
                                <option value="ROLE_ADMIN">ADMIN</option>
                                <option value="ROLE_USER">USER</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                <button type="submit" class="btn btn-success" id="addUser-submit">Создать</button>
            </div>

        </div>
    </div>
</div>
<div class="modal modal-form fade bs-example-modal-nm" id="editUser-modal"  role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-nm">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="editUserLabel">Редактирование Пользователя</h4>
            </div>
            <input id="edit-user-pos" style="display: none">
            <input id="edit-user-id" style="display: none">

            <div class="modal-body">
                <form id="editUser-form" data-parsley-validate class="form-horizontal form-label-left">
                    <input id="edit-user-login" style="display: none">
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="edit-user-firstname">Имя<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="edit-user-firstname" name="firstname" required="required" class="form-control col-md-7 col-xs-12" autocomplete="off">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="edit-user-lastname">Фамилия<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="edit-user-lastname" name="lastname" required="required" class="form-control col-md-7 col-xs-12" autocomplete="off">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="edit-user-position">Должность<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="edit-user-position" name="position" required="required" class="form-control col-md-7 col-xs-12" autocomplete="off">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="edit-user-role">Роль<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select class="form-control col-md-7 col-xs-12" name="userRole" id="edit-user-role">
                                <option value="ROLE_ADMIN">ADMIN</option>
                                <option value="ROLE_USER">USER</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                <button type="submit" class="btn btn-success" id="editUser-submit">Изменить</button>
            </div>

        </div>
    </div>
</div>

<div class="box box-primary" id="userDiv" class="x_panel">
    <div class="box-header">
        <i class="ion ion-clipboard"></i>
        <h3 class="box-title">Пользователи</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <div class="x_content">
            <div class="table-responsive">
                <table id="user-table" class="table no-margin" style="width: 100%">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>Логин</th>
                        <th>Пользователь</th>

                        <%--<th>position</th>--%>
                        <th>Роль</th>
                        <th>Статус</th>
                        <th>Редактирование</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    var tableUsers = $('#user-table').DataTable({
        destroy: true,
        // dom: '<<rB><lf><t>ip>',
        dom: '<Blf<t>ip>',
        columnDefs: [ {
            orderable: false,
            targets  : 'no-sort',
            targets:   [0],
            visible: false,
            searchable: false,
        },{},{},{},{
            orderable: false,
            targets  : 'no-sort',
            targets:   [5],
            searchable: false,}],
        // "ordering": false,
        buttons: [
            {
                className: "btn btn-success",
                text: '<i class="fa fa-plus" style="color:white"></i><span style="color:white"> Добавить польз.</span>',
                action: function () {
                    $('#addUser-modal').modal('show');
                }}],
        language: {
            url: "https://cdn.datatables.net/plug-ins/1.10.13/i18n/Russian.json"
        },
    });

    function getImageUserFormat(user, firstname,lastname, position){
        var block = '<div class="post">'+
            '<div class="user-block">'+
            '<span class="divCrop"></span>'+
            '<img class="img-circle img-bordered-sm crop" src="/admin/getAvatar/'+user+'" onerror="this.src=\'/resources/project/images/admin.png\'" alt="user image">'+
            '<span class="username">'+
            '<a href="#"><span class="imageFormat-firstname">'+firstname+'</span> <span class="imageFormat-lastname">'+lastname+'</span></a>'+

            '</span>'+
            '<span class="description imageFormat-position">'+position+'</span>'+
            '</div>'+

            '</div>';

        //return '<img src="/admin/getAvatar/'+user+'" onerror="this.src=\'/resources/images/admin.png\'" class="user-image" alt="User Image">';
        return block;
    }
    function getStatusUser(isOnline){
        var status = isOnline!=false?'<span class="label label-success">онлайн</span>':
            '<span class="label label-danger">оффлайн</span>';
        return status;
    }
    function getPageUsers(){

        $.ajax({
            type: "post",
            url: "/admin/ajax/getOnlineUsers",
            dataType: 'json',
            contentType: "application/json; charset=utf-8",

            success: function (data) {

                tableUsers.clear().draw();
                var rows = [];
                $.each(data, function(i,item){
                    rows[i] = [item.userRole.userRoleId, item.username,
                        getImageUserFormat(item.username, item.firstname, item.lastname, item.position),
                        item.userRole.role,getStatusUser(item.online),
                        '<a class="btn btn-info edit-user btn-xs"><i class="fa fa-pencil"></i> Ред. </a>  '+
                        '<a class="btn btn-danger delete-user  btn-xs"><i class="fa  fa-trash-o"></i> Удал. </a>']

                })

                tableUsers.rows.add(rows).draw();
            },
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
                beforeSend();
            },
            complete: function () {
                NProgress.done();
                unblock_screen();
            },

            error: function (xhr, status, error) {
                notifyAfterAjax('danger','Простите, но таблица Пользователей не доступна :(');
                console.log(xhr);
                console.log(status);
                console.log(error);

            }
        });
    }
    $('#addUser-submit').on('click', function(){
        var form = $('#addUser-form').serializeObject();
        form['userRole'] = {role: form.userRole};
        console.log(form);
        $('#addUser-modal').modal('hide');
        $.ajax({
            type: "post",
            url: "/admin/ajax/createUser",
            dataType: 'json',
            data:JSON.stringify(form),
            contentType: "application/json; charset=utf-8",
            success: function (item) {
                console.log(item);
                tableUsers.row.add([item.userRole.userRoleId, item.username,
                    getImageUserFormat(item.username, item.firstname, item.lastname, item.position),
                    item.userRole.role,getStatusUser(item.online),
                    '<a class="btn btn-info edit-user btn-xs"><i class="fa fa-pencil"></i> Ред. </a>  '+
                    '<a class="btn btn-danger delete-user  btn-xs"><i class="fa  fa-trash-o"></i> Удал. </a>']).draw();
                notifyAfterAjax('success','создан новый Пользователь!');
            },
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
                beforeSend();
            },
            complete: function () {
                NProgress.done();
                unblock_screen();
            },
            error: function (xhr, status, error) {
                notifyAfterAjax('danger','Простите, но Пользователь не был создан :(');
                console.log(xhr);
                console.log(status);
                console.log(error);
            }
        });
    });
    $('#user-table tbody').on('click', 'tr td .delete-user', function(){
        $('#deleteUser-modal').modal('show');
        var position = tableUsers.cell($(this).parents('td') ).index().row;
        var data = tableUsers.row( $(this).parents('tr') ).data();
        $('#pos-user-delete').text(position);
        $('#username-user-delete').text(data[1]);
        $('#id-user-delete').text(data[0]);

    });
    $('#deleteUser-submit').on('click', function(){
        var pos = $('#pos-user-delete').text();
        var user = $('#username-user-delete').text();
        var id = $('#id-user-delete').text();
        $.ajax({
            type: "post",
            url: "/admin/ajax/deleteUser",
            dataType: 'json',
            data:JSON.stringify({userRole:{userRoleId:id}, username:user}),
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                $('#deleteUser-modal').modal('hide');
                if(data){
                    tableUsers.row(pos).remove() .draw();
                    notifyAfterAjax('success','Пользователь "'+user+"' удален");

                }else{
                    notifyAfterAjax('danger','Простите, но Пользователь "'+user+'" не удален :(');
                }
            },
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
                beforeSend();
            },
            complete: function () {
                NProgress.done();
                unblock_screen();
            },
            error: function (xhr, status, error) {
                notifyAfterAjax('danger','Простите, но Пользователь "'+user+'" не удален :(');
                console.log(xhr);
                console.log(status);
                console.log(error);
            }
        });
    });

    $('#user-table tbody').on('click', 'tr td .edit-user', function(){
        $('#editUser-modal').modal('show');
        var data = tableUsers.row( $(this).parents('tr') ).data();
        var position = tableUsers.cell($(this).parents('td') ).index().row;
        var firstname = data[2];

        $('#edit-user-pos').text(position);

        $('#edit-user-id').val(data[0]);
        $('#edit-user-login').val(data[1]);
        $('#edit-user-firstname').val( $(this).parents('tr').find('.post').find('.imageFormat-firstname').text());
        $('#edit-user-lastname').val( $(this).parents('tr').find('.post').find('.imageFormat-lastname').text());
        $('#edit-user-position').val( $(this).parents('tr').find('.post').find('.imageFormat-position').text());
        $('#edit-user-role').val(data[3]).change();
    });

    $('#editUser-submit').on('click', function(){
        var form = $('#editUser-form').serializeObject();
        var user = $('#edit-user-login').val();
        form['username'] = user;
        form['userRole'] = {role: form.userRole, userRoleId:$('#edit-user-id').val()};

        $('#editUser-modal').modal('hide');
        console.log(form);
        $.ajax({
            type: "post",
            url: "/admin/ajax/editUser",
            dataType: 'json',
            data:JSON.stringify(form),
            contentType: "application/json; charset=utf-8",
            complete: function (item) {
                NProgress.done();
                unblock_screen();
            },
            success: function(item){
                var pos = $('#edit-user-pos').text();
                if(item!=null){
                    notifyAfterAjax('success','Пользователь "'+user+'" отредактирован!');
                }
                tableUsers.row(pos).data([item.userRole.userRoleId, item.username,
                    getImageUserFormat(item.username, item.firstname, item.lastname, item.position),
                    item.userRole.role,getStatusUser(item.online),
                    '<a class="btn btn-info edit-user btn-xs"><i class="fa fa-pencil"></i> Ред. </a>  '+
                    '<a class="btn btn-danger delete-user  btn-xs"><i class="fa  fa-trash-o"></i> Удал. </a>']).draw();
            },
            beforeSend: function(xhr) {
                // refreshSession();
                xhr.setRequestHeader(header, token);
                beforeSend();
            },
            error: function (xhr, status, error) {
                notifyAfterAjax('danger','Простите, но Пользователь "'+user+'" не отредактирован :(');
            }
        });
    });
    function getProfile(){
        $('#update-profile-modal').modal('show');
    };
    function readURL(input){
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#preload-profile').attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
    var files = [];
    $(document).on("change", "#fileLoader", function(event) {
        files=event.target.files;
    });
    $(document).on("click","#fileSubmit", function() {
        var oMyForm = new FormData();
        oMyForm.append("file", files[0]);
        $.ajax({
            dataType : 'json',
            url : "/admin/ajax/uploadUserImage",
            data : oMyForm,
            type : "post",
            enctype: 'multipart/form-data',
            processData: false,
            contentType:false,
            complete: function (response) {
                NProgress.done();
                unblock_screen();
                NProgress.configure({ parent:"body"});
            },
            success: function(s,x){
            },
            beforeSend: function(xhr) {
                NProgress.configure({ parent:"#update-profile"});
                xhr.setRequestHeader(header, token);
                beforeSend();
            },
            error : function(result){
                console.log(result);
            }
        });
    });
</script>