<#import "parts/common.ftlh" as c>
<@c.page>
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
            <div class="form-group">
            <form name="test" method="post">
                <input class="form-control" id="inptval" type="text" placeholder="Начните вводить имя" oninput="isEmail()">
            </form>
            </div>
            <br>
            <ul class="elastic" id="cont0">
                <!--                вот тут список преподов         -->
                <#list teachers as teacher>
                <li class="shadow p-2 mb-2 mr-5 bg-white rounded"><a href="/teachers/${teacher.id}">${teacher.teachername}</a></li>
                </#list>
            </ul>
        </div>

    </div>





</div>


<style>
    li{
        list-style-type: none;
    }

    .shadow a{
        text-decoration: none;
    }

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

<script>

// ######################################################################################
// #### при вводе текста показывать те слова в которых есть введенное сочетание букв ####
// ######################################################################################

         document.querySelector('#inptval').oninput = function(){
             let val = this.value.trim();
             let elasticItems = document.querySelectorAll('.elastic a');

             if(val!=''){
                 elasticItems.forEach(function(elem){
                     if(elem.innerText.search(val) == -1){
                         elem.classList.add('hide');
                         elem.innerHTML = elem.innerText;
                     }else{
                         elem.classList.remove('hide');
                         let strng_str = elem.innerText;
                         elem.innerHTML = insertMark(strng_str, elem.innerText.search(val), val.length);
                     }
                 });
             }else{
                 elasticItems.forEach(function(elem){
                     elem.classList.remove('hide');
                     elem.innerHTML = elem.innerText;
                 });
             }
         }

// ######################################################################################
// ########### обводить маркером сочетание букв совподающие с введенными ################
// ######################################################################################

         function insertMark(strng, pos, len){
             // Hello world
             // Hello <mark>+wo+</mark>+rld
             return strng.slice(0, pos)+'<mark>'+strng.slice(pos, pos+len)+'</mark>'+strng.slice(pos+len);
         }
</script>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

</@c.page>