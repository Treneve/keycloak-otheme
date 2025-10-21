<#import "email-template.ftl" as layout>
<@layout.emailLayout>
                            <h2 class="" style="padding-top: 0; padding-bottom: 0; font-weight: 500; vertical-align: baseline; font-size: 32px; line-height: 38.4px; margin: 0;" align="left">${msg("emailCode.title")}
                            </h2>
                            <@layout.emailSpacer/>
                            <p style="line-height: 24px; font-size: 16px; width: 100%; margin: 0;" align="left">${msg("emailCode.intro")}</p>
                            <@layout.emailSpacer/>
                            <@layout.emailCodeBlock value=code/>
                            <@layout.emailSpacer/>
                            <p style="line-height: 24px; font-size: 16px; width: 100%; margin: 0;" align="left">${msg("emailCode.validity", ttl)}</p>
                            <@layout.emailSpacer/>
                            <p style="line-height: 24px; font-size: 16px; width: 100%; margin: 0;" align="left">${msg("emailCode.help")}</p>
                            <@layout.emailSpacer/>
                            <@layout.emailSignature/>
</@layout.emailLayout>
