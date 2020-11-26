<div class="dropdown">
    <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Редактировать запись
    </button>
    <div class="<#if message??>show</#if> dropdown-menu p-4" aria-labelledby="dropdownMenuButton">
        <div class="form-group">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}" value="<#if message??>${message.text}</#if>" name="text" placeholder="Текст введите Вы">
                    <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                </#if>
        </div>
        <div class="form-group">
            <div class="custom-file">
                <input type="file" class="custom-file-input" id="customFile" name="file">
                <label class="custom-file-label" for="customFile">Выбрать файл</label>
            </div>
        </div>
        <input type="hidden" name="tag" placeholder="tag">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <input type="hidden" name="id" value="<#if message??>${message.id}</#if>" />
        <div class="form-group">
            <center><button class="btn btn-primary" type="submit">Сохранить</button></center>
        </div>
        </form>
    </div>
</div>
</div>