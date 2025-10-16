<#macro emailLayout>
<html lang="${locale.language}" dir="${(ltr)?then('ltr','rtl')}">
<body>
<h1>Tekna email</h1>
    <#nested>
</body>
</html>
</#macro>
