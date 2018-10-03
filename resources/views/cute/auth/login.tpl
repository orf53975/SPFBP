{include file='auth/header-login.tpl'}


<main class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-lg-push-4 col-sm-6 col-sm-push-3">
					<section class="content-inner">
						
						<div class="card-inner">
							<div class="tab-content">
								<div class="tab-pane fade active in" id="passwd_login">

										<div class="logo-login">
											<em></em> {$config["appName"]}
										</div>

									<div class="card">
										<div class="card-main">
											<div class="card-inner">
												<form action="javascript:void(0);"  method="POST">
													<div class="form-group form-group-label">
														<div class="row">
															<div class="col-md-10 col-md-push-1">
																<label class="floating-label" for="email">邮箱</label>
																<input class="form-control" id="email" type="text" name="Email">
															</div>
														</div>
													</div>
													<div class="form-group form-group-label">
														<div class="row">
															<div class="col-md-10 col-md-push-1">
																<label class="floating-label" for="passwd">密码</label>
																<input class="form-control" id="passwd" type="password" name="Password">
															</div>
														</div>
													</div>

													<div class="form-group form-group-label" style="display: none">
														<div class="row">
															<div class="col-md-10 col-md-push-1">
																<label class="floating-label" for="code">两步验证码</label>
																<input class="form-control" id="code" type="text">
															</div>
														</div>
													</div>

													{if $geetest_html != null}
														<div class="form-group form-group-label">
															<div class="row">
																<div class="col-md-10 col-md-push-1">
																	<div id="embed-captcha"></div>
																</div>
															</div>
														</div>
													{/if}

													<div class="form-group">
														<div class="row">
															<div class="col-md-10 col-md-push-1">
																<button id="login" type="submit" class="btn btn-block btn-brand waves-attach waves-light">登录</button>
															</div>
														</div>
													</div>

													<div class="form-group">
														<div class="row">
															<div class="col-md-10 col-md-push-1">
																<div class="checkbox checkbox-adv">
																	<label for="remember_me">
																		<input class="access-hide" value="week" id="remember_me" name="remember_me" type="checkbox">记住我
																		<span class="checkbox-circle"></span><span class="checkbox-circle-check"></span><span class="checkbox-circle-icon icon">done</span>
																	</label>
																</div>
															</div>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
								
							</div>

								<div class="clearfix">
									<p class="margin-no-top pull-left"><a href="/password/reset">忘记密码</a></p>
									<p class="margin-no-top pull-right"><a href="/auth/register">注册帐号</a></p>
								</div>
									

						</div>

						{include file='dialog.tpl'}

					</section>
				</div>
			</div>
		</div>
	</main>

{include file='footer.tpl'}

<script>
    $(document).ready(function(){
        function login(){
			{if $geetest_html != null}
			if(typeof validate == 'undefined')
			{
				$("#result").modal();
                $("#msg").html("请滑动验证码来完成验证。");
				return;
			}

			if (!validate) {
				$("#result").modal();
                $("#msg").html("请滑动验证码来完成验证。");
				return;
			}

			{/if}

			document.getElementById("login").disabled = true;

            $.ajax({
                type:"POST",
                url:"/auth/login",
                dataType:"json",
                data:{
                    email: $("#email").val(),
                    passwd: $("#passwd").val(),
					code: $("#code").val(),
                    remember_me: $("#remember_me:checked").val(){if $geetest_html != null},
					geetest_challenge: validate.geetest_challenge,
                    geetest_validate: validate.geetest_validate,
                    geetest_seccode: validate.geetest_seccode{/if}
                },
                success:function(data){
                    if(data.ret == 1){
						$("#result").modal();
                        $("#msg").html(data.msg);
                        window.setTimeout("location.href='/user'", {$config['jump_delay']});
                    }else{
			$("#result").modal();
                        $("#msg").html(data.msg);
			document.getElementById("login").disabled = false;
			{if $geetest_html != null}
			captcha.refresh();
			{/if}
                    }
                },
                error:function(jqXHR){
			$("#msg-error").hide(10);
			$("#msg-error").show(100);
			$("#msg-error-p").html("发生错误："+jqXHR.status);
					document.getElementById("login").disabled = false;
			{if $geetest_html != null}
			captcha.refresh();
			{/if}
                }
            });
        }
        $("html").keydown(function(event){
            if(event.keyCode==13){
                login();
            }
        });
        $("#login").click(function(){
            login();
        });

		$('div.modal').on('shown.bs.modal', function() {
			$("div.gt_slider_knob").hide();
		});

		$('div.modal').on('hidden.bs.modal', function() {
			$("div.gt_slider_knob").show();
		});
    })
</script>

{if $config['enable_telegram'] == 'true'}
<script src=" /assets/public/js/jquery.qrcode.min.js "></script>
<script>
	var telegram_qrcode = 'mod://login/{$login_token}';
	jQuery('#telegram-qr').qrcode({
		"text": telegram_qrcode
	});
</script>

<script>
$(document).ready(function () {
	function f(){
		$.ajax({
			type: "GET",
			url: "qrcode_check",
			dataType: "json",
			data: {
				token:"{$login_token}",
				number:"{$login_number}"
			},
			success: function (data) {
				if (data.ret > 0) {
					clearTimeout(tid);

					$.ajax({
						type: "POST",
						url: "/auth/qrcode_login",
						dataType: "json",
						data: {
							token:"{$login_token}",
							number:"{$login_number}"
						},
						success: function (data) {
							if (data.ret) {
								$("#result").modal();
								$("#msg").html("登录成功！");
								window.setTimeout("location.href=/user/", {$config['jump_delay']});
							}
						},
						error: function (jqXHR) {
							$("#result").modal();
							$("#msg").html("发生错误：" + jqXHR.status);
						}
					});

				} else {
					if(data.ret == -1)
					{
						jQuery('#telegram-qr').replaceWith('此二维码已经过期，请刷新页面后重试。');
						jQuery('#code_number').replaceWith('<code id="code_number">此数字已经过期，请刷新页面后重试。</code>');
					}
				}
			},
			error: function (jqXHR) {
				if(jqXHR.status != 200 && jqXHR.status != 0) {
					$("#result").modal();
					$("#msg").html("发生错误：" + jqXHR.status);
				}
			}
		});
		tid = setTimeout(f, 1000); //循环调用触发setTimeout
	}
	setTimeout(f, 1000);
})
</script>
{/if}


{if $geetest_html != null}
<script>
	var handlerEmbed = function (captchaObj) {
        // 将验证码加到id为captcha的元素里

		captchaObj.onSuccess(function () {
            		validate = captchaObj.getValidate();
		});

		captchaObj.appendTo("#embed-captcha");

		captcha = captchaObj;

    };

	initGeetest({
		gt: "{$geetest_html->gt}",
		challenge: "{$geetest_html->challenge}",
		product: "embed", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
		offline: {if $geetest_html->success}0{else}1{/if} // 表示用户后台检测极验服务器是否宕机，与SDK配合，用户一般不需要关注
	}, handlerEmbed);
</script>

{/if}
