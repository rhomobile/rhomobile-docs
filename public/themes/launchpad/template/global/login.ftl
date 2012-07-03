<html>
<head>
    <title><@s.text name="login.user_login.title"/></title>
    <meta name="nouserbar" content="true"/>
    <meta name="nofooter" content="true"/>

    <#if externalLoginEnabled>
        <link rel="stylesheet" type="text/css" href="<@s.url value="/styles/jive-external-login.css" />" />
        <@resource.javascript file="/resources/scripts/sso/external-login.js" />

        <#if facebookEnabled>
            <script src="https://connect.facebook.net/${locale}/all.js"></script>
            <script type="text/javascript">
                var appId = '${facebookApplicationID}';
            </script>
        </#if>
    </#if>

    <@resource.javascript file="/resources/scripts/jquery/jquery.tooltip.js" />
</head>
<body class="jive-body-formpage jive-body-formpage-login">

    <script type="text/javascript">
        $j(function () {

            $j("input#login-submit").removeAttr('disabled');
            $j("form#loginform").submit( function() {
                $j("input#login-submit").val("<@s.text name="login.processing.text"/>");
                $j("input#login-submit").attr("disabled", "disabled");
            });
            $j("input#register-submit").removeAttr('disabled');
            $j("form#registerform").submit( function() {
                $j("input#register-submit").val("<@s.text name="login.processing.text"/>");
                $j("input#register-submit").attr("disabled", "disabled");
            });
        });

    </script>

    <!-- BEGIN layout -->
    <div class="j-layout j-layout-l clearfix">

        <!-- BEGIN large column -->
        <div class="j-column-wrap-l">
            <div class="j-column j-column-l">

            <!-- BEGIN login form -->
            <#assign showRegisterForm = (newAccountCreationEnabled && !jive.isSeatStatusBlocked())/>

            <div class="j-box j-enhanced jive-box jive-box-form jive-standard-formblock-container jive-login-reg-formblock clearfix <#if (!showRegisterForm || registerOnly) && (!externalLoginEnabled)>jive-login-short-width</#if>">
                <#include "/template/global/include/form-message.ftl" />
                <div class="jive-box-body jive-standard-formblock">

				<table border="0">
				<tr valign="top">
				<td width="450">
				
				<div style="margin-left: 20px;">
				<H2>WELCOME TO LAUNCHPAD</H2><br/><br/>
				When Motorola products come together with innovative software applications, the results are transformative. We’re helping application developers accelerate and streamline development with Motorola LaunchPad. This new portal brings developers from around world together with the knowledge and insight that fuels successful enterprise mobility applications.
<br/>
<br/>
Initially focused on application development for Motorola products using RhoElements, Motorola’s new application development framework, LaunchPad will be expanded over time to support any development path. This comprehensive, community-focused portal aids in designing, developing and debugging applications through RhoElements-based resources that will include:
<br/><br/>
<ul>
<li style=" list-style: none outside none;"></li>

<li style=" font-size: 12px; margin-left: 15px; list-style-type: disc;">Developer kits and tools</li>

<li style=" font-size: 12px; margin-left: 15px; list-style-type: disc;">Code samples and libraries</li>

<li style=" font-size: 12px; margin-left: 15px; list-style-type: disc;">Developer discussion forum</li>

<li style=" font-size: 12px; margin-left: 15px; list-style-type: disc;">Development-focused FAQs</li>

<li style=" font-size: 12px; margin-left: 15px; list-style-type: disc;">Blogs authored by Motorola technologists as well as outside developers</li>

<li style=" font-size: 12px; margin-left: 15px; list-style-type: disc;">Step-by-step tutorials and how-to videos</li>

