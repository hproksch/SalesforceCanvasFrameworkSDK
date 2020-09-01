<%@ page import="canvas.SignedRequest" %>
<%@ page import="java.util.Map" %>
<%
    // Pull the signed request out of the request body and verify/decode it.
    Map<String, String[]> parameters = request.getParameterMap();
    String[] signedRequest = parameters.get("signed_request");
    if (signedRequest == null) {%>
        This App must be invoked via a signed request!<%
        return;
    }
    //String yourConsumerSecret=System.getenv("CANVAS_CONSUMER_SECRET");
    String yourConsumerSecret="92EE3228B95B908327CC64B206C0EA32A71A7AC3CA24A217CF5EE9759C2AC411";
    String signedRequestJson = SignedRequest.verifyAndDecodeAsJson(signedRequest[0], yourConsumerSecret);
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
      //  Sfdc.canvas(function() {
      //      var sr = JSON.parse('<%=signedRequestJson%>');
            // Save the token
      //      Sfdc.canvas.oauth.token(sr.oauthToken);
      //      Sfdc.canvas.byId('username').innerHTML = sr.context.user.fullName;
      //  });
    </script>  
    <script>
        function refreshSF() {
            console.log('prior to publish');
            var sr = JSON.parse('<%=signedRequestJson%>');
            var srClient = sr.client;
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