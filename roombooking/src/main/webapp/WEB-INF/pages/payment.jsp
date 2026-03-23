<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <title>Card Payment</title>
    <!-- Adăugăm font-ul Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --custom-primary: #5a4fcf;
        }

        body {
            font-family: 'Poppins', sans-serif;
        }

        .payment-container {

            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            border-radius: 8px;
            background-color: #d2d5d9;
            box-shadow: 0 10px 20px rgba(90, 79, 207, 0.1);
            transition: box-shadow 0.3s ease;
        }

        .payment-container:hover {
            box-shadow: 0 15px 30px rgba(90, 79, 207, 0.2);
        }

        .payment-header {
            text-align: center;
            color: var(--custom-primary);
            margin-bottom: 20px;
            font-size: 2rem;
            font-weight: 700;
        }

        .card-icons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #666;
            font-weight: 700;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 25px;
            box-sizing: border-box;
            transition: all 0.3s ease;
            font-family: 'Poppins', sans-serif;
            font-weight: 700;
        }

        .form-group input:focus {
            outline: none;
            border-color: var(--custom-primary);
            box-shadow: 0 0 0 3px rgba(90, 79, 207, 0.1);
        }

        .expiry-cvv-group {
            display: flex;
            gap: 15px;
        }

        .expiry-cvv-group .form-group {
            flex: 1;
        }

        .pay-button {
            width: 100%;
            background-color: var(--custom-primary);
            border: none;
            color: white;
            padding: 12px 2px;
            text-decoration: none;
            font-size: 16px;
            border-radius: 25px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            margin-top: 17px;
            box-shadow: 0 2px 5px rgba(90, 79, 207, 0.3);
            cursor: pointer;
            font-family: inherit; /* Păstrează fontul original pentru buton */
        }

        .pay-button:hover {
            background-color: #4a41ac;
            box-shadow: 0 4px 8px rgba(90, 79, 207, 0.4);
        }

        .text-custom-primary {
            color: #666;
        }
    </style>
</head>
<body>
<div class="payment-container">
    <h1 class="payment-header text-custom-primary">Card Payment</h1>

    <div class="card-icons">
        <img src="images/payment-removebg-preview.png" alt="Payment Methods" height="30">
    </div>

    <form method="POST">
        <div class="form-group">
            <label>Card Name</label>
            <input type="text" name="cardName" required>
        </div>

        <div class="form-group">
            <label>Card Number</label>
            <input type="text" name="cardNumber" required pattern="\d*" maxlength="16">
        </div>

        <div class="expiry-cvv-group">
            <div class="form-group">
                <label>Expiration Date</label>
                <input type="text" name="expiryDate" placeholder="MM/YY" required pattern="\d\d/\d\d">
            </div>

            <div class="form-group">
                <label>CVV</label>
                <input type="text" name="cvv" required pattern="\d*" maxlength="4">
            </div>
        </div>

        <a type="submit" class="pay-button" href="${pageContext.request.contextPath}/PaymentProcessing">
            <i class="fas fa-lock"></i>
            Checkout
        </a>
    </form>
</div>
</body>