<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>

    <title>Hello World Canvas Example</title>

    <link rel="stylesheet" type="text/css" href="/sdk/css/canvas.css" />

    <!-- Include all the canvas JS dependencies in one file -->
    <script type="text/javascript" src="/sdk/js/canvas-all.js"></script>
    <!-- Third part libraries, substitute with your own -->
    <script type="text/javascript" src="/scripts/json2.js"></script>

    <script>
		if (self === top) {
            // Not in Iframe
            alert("This canvas app must be included within an iframe");
        }

		var context;
		var uri;


/*		if (! Sfdc.canvas.oauth.loggedin()) {
			uri = Sfdc.canvas.oauth.loginUrl();
			Sfdc.canvas.oauth.login(
				{uri : uri,
				params: {
					response_type : "token",
					client_id : "3MVG9lcxCTdG2VbvpPUJ_pbIGpNsoGvs5h69zw6JS2eWQIvw5xPSA0WSXel86lYe1zenUMUGeXl_j8UbLrBkg", //Add Your Consumer ID
					redirect_uri : encodeURIComponent("https://webarchitectheroku.herokuapp.com/sdk/callback.html") //Add your Callback URL
					}
				}
			);
		}
		console.log('Sfdc.canvas.oauth.loggedin()' + Sfdc.canvas.oauth.loggedin());	
		*/
    </script>  
    <script>
        function refreshSF() {
			console.log('prior to publish');
			var srClient = Sfdc.canvas.oauth.client();
			console.log(srClient);
			//var manualClient = {"instanceId":"_:Hello_Webarchitect:j_id0:j_id2:canvasapp", "targetOrigin":"https://test-fujitsu.cs88.force.com", "oauthToken":"00D9E0000004iDJ!AQUAQIZT09tEZcAfzzIpoQ_pyMYSc_hOuO3EU4CYuiCA8EMcaSrMQppR.ubo6IAn05wSsSFotpQjVNkgKhD7DASQre0hJoom"};
			var manualClient = {"instanceId":"Hello_Webarchitect", "targetOrigin":"https://test-fujitsu.cs88.force.com", "oauthToken":"00D9E0000004iDJ!AQUAQIZT09tEZcAfzzIpoQ_pyMYSc_hOuO3EU4CYuiCA8EMcaSrMQppR.ubo6IAn05wSsSFotpQjVNkgKhD7DASQre0hJoom"};
			console.log(manualClient);
            Sfdc.canvas.client.publish(
                manualClient,
                {name : "refreshsfportal", payload : {status : 'Completed'}});
				
            console.log('after publish');
        }
    </script>  
</head>
<body>
    <br/>
    <h1>Hello <span id='username'></span></h1>
    deploy app in https://dashboard.heroku.com/apps/webarchitectheroku/deploy/github
    <button onclick="refreshSF()">SF1</button>
    
</body>
</html>
