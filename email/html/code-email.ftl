<#import "email-template.ftl" as layout>
<@layout.emailLayout>
<h1>Code HTML email</h1>
${kcSanitize(msg("emailCodeBody", code, ttl))?no_esc}
</@layout.emailLayout>
