<html lang="ru">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <link rel="stylesheet" href="https://bootstraptema.ru/plugins/2018/irs/ion.rangeSlider.css" />
    <link rel="stylesheet" href="https://bootstraptema.ru/plugins/2018/irs/ion.rangeSlider.skin.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://bootstraptema.ru/plugins/2018/irs/ion.rangeSlider.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu+Mono&display=swap" rel="stylesheet">




    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">


    <script src="https://use.fontawesome.com/3dff3e57e3.js"></script>
    <title>Отзывы о ${teacher.teachername}</title>
</head>
<body>
<#include "parts/navbar.ftlh">
<br>
<br>



<div class="container">
    <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-12 col-12 mt-4">
            <div class="img-ava" style="background-image: url('/img/${teacher.imglink}');"></div>
            <br>
            <p class="ava-rating"><i class="fa fa-star"></i> Рейтинг: ${middle}/5,0</p>

            <p class="ava-rating"><i class="fa fa-bar-chart" aria-hidden="true"></i> Оставлено отзывов: ${count}</p>
        </div>

        <div class="col-lg-9 col-md-9 col-sm-12 col-12 ava-information mt-4 pt-4">
            <p class="ava-profile">${teacher.teachername}</p>
            <p>Вся информация и фотографии находятся в открытом доступе, мы лишь используем ссылки сайта владельца <a href="https://www.kgasu.ru/">https://www.kgasu.ru/</a></p>
        </div>

    </div>
</div>


<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-3 col-md-3 col-sm-12 col-12 mt-4">
            <p class="rat-header">Оставить оценку</p>
        </div>
        <div class="col-lg-9 col-md-9 col-sm-12 col-12">

            <div class="shadow p-3 mb-4 bg-white rounded">
            <!--            =========           -->
            <form method="post" action="/teachers">
                <div class="form-group">
                    <div class="col-6">
                        <input name="rating" type="text" id="range_01">
                    </div>
                </div>
                <div class="form-group">
                    <textarea class="form-control" name="ratingmessage" placeholder="Добавьте свой собственный отзыв" class="rat-area"></textarea>
                </div>
                <input type="hidden" value="${teacher.id}" name="teacherId">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <div class="form-group">
                    <button class="btn btn-primary" type="submit">Оставить отзыв</button>
                </div>
            </form>
            <!--            =========           -->
            </div>
        </div>
    </div>
</div>



<div class="container">
    <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-12 col-12 mt-4">
            <p class="rat-header">Отзывы</p>
        </div>
        <div class="col-lg-9 col-md-9 col-sm-12 col-12 mt-4">
            <br>
            <div class="rat-container">
                <#list ratings as rating>
                <p class="shadow-lg p-3 mb-4 bg-white rounded rat-rating">${rating.message}</p>
                </#list>
            </div>


        </div>
    </div>
</div>




<script>
                      $(document).ready(function () {
                            $("#range_01").ionRangeSlider({
                                 min: 1,
                                 max: 5
                            });
                        });
</script>





<style>
        *{
                font-family: 'Ubuntu Mono', monospace;
            }
        .ava-profile{
            font-weight: 700;
            font-size: 2em;
        }
        .rat-area{
            width: 100%;
        }
        .rat-header{
            font-weight: 600;
        }
        .ava-rating{
            font-weight: 600;
        }

        div{
/*            border: 1px solid red;*/
        }
        .img-ava:hover{
            background-size: 150%;
            transition-duration: .3s;
        }
        .img-ava{
            height: 200px;
            width: 200px;
            background-size: 100%;
            border-radius: 50%;
            background-position: center center; /* Положение фона */
            background-repeat: no-repeat;
        }
    </style>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>