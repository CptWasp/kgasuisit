<#import "parts/common.ftlh" as c>


<@c.page>
<#include "parts/navbar.ftlh">
<br>
<div class="container">

    <br>
    <br>
    <div class="dropdown">
        <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Добавить запись
        </button>
        <div class="dropdown-menu p-4" aria-labelledby="dropdownMenuButton">
            <div class="form-group">
                <form method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" class="form-control" name="text" placeholder="Текст введите Вы">
                    </div>
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="customFile" name="file">
                            <label class="custom-file-label" for="customFile">Выбрать файл</label>
                        </div>
                    </div>
                    <input type="hidden" name="tag" placeholder="tag">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <div class="form-group">
                        <center><button class="btn btn-primary" type="submit">Добавить</button></center>
                    </div>
                </form>
            </div>
        </div>
    </div>

<br>
<br>

<div class="card-columns">
<#list messages as message>
    <div class="card my-3 shadow bg-white rounded">
        <#if message.filename??>
            <img class="card-img-top" src="/img/${message.filename}" />
        </#if>
        <div class="m-2">
            ${message.text}
        </div>
        <div class="card-footer text-muted">
            ${message.authorName}
        </div>

    </div>
<#else>
No messages
</#list>
</div>

</div>
</@c.page>
