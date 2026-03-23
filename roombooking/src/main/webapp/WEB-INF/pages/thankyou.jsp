<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplate pageTitle="ThankYou">
    <style>
        .btn-home {
            background-color: #5a4fcf;
            border: none;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            font-size: 16px;
            border-radius: 25px;
            transition: all 0.3s ease;
            display: inline-block;
            margin-top: 20px;
            box-shadow: 0 2px 5px rgba(90, 79, 207, 0.3);
        }

        .btn-home:hover {
            background-color: #4a41ac;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(90, 79, 207, 0.4);
            text-decoration: none;
            color: white;
        }
    </style>

    <head>
        <title>Thank You</title>
    </head>
    <body>
    <div class="container text-center">
        <h1>Thank You!</h1>
        <p>Your message has been successfully sent. We will get back to you soon.</p>
        <a href="index.jsp" class="btn-home">Back to Home</a>
    </div>
    </body>

</t:pageTemplate>