<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>

    <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
    <style type="text/css">
        #bar {
            width: 250px;
            min-height: 20px;
        }
        .cell {
            width: 19%;
            border: solid #fff 1px;
            display: block;
            float: left;
            min-height: 20px;
            background-color: #ccc;
        }
        #s0.on {
            background-color: red;
        }
        #s1.on {
            background-color: #EE8262;
        }
        #s2.on {
            background-color: orange;
        }
        #s3.on {
            background-color: #C8F526;
        }
        #s4.on {
            background-color: green;
        }
        span#strength-text {
            float:left;
        }
        .form-style-8{
            font-family: 'Open Sans Condensed', arial, sans;
            width: 500px;
            padding: 30px;
            background: #FFFFFF;
            margin: 50px auto;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.22);
            -moz-box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.22);
            -webkit-box-shadow:  0px 0px 15px rgba(0, 0, 0, 0.22);

        }
        .form-style-8 h2{
            background: #4D4D4D;
            text-transform: uppercase;
            font-family: 'Open Sans Condensed', sans-serif;
            color: #797979;
            font-size: 18px;
            font-weight: 100;
            padding: 20px;
            margin: -30px -30px 30px -30px;
        }
        .form-style-8 input[type="text"],
        .form-style-8 input[type="date"],
        .form-style-8 input[type="datetime"],
        .form-style-8 input[type="email"],
        .form-style-8 input[type="number"],
        .form-style-8 input[type="search"],
        .form-style-8 input[type="time"],
        .form-style-8 input[type="url"],
        .form-style-8 input[type="password"],
        .form-style-8 textarea,
        .form-style-8 select
        {
            box-sizing: border-box;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            outline: none;
            display: block;
            width: 100%;
            padding: 7px;
            border: none;
            border-bottom: 1px solid #ddd;
            background: transparent;
            margin-bottom: 10px;
            font: 16px Arial, Helvetica, sans-serif;
            height: 45px;
        }
        .form-style-8 textarea{
            resize:none;
            overflow: hidden;
        }
        .form-style-8 input[type="button"],
        .form-style-8 input[type="submit"]{
            -moz-box-shadow: inset 0px 1px 0px 0px #45D6D6;
            -webkit-box-shadow: inset 0px 1px 0px 0px #45D6D6;
            box-shadow: inset 0px 1px 0px 0px #45D6D6;
            background-color: #2CBBBB;
            border: 1px solid #27A0A0;
            display: inline-block;
            cursor: pointer;
            color: #FFFFFF;
            font-family: 'Open Sans Condensed', sans-serif;
            font-size: 14px;
            padding: 8px 18px;
            text-decoration: none;
            text-transform: uppercase;
        }
        .form-style-8 input[type="button"]:hover,
        .form-style-8 input[type="submit"]:hover {
            background:linear-gradient(to bottom, #34CACA 5%, #30C9C9 100%);
            background-color:#34CACA;
        }
    </style>

    <title>Password meter demo</title>

</head>

<body>
<div id="container">

    <div class="form-style-8">
        <h2>Password Test</h2>

        <form:form class="form-horizontal" method="post" modelAttribute="user" action="addPassword" onsubmit="return validateForm()">
            <form:input path="password" type="text" class="form-control " id="password" placeholder="password" onkeypress="passwordCheck()" />
            <span style="color: red; "><form:errors path="password" class="control-label" /></span>
            <div id="bar">
                <span id="s0" class="cell"></span>
                <span id="s1" class="cell"></span>
                <span id="s2" class="cell"></span>
                <span id="s3" class="cell"></span>
                <span id="s4" class="cell"></span>
            </div>
            <span id="strength-text"></span><br/>
            <input type="submit"  value="Submit" />
        </form:form>
    </div>

</div>

<script language="javascript" type="text/javascript" src="passwordAnalyzer.js"></script>

<script type="text/javascript" language="javascript">
    function validateForm() {
        var pw_value = document.forms["user"]["password"].value;
        return isValidPassword(pw_value);
    }

    function switchOffAllCells() {
        switchOffCell(0);
        switchOffCell(1);
        switchOffCell(2);
        switchOffCell(3);
        switchOffCell(4);
    }

    function indicateStrength(str) {
        var text = document.getElementById("strength-text");
        text.innerHTML = str;
    }

    function switchOffCell(number) {
        var cell = document.getElementById('s' + number);
        cell.className = 'cell';
    }

    function switchOnCell(number) {
        var cell = document.getElementById('s' + number);
        cell.className = 'cell on';
    }

    function passwordCheck() {
        var pw_value = document.forms["user"]["password"].value;
        var score = scorePasswordStrength(pw_value);

        switchOffAllCells();

        switch(score)
        {
            case 0:
                switchOnCell(0);
                indicateStrength("Very weak");
                break;
            case 1:
                switchOnCell(0);
                switchOnCell(1);
                indicateStrength("Weak");
                break;
            case 2:
                switchOnCell(0);
                switchOnCell(1);
                switchOnCell(2);
                indicateStrength("Adequate");
                break;
            case 3:
                switchOnCell(0);
                switchOnCell(1);
                switchOnCell(2);
                switchOnCell(3);
                indicateStrength("Pretty good");
                break;
            case 4:
                switchOnCell(0);
                switchOnCell(1);
                switchOnCell(2);
                switchOnCell(3);
                switchOnCell(4);
                indicateStrength("Excellent");
                break;
            default:
                switchOnCell(0);
        }
    }



</script>

</body>
</html>