<li style=" font-size: 12px; margin-left: 15px; list-style-type: disc;">Documentation and online help</li>
</ul>
				</div>
				
				
				</td>
				<td width="25"></td>
				<td>
				
                    <#if approvalRequired>
                    <div class="jive-info-box">
                        <div>
                            <span class="jive-icon-med jive-icon-redalert"></span>
                            <@s.text name="login.info.acctNotApproved.text" />
                        </div>
                    </div>
                    </#if>
                    
                    <#if !registerOnly>
                    <div id="jive-login-formblock" <#if (!showRegisterForm) && (!externalLoginEnabled)>class="jive-login-only-box"</#if>>

					<h1><@s.text name="login.user_login.title"/></h1>
                        <p><@s.text name="login.description.text"/></p>

                        <#if JiveGlobals.getJiveBooleanProperty("jive.auth.forceSecure", false)>
                        <#assign loginURI><@s.url value="/cs_login" scheme="https"/></#assign>
                        <#else>
                        <#assign loginURI><@s.url value="/cs_login"/></#assign>
                        </#if>

                        <form action="${loginURI}" id="loginform" method="post" class="j-form" name="loginform01" autocomplete="off">
                            
                            <#if (successURL?exists)>
                            <input type="hidden" name="successURL" value="${successURL?html}"/>
                            </#if>
                            <#if (cancelURL?exists)>
                            <input type="hidden" name="cancelURL" value="${cancelURL?html}"/>
                            </#if>

                            <#-- Username -->
                            <div id="jive-login-username" class="clearfix">
                                <label for="username01" class="font-color-meta"><@s.text name="global.username"/></label>
                                <input type="text" name="username" size="30" maxlength="150" value="" id="username01"/>
                                <@macroFieldErrors name="username"/>
                            </div>

                            <#-- Password: -->
                            <div id="jive-login-password" class="clearfix">
                                <label for="password01" class="font-color-meta"><@s.text name="global.password"/></label>
                                <input type="password" name="password" size="30" maxlength="150" value="" id="password01"/>
                                <@macroFieldErrors name="password"/>
                            </div>

                            <#if (action.isLoginThrottled() || action.isFailedCaptchaRequest()) && action.isCaptchaEnabled()>
                            <#-- Captcha: -->
                            <div id="jive-login-captcha" class="clearfix">
                                <img src="${captchaImageUrl}" alt="">
                                <label for="${captchaKey}" class="font-color-meta"><@s.text name="login.captcha.text" /></label>
                                <input type="text" name="${captchaKey}" size="30" maxlength="150" value="" id="${captchaKey}">
                                <@macroFieldErrors name="password"/>
                            </div>
                            </#if>

                            <#-- Remember Me -->
                            <#if action.isRememberMeEnabled() >
                            <div id="jive-login-rememberme" class="clearfix">
                                <input type="checkbox" name="autoLogin" id="autoLoginCb" value="true"/>
                                <label for="autoLoginCb"><@s.text name="global.remember_me"/></label>
                            </div>
                            </#if>

                            <div id="jive-login-button" class="clearfix">
                                <#-- Login -->
                                <input type="submit" name="login" id="login-submit"
                                       class="jive-form-button-submit j-btn-callout" <#if action.isLoginThrottled()>
                                       disabled='disabled' </#if> value="<@s.text name="global.login" />"/>
                            </div>

                            <#if (JiveGlobals.getJiveBooleanProperty("passwordReset.enabled", true))>
                                <#-- I forgot my password -->
                                <div id="jive-login-forgotpwd" class="jive-login-forgotpwd">
                                    <a href="<@s.url action='emailPasswordToken' method='input'/>"><@s.text name="login.forgot_pwd.link"/></a>
                                </div>
                            </#if>
                            <#if (JiveGlobals.getJiveBooleanProperty("forgot.username.enabled", true))>
                                <#-- I forgot my username -->
                                <div id="jive-login-forgot-username" class="jive-login-forgot-username">
                                    <a href="<@s.url action='forgot-username' method='input'/>"><@s.text name="login.forgot_username.link"/></a>
                                </div>
                            </#if>

                        </form>
                        
                    
                    </#if>

                   <#if showRegisterForm>
                       <#if validationEnabled>
                    
                       <#-- send validation email -->
                       <div id="jive-validate-formblock">
                           <#if validationSent>

                           <h2><@s.text name="login.validate.title"/></h2>
                           <p class="jive-validation-sent">
                               <@s.text name="login.validate.desc">
                                   <@s.param><strong>${emailAddress!?html}</strong></@s.param>
                               </@s.text>
                           </p>
                           <#else>

                           <h2><@s.text name="login.no_account.title"/></h2>
                           <p>
                           <#if SkinUtils.isDomainRestrictionEnabled() >
                               <@s.text name="login.no_account.desc"><@s.param>${SkinUtils.getCompanyName()}</@s.param></@s.text>
                           <#else>
                               <@s.text name="login.no_account.unrestrict.desc"></@s.text>
                           </#if>
                           </p>
                           <form action="<@s.url action='login'/>" method="post" id="registerform" name="registerform01" autocomplete="off">
                               <label for="emailAddress">
                               <strong><@s.text name="login.email.text"/></strong>
                                   <#if SkinUtils.isDomainRestrictionEnabled() >
                                    <#if SkinUtils.isSingleDomain()>
                                       <span><@s.text name="login.email.info"><@s.param>${SkinUtils.getCompanyDomain()}</@s.param></@s.text></span>
                                    <#else>
                                        <a href="#" onClick="return false;" class="tooltip"
                                           title="<@s.text name="login.email.info.domains"> <@s.param>${SkinUtils.getAllCompanyDomainsHTML()}</@s.param> </@s.text>">
                                           <span><@s.text name="login.email.info.multi"><@s.param>${SkinUtils.getCompanyName()}</@s.param></@s.text></span>
                                        </a>
                                    </#if>
                                   </#if>
                               </label>
                               <input type="text" name="emailAddress" id="emailAddress" value="${emailAddress!?html}" class="jive-validate-email"/>
                               <input type="submit" id="register-submit" name="regsubmit" value="<@s.text name='login.email.confirm.button'/>"  class="jive-validate-confirm"/>
                               <input type="hidden" name="method:register" value="true" />
                               <input type="hidden" name="registerOnly" value=<#if registerOnly> "true" <#else> "false" </#if> />
                               <@macroFieldErrors name="emailAddress"/>
                           </form>

                           </#if>

                       </div>

                       <#else>
                    
				   
                       <#-- create user account -->
                       <h3><@s.text name="login.no_account.title"/></h3>
                       <p id="jive-create-account-formblock">
                           <@s.text name="login.create_account.text">
                           <@s.param><a href="create-account.jspa"></@s.param>
                               <@s.param></a></@s.param>
                           </@s.text>
                       </p>
                       </#if>
                   </#if>

                    <#if externalLoginEnabled>
                        <div class="j-login-ext-login <#if (!showRegisterForm || registerOnly)>j-login-ext-login-noreg</#if>">
                            <h3><@s.text name="sso.external-login.login" />:</h3>
                            <form id="external-login-choice" method="post" action="<@s.url value="/openid/sso" />" class="j-form">
                                <p class="font-color-meta"><@s.text name="sso.external-login.provider" /></p>

                                <div class="openid_provider_btns clearfix">
                                    <#list externalLogins as extLogin>
                                        <a href="${extLogin.URL}" class="${extLogin.name} ext_login_large_btn"></a>
                                    </#list>
                                </div>

                                <div class="js-openid-login-row">
                                    <div class="j-form-row js-openid-url-row">
                                        <label for="openid_url"><@s.text name="sso.openid.url" /></label>
                                        <input type="text" disabled="disabled" id="openid_url" />
                                    </div>
                                    <div class="j-form-row">
                                        <label for="openid_username" id="openid_username_label"><@s.text name="global.username" /></label>
                                        <input id="openid_username" type="text" />
                                    </div>
                                    <div class="j-form-row">
                                        <input type="submit" class="jive-form-button-submit j-btn-callout" value="<@s.text name="global.login" />" />
                                        <input type="submit" class="cancel" value="<@s.text name="global.cancel" />" />
                                    </div>
                                </div>

                                <input type="hidden" id="openid_identifier" name="openid_identifier" />
                            </form>
                        </div>
                    </#if>

                    <script type="text/javascript" language="JavaScript">
                        $j('#username01').focus();
                        <#if action.isLoginThrottled()>
                        var delay = ${loginDelay};
                        setTimeout(function() {
                            $j('#jive-error-box').fadeOut("fast");
                            $j('#login01').removeAttr("disabled");
                        }, delay * 1000);
                        </#if>
                    </script>

					</div>
					
				</td>
				</tr>
				</table>
				
                </div>
            </div>
            <!-- END login form -->


            </div>
        </div>
        <!-- END large column -->

    </div>
    <!-- END layout -->


</body>
</html>
