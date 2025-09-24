<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${kcSanitize(msg("passwordResetPageTitle"))?no_esc}
    <#elseif section = "form">
        <div class="pf-v5-u-mb-lg">
            <p id="instruction1" class="instruction pf-v5-u-mb-md">
                <#if isPhoneNumber??>
                    ${msg("passwordResetPageInstructionsSms", identifier)}
                <#else>
                    ${msg("passwordResetPageInstructionsEmail", identifier)}
                </#if>
            </p>
            <p class="pf-v5-u-mb-0">
                ${msg("pageExpiredMsg1")} <a id="loginRestartLink" href="${url.loginRestartFlowUrl}">${msg("doClickHere")}</a>.
            </p>
        </div>
    </#if>
</@layout.registrationLayout>
