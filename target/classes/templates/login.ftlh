<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>


<@c.page>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-10 col-sm-10 col-md-6 col-lg-5">
            <@l.login "/login" false />
        </div>
    </div>
</div>

</@c.page>