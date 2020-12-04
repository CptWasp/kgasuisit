<#include "security.ftlh">
<#import "pager.ftlh" as p>

<@p.pager url page />
<div class="card-columns">
    <#list page.content as message>
    <div class="card my-3 shadow bg-white rounded">
        <#if message.filename??>
        <img class="card-img-top" src="/img/${message.filename}" />
    </#if>
    <div class="m-2">${message.text}</div><br>
    <div class="card-footer text-muted">
        <a href="/user-messages/${message.author.id}">${message.authorName}</a>
        <#if message.author.id == currentUserId>
        <a class="btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">Редактировать</a>
        </#if>
    </div>

</div>
<#else>
No messages
</#list>
</div>