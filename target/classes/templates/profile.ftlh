<#import "parts/common.ftlh" as c>


<@c.page>
<br>
<br>
${message!}
<br>


<div class="container my-4">
    <div class="row justify-content-center">
        <div class="col-12 col-sm-12 col-md-8 col-lg-8">

            <center><h5>${username}</h5></center>
            <br>
            <br>
            <br>

            <form class="shadow-lg p-3 mb-5 bg-white rounded pt-5 pb-5" method="post">
                <div class="form-group">
                    <input type="password" placeholder="password" name="password" class="form-control" id="exampleInputPassword1">
                </div>

                <div class="form-group">
                    <input type="email" placeholder="some@some.com" value="${email!''}" name="email" class="form-control" id="exampleInputEmail">
                </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="btn btn-primary">Сохранить</button>
        </form>
        </div>
    </div>
</div>

</@c.page>