<#import "template.ftl" as layout>
<#import "field.ftl" as field>
<#import "buttons.ftl" as buttons>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password'); section>
<!-- template: login-password.ftl -->
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-form-login" class="${properties.kcFormClass!}" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                                        <#if CredentialId?? >
                        <input type="hidden" name="CredentialId" value="${CredentialId}" />
                    </#if>
                    <#if cookieRefRememberMe?? >
                        <input type="hidden" name="realmPath" id="realmPath" value="${realmPath}" />
                        <input type="hidden" name="cookieRefRememberMe" id="cookieRefRememberMe" value="${cookieRefRememberMe}" />
                    </#if>

                    <#if messagesPerField.existsError('username','password')>
                        <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </span>
                    </#if>

                    <#if CredentialId?? >
                        <@field.input name="code" label=msg("codeTitle") autofocus=true autocomplete="current-code" value="${login.code}" />
                    </#if>
                    <#if ShowPassword??>
                        <@field.password name="password" label=msg("password") autofocus=true autocomplete="current-password" />
                    </#if>
                    <#if cookieRefRememberMe?? >
                        <@field.checkbox name="rememberme" label=msg("rememberMe") />
                    </#if>

                    <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                        <div id="kc-form-options">
                            <div class="${properties.kcFormOptionsWrapperClass!}">
                                <#if realm.resetPasswordAllowed>
                                    <span><a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                </#if>
                            </div>
                        </div>
                    </div>



                    <@buttons.loginButton />
                </form>
            </div>
        </div>
    </#if>

</@layout.registrationLayout>
