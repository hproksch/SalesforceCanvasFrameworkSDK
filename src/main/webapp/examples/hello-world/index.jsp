<%@ page import = "java.io.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>

    <title>Hello World Canvas Example</title>
<%= request.getParameter("SPRId")%>
<%= request%>

<%
               Enumeration paramNames = request.getParameterNames();
               while(paramNames.hasMoreElements()) {
                  String paramName = (String)paramNames.nextElement();
                  out.print("<tr><td>" + paramName + "</td>\n");
                  String paramValue = request.getHeader(paramName);
                  out.println("<td> " + paramValue + "</td></tr>\n");
               }
            %>
			
    <link rel="stylesheet" type="text/css" href="/sdk/css/canvas.css" />

    <!-- Include all the canvas JS dependencies in one file -->
    <script type="text/javascript" src="/sdk/js/canvas-all.js"></script>
    <!-- Third part libraries, substitute with your own -->
    <script type="text/javascript" src="/scripts/json2.js"></script>

    <script>
		function contextCallback(msg) {
		   if (msg.status !== 200) {
			  console.log("Error: " + msg.status);
			  return;
		   }
		   console.log("Payload: ", msg.payload);
		}		
		if (self === top) {
            // Not in Iframe
            alert("This canvas app must be included within an iframe");
        }

		var context;
		var uri;

		if (! Sfdc.canvas.oauth.loggedin()) {
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
		
		if(Sfdc.canvas.oauth.loggedin()){
			context = Sfdc.canvas.client.ctx(contextCallback, Sfdc.canvas.oauth.client());
			console.log('context');
			console.log(context);
		}
		
    </script>  
    <script>
	
        function refreshSF() {
			console.log('prior to publish');
			var srClient = Sfdc.canvas.oauth.client();			
			console.log(srClient);
			var oauthtokencur = "dummyvalue";//"00D9E0000004iDJ!AQUAQK.sG6PYUcw2zn5IgZOzCXtUsEIMzAPVvVNVIKulc79SDBjS.hXsDkwROzskbdykhwQc7rslEjToZ7U4A4eXnHWn.Yo."			
			var manualClient = {"instanceId":srClient.instanceId, "targetOrigin":srClient.targetOrigin, "oauthToken":oauthtokencur};
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
