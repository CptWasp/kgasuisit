<#import "parts/common.ftlh" as c>
<@c.page>
<#include "parts/navbar.ftlh">
<br>
<br>
<br>
<br>

Редактирование пользователя

<form action="/user" method="post">

    <input type="text" name="username" value="${usr.username}">

    <#list roles as role>
        <div>
            <label><input type="checkbox" name="${role}" ${usr.roles?seq_contains(role)?string("checked", "")}>${role}</label>
        </div>
    </#list>
    <input type="hidden" value="${usr.id}" name="userId">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">Сохранить</button>
</form>

</@c.page>