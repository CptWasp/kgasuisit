<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>


<@c.page>
<#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
    <div class="alert alert-danger" role="alert">
        ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
    </div>
</#if>
<#if message??>
    <div class="alert alert-${messageType}" role="alert">
        ${message}
    </div>
</#if>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-10 col-sm-10 col-md-6 col-lg-5">
            <@l.login "/login" false />
        </div>
    </div>
</div>

</@c.page>