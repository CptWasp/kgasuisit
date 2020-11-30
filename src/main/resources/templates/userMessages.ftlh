<#import "parts/common.ftlh" as c>


<@c.page>
<div class="container">
    <br>
    <br>
    <br>
<h3>${userChannel.username}</h3>
<br>
    <#if !isCurrentUser>
        <#if isSubscriber>
        <a href="/user/unsubscribe/${userChannel.id}" class="btn btn-secondary m-3">Отписаться</a>
        <#else>
        <a href="/user/subscribe/${userChannel.id}" class="btn btn-info m-3">Подписаться</a>
        </#if>
    </#if>
<br>
<div class="row justify-content-center">
    <div class="col-4">
        <div class="cart my-3 shadow bg-white rounded">
            <div class="cart-body p-3">
                <h5 class="cart-title">Подписки</h5>
                <h3 class="cart-text">
                    <a href="/user/subscriptions/${userChannel.id}/list">${subscriptionsCount}</a>
                </h3>
            </div>
        </div>
    </div>
    <div class="col-4">
        <div class="cart my-3 shadow bg-white rounded">
            <div class="cart-body p-3">
                <h5 class="cart-title">Подписчики</h5>
                <h3 class="cart-text">
                    <a href="/user/subscribers/${userChannel.id}/list">${subscribersCount}</a>
                </h3>
            </div>
        </div>
    </div>
</div>

<#if isCurrentUser>
    <#include "parts/messageEdit.ftlh" />
</#if>
    <br>
    <br>
    <#include "parts/messageList.ftlh" />
</div>
</@c.page>