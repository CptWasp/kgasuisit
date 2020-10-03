<html xmlns="http://www.w3.org/1999/html">
<head>

</head>
<body>

<#list teachers as teacher>
<p>${teacher.teachername}</p>
</#list>

<form method="post">
    <input type="text" name="num">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">Добавить</button>
</form>


</body>
</html>