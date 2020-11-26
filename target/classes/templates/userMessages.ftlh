<#import "parts/common.ftlh" as c>


<@c.page>

<#if isCurrentUser>
    <#include "parts/messageEdit.ftlh" />
</#if>
    <br>
    <br>
    <#include "parts/messageList.ftlh" />

</@c.page>