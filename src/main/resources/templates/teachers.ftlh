<!doctype html>
<html lang="ru">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/mustard-ui@latest/dist/css/mustard-ui.min.css">


    <title>Список преподавателей</title>
</head>
<body>
<#include "parts/navbar.ftlh">
<br>
<br>
<br>

<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <h5 class="text-center">Поиск преподавателя</h5>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-6 col-sm-12 col-12">
            <form name="test" method="post">
                <input id="inptval" type="text" placeholder="Начните вводить имя" oninput="isEmail()">
            </form>
            <br>
            <ul class="elastic" id="cont0">
                <!--                вот тут список преподов         -->
                <#list teachers as teacher>
                <li class="shadow p-2 mb-2 bg-white rounded"><a href="/teachers/${teacher.id}">${teacher.teachername}</a></li>
                </#list>
            </ul>
        </div>

    </div>





</div>


<style>

    .dropdown-menu input{
        margin-left: 5px;
    }
    .text-center{
        text-align: center;
    }
    .elastic li{
        transition: all ease 500ms;
        padding-left: 2%;
/*        list-style-type: none;*/
    }
    .elastic li.hide{
        display: none;
    }
</style>

<script src="main.js"></script>
<script src="dir/searchingbyname.js"></script>









<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>