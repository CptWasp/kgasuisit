<#macro login path isRegisterForm>
<#if !isRegisterForm><center><h5 class="mt-5 mb-5">Авторизация</h5></center><#else><center><h5 class="mt-5 mb-5">Регистрация</h5></center></#if>
<form class="shadow-lg p-3 mb-5 bg-white rounded pt-5 pb-5" action="${path}" method="post">
    <div class="form-group">
        <input type="text" placeholder="email" name="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    </div>
    <div class="form-group">
        <input type="password" placeholder="password" name="password" class="form-control" id="exampleInputPassword1">
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit" class="btn btn-primary">Войти</button>
    <#if !isRegisterForm><a class="ml-2 btn btn-light" href="/registration">Add new user</a></#if>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input class="btn btn-danger ml-2" type="submit" value="Выход" />
</form>
</#macro>