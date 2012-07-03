<#if (page.getProperty("page.postfooter")??)>
   <#assign bridge = page.getProperty("page.postfooter")>

${bridge}

</#if>

<#if chatPresenceManagerImpl.isPresenceAvailable()>
<#include "/template/global/include/action-bar-macros.ftl" />
<@renderEimActionBarStub/>
</#if>

<div id="moto-footer">
</div>