<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>


<@c.page>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-8">
            <p class="py-3 qna-text">Мы Вам отправим ссылку на почтовый ящик, перейдите по ней, что бы активировать Ваш аккаунт</p>
        </div>
    </div>
</div>

<div class="container">
<div class="row justify-content-center">
    <div class="col-10 col-sm-10 col-md-6 col-lg-5">
<@l.login "/registration" true/>
    </div>
</div>
</div>

<style>
.qna-text{
    opacity: 0.5;
    transition-duration: 0.5s;
}
.qna-text:hover{
    cursor: pointer;
    transition-duration: 0.5s;
    opacity: 1;
}


</style>


</@c.page>