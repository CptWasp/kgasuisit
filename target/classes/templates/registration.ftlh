<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>


<@c.page>

${message!}
<div class="row justify-content-center">
    <div class="col-10 col-sm-10 col-md-6 col-lg-5">
<@l.login "/registration" true/>
    </div>
</div>

</@c.page>