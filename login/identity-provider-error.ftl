<#import "template.ftl" as layout>
<#import "buttons.ftl" as buttons>

<@layout.registrationLayout displayMessage=false; section>
<!-- template: identity-provider-error.ftl -->

    <#if section = "header">
        ${msg("idpErrorTitle")}
    <#elseif section = "form">
    <div class="${properties.kcContentWrapperClass}">
        ${kcSanitize(msg("idpErrorText"))?no_esc}
    </div>
    <form class="${properties.kcFormClass!}" action="${url.loginAction}" method="POST">
        <@buttons.actionGroup>
            <@buttons.button name="accept" id="kc-accept" label="doAccept" class=["kcButtonPrimaryClass"]/>
        </@buttons.actionGroup>
    </form>
    <div class="clearfix"></div>
    </#if>
</@layout.registrationLayout>
