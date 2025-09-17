<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${kcSanitize(msg("passwordResetPageTitle"))?no_esc}
    <#elseif section = "form">
        <p id="instruction1" class="instruction">
            <div>
                <#if isPhoneNumber?? >
                    <p>${msg( "passwordResetPageInstructionsSms", identifier)}</p>
                <#else>
                    <p>${msg("passwordResetPageInstructionsEmail", identifier)}</p>
                </#if>
            </div>
            ${msg("pageExpiredMsg1")} <a id="loginRestartLink" href="${url.loginRestartFlowUrl}">${msg("doClickHere")}</a> .<br/>
        </p>
    </#if>
</@layout.registrationLayout>
