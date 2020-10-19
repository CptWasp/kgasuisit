<#import "parts/common.ftlh" as c>


<@c.page>
${message!}


<div class="container">
    <div class="row justify-content-center">
        <div class="col-10 col-sm-10 col-md-6 col-lg-5">

            <h5>${username}</h5>

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