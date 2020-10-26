<#macro login path isRegisterForm>
<#if !isRegisterForm><center><h5 class="mt-5 mb-5">Авторизация</h5></center><#else><center><h5 class="mt-5 mb-5">Регистрация</h5></center></#if>
<form class="shadow-lg p-3 mb-5 bg-white rounded pt-5 pb-5" action="${path}" method="post">
    <div class="form-group">
        <input type="text" placeholder="Ваш никнейм" value="<#if user??>${user.username}</#if>" name="username" class="form-control ${(usernameError??)?string('is-invalid', '')}" id="exampleInputEmail1" aria-describedby="emailHelp">
        <#if usernameError??>
            <div class="invalid-feedback">
                ${usernameError}
            </div>
        </#if>
    </div>
    <div class="form-group">
        <input type="password" placeholder="password" name="password" class="form-control ${(passwordError??)?string('is-invalid', '')}" id="exampleInputPassword1">
        <#if passwordError??>
            <div class="invalid-feedback">
                ${passwordError}
            </div>
        </#if>
    </div>

    <#if isRegisterForm>
    <div class="form-group">
            <input type="password" placeholder="Потвердите пароль" name="password2" class="form-control ${(password2Error??)?string('is-invalid', '')}" id="exampleInputPassword1">
            <#if password2Error??>
                <div class="invalid-feedback">
                    ${password2Error}
                </div>
            </#if>
    </div>

    <div class="form-group">
        <input type="email" value="<#if user??>${user.email}</#if>" placeholder="some@some.com" name="email" class="form-control ${(emailError??)?string('is-invalid', '')}" id="exampleInputEmail">
        <#if emailError??>
            <div class="invalid-feedback">
                ${emailError}
            </div>
        </#if>
    </div>

    <div class="col-6">
        <div class="g-recaptcha" data-sitekey="6LdrttsZAAAAAOLpwkC6bmGdHGCQRZ70Otb2ssp8"></div>
        <#if captchaError??>
            <div class="alert alert-danger" role="alert">
                ${captchaError}
            </div>
        </#if>
    </div>


    </#if>

    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit" class="btn btn-primary">Войти</button>
    <#if !isRegisterForm><a class="ml-2 btn btn-light" href="/registration">Add new user</a></#if>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input class="btn btn-danger btn-sm ml-2" type="submit" value="Выход" />
</form>
</#macro>