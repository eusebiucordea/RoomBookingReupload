<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Processing Payment</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      background-color: #f5f5f5;
    }

    .container {
      text-align: center;
    }

    .loading-text {
      font-size: 24px;
      color: #333;
      margin-bottom: 20px;
    }

    .success-text {
      font-size: 24px;
      color: #4CAF50;
      display: none;
    }

    .spinner {
      width: 50px;
      height: 50px;
      border: 5px solid #f3f3f3;
      border-top: 5px solid #3498db;
      border-radius: 50%;
      animation: spin 1s linear infinite;
      margin: 0 auto;
    }

    .checkmark {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      display: none;
      background-color: #4CAF50;
      position: relative;
      margin:  auto;
    }

    .checkmark:after {
      content: '';
      position: absolute;
      width: 8px;
      height: 16px;
      border: solid white;
      border-width: 0 3px 3px 0;
      transform: rotate(45deg);
      top: 13px;
      left: 20px;
    }

    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }
  </style>
</head>
<body>
<div class="container">
  <p id="loadingText" class="loading-text">Your payment is processing</p>
  <p id="successText" class="success-text">Payment successful</p>
  <div id="spinner" class="spinner"></div>
  <div id="checkmark" class="checkmark"></div>
</div>

<script>

  setTimeout(function() {
    document.getElementById('loadingText').style.display = 'none';
    document.getElementById('spinner').style.display = 'none';
    document.getElementById('successText').style.display = 'block';
    document.getElementById('checkmark').style.display = 'block';


    setTimeout(function() {
      window.location.href = '${pageContext.request.contextPath}/MyBookings';
    }, 1500);

  }, 2000);
</script>

</body>
</html>