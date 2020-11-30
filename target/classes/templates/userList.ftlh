<#import "parts/common.ftlh" as c>
<@c.page>

<br>
<h4>Список пользователей</h4>


<table>
    <thead>
        <th>Name</th>
        <th>Role</th>
        <th></th>
    </thead>
    <tbody>
<#list users as user>
    <tr>
        <td>${user.username}</td>
        <td><#list user.roles as role>${role}<#sep>, </#list></td>
        <td><a href="/user/${user.id}">Редактировать</a></td>
    </tr>

</#list>
    </tbody>
</table>
</@c.page>