<html>
<head>  
  <title>SmartOffice</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/smartech.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
  <link rel="stylesheet" href="css/login.css">
</head>
<body>

  <div class="d-flex align-items-center min-vh-100 py-3 py-md-0">
    <div class="container">
      <div class="card login-card">
        <div class="row no-gutters">
          <div class="col-md-5">
            <img src="img/contact.jpg" alt="login" class="login-card-img">
          </div>
          <div class="col-md-7">
            <div class="card-body">
              <div class="brand-wrapper">
                <a href="index.jsp"><img src="img/logo.png" alt="logo" class="logo"></a>
              </div>
              <p class="login-card-description">Reach to us</p>
              <form action="contactsubmit.jsp" name="contactform" id="contactform" method="post">
                  <div class="form-group">
                    
                    <input type="email" name="email" id="email" class="form-control" placeholder="Email address">
                     <span id="errormail" style="color:red;"></span>
                  </div>
                  <div class="form-group mb-4">
                    <label for="Message" class="sr-only">Message</label>
                    <input type="text" name="text" id="text" class="form-control" placeholder="Doubts/Questions">
					<span id="errortext" style="color:red;"> 
							</span>                  
                  </div>
                  <input name="send" id="send" class="btn btn-block login-btn mb-4" type="submit" value="Send Message">
                </form>
                <p class="login-card-footer-text"></p>
              
            </div>
          </div>
        </div>
      </div>
      
    </div>
  </div>
  
  
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

	

</body>
<script src="js/contactjs.js"></script>
</html>