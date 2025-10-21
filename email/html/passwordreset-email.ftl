<#import "email-template.ftl" as layout>
<@layout.emailLayout>
                            <h2 class="" style="padding-top: 0; padding-bottom: 0; font-weight: 500; vertical-align: baseline; font-size: 32px; line-height: 38.4px; margin: 0;" align="left">${msg("passwordReset.title")}
                            </h2>
                            <@layout.emailSpacer/>
                            <p style="line-height: 24px; font-size: 16px; width: 100%; margin: 0;" align="left">${msg("passwordReset.intro", user.email?default(""))}</p>
                            <@layout.emailSpacer/>
                            <@layout.emailButton href=link text=msg("passwordReset.linkText")/>
                            <@layout.emailSpacer/>
                            <p style="line-height: 24px; font-size: 16px; width: 100%; margin: 0;" align="left">${msg("passwordReset.expiry", ttl)}</p>
                            <@layout.emailSpacer/>
                            <p style="line-height: 24px; font-size: 16px; width: 100%; margin: 0;" align="left">${msg("passwordReset.cta")}</p>
                            <@layout.emailSpacer/>
                            <@layout.emailSpacer/>
                            <@layout.emailSignature/>
</@layout.emailLayout>
