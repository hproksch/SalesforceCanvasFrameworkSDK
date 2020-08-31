<%@ page import="canvas.SignedRequest" %>
<%@ page import="java.util.Map" %>
<%
    // Pull the signed request out of the request body and verify/decode it.
    Map<String, String[]> parameters = request.getParameterMap();
//    String[] signedRequest = parameters.get("signed_request");
//    if (signedRequest == null) {%>
//        This App must be invoked via a signed request!<%
//        return;
//    }

    String yourConsumerSecret="92EE3228B95B908327CC64B206C0EA32A71A7AC3CA24A217CF5EE9759C2AC411";
//    String signedRequestJson = SignedRequest.verifyAndDecodeAsJson(signedRequest[0], yourConsumerSecret);
%>

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

      
    </script>  
    <script>
        function refreshSF() {
            console.log('prior to publish');
            Sfdc.canvas(function() {
				var context;
				var uri;

				if (! Sfdc.canvas.oauth.loggedin()) {
					uri = Sfdc.canvas.oauth.loginUrl();
					Sfdc.canvas.oauth.login(
				{uri : uri,
				params: {
						  display : "touch",
				  response_type : "token",
				  client_id : "3MVG9lcxCTdG2VbvpPUJ_pbIGpNsoGvs5h69zw6JS2eWQIvw5xPSA0WSXel86lYe1zenUMUGeXl_j8UbLrBkg", //Add Your Consumer ID
				  redirect_uri : encodeURIComponent("https://webarchitectheroku.herokuapp.com/sdk/callback.html") //Add your Callback URL
				}});
				}
				if(Sfdc.canvas.oauth.loggedin()){
			  context = Sfdc.canvas.client.ctx(contextCallback, Sfdc.canvas.oauth.client());
			}
	
			var srClient = Sfdc.canvas.oauth.client();
            Sfdc.canvas.client.publish(
                srClient,
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
