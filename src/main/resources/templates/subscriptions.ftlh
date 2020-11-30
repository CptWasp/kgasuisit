<#import "parts/common.ftlh" as c>
<@c.page>

<br>
<br>
<br>
<div class="container">
<h3>${userChannel.username}</h3>
<br>
<div>
    ${type}
</div>
<ul class="list-group">
    <#list users as user>
        <li class="list-group-item">
            <a href="/user-messages/${user.id}">${user.getUsername()}</a>
        </li>
    </#list>
</ul>
</div>


</@c.page>
