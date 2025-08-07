<!DOCTYPE html>
<html>
<head>
   <title>Login</title>
   <script src="View/js/jquery-3.1.1.js"></script>
   <script>
   $(function () {
       $('#loginBtn').on('click', function (e) {
           e.preventDefault();        // stop classic form submit

           $.ajax({
               url: 'login.action',   // Struts mapping
               type: 'POST',
               dataType: 'json',
               data: {
                   username: $('#u').val(),
                   password: $('#p').val()
               },
               success: function (json) {
                   
                   console.log("i am inside iii "+ json);
                   // window.location.href = 'accueil.action'; // or accueil.jsp
                   if (json.ok) {
                       var ctx = '/' + window.location.pathname.split('/')[1];  // "/WSStatistique"
                      // window.location.href = ctx + '/accueil.action';

                        console.log(ctx);
                      // window.location.href = 'accueil.action'; // or accueil.jsp
                   } else {
                       $('#error').text(json.msg || 'Login failed');
                   }
               },
               error: function (xhr) {
                   
                   console.log(xhr['responseText']);
                   $('#error').text(xhr.status === 401
                       ? 'Invalid username or password'
                       : 'Server error');
               }
           });
       });
   });
   </script>
</head>
<body>
  <h2>Login</h2>

  <form id="loginForm">
      <label>Username: <input type="text" id="u" autocomplete="off"></label><br>
      <label>Password: <input type="password" id="p"></label><br><br>
      <button id="loginBtn">Login</button>
  </form>

  <div id="error" style="color:red"></div>
</body>
</html>