<#import "email-template.ftl" as layout>
<@layout.emailLayout>
                            <h2 class="" style="padding-top: 0; padding-bottom: 0; font-weight: 500; vertical-align: baseline; font-size: 32px; line-height: 38.4px; margin: 0;" align="left">${msg("emailPasswordChanged.title")}
                            </h2>
                            <@layout.emailSpacer/>
                            <p style="line-height: 24px; font-size: 16px; width: 100%; margin: 0;" align="left">${msg("emailPasswordChanged.intro")}</p>
                            <@layout.emailSpacer/>
                            <p style="line-height: 24px; font-size: 16px; width: 100%; margin: 0;" align="left">${msg("emailPasswordChanged.blockedUntil", loginBlockedTo)}</p>
                            <@layout.emailSpacer/>
                            <p style="line-height: 24px; font-size: 16px; width: 100%; margin: 0;" align="left">${msg("emailPasswordChanged.vipps")}</p>
                            <@layout.emailSpacer/>
                            <p style="line-height: 24px; font-size: 16px; width: 100%; margin: 0;" align="left">${msg("emailPasswordChanged.security")}</p>
                            <@layout.emailSpacer/>
                            <@layout.emailSignature/>
</@layout.emailLayout>
