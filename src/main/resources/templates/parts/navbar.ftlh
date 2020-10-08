<#include "security.ftlh">
<#import "login.ftlh" as l>

<nav class="navbar fixed-top navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="/"><img src="../../static/logo.png" width="45px"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Главная</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/main">Объективные новости</a>
            </li>
            <li>
                <a class="nav-link" href="/teachers">Рейтинги преподавателей</a>
            </li>
            <li>
                <a class="nav-link" href="#">Контакты</a>
            </li>
            <li>
                <a class="nav-link" href="#">Цены и расписания</a>
            </li>
            <li>
                <a class="nav-link" href="#">Проекты</a>
            </li>



            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/user">User list</a>
            </li>
            </#if>
        </ul>

        <div class="navbar-text">${name}</div>

        <@l.logout />

    </div>
</nav>
<style>
    .navbar-dark{
        background: #000;
    }
</style>
<br>
<br>