<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
    <title>게시물 등록</title>
    <style>
        body {font-family: "나눔고딕", "맑은고딕";}
        h1 {font-family: "HY견고딕";}
        a:link {color: black;}
        a:visited {color: red;}
        a:hover {color: red;}
        a:active {color: red;}
        a {
            text-decoration: none;
            cursor: hand;
        }

        .mainDiv {text-align: center;}

        #topBanner {
            margin-top: 10px;
            margin-bottom: 10px;
            max-width: 500px;
            height: auto;
            display: block;
            margin: 0 auto;
        }

        .WriteForm {
            width: 900px;
            height: auto;
            margin: auto;
            padding: 20px;
            background-color: white;
            text-align: center;
            border: 4px solid gray;
            border-radius: 3px;
        }

        .items {
            width: 90%;
            height: 25px;
            outline: none;
            color: #636e72;
            font-size: 16px;
            background: none;
            border: none;
            border-bottom: 2px solid #adadad;
            padding: 10px 10px;
            text-align: left;
        }

        .content {
            width: 850px;
            height: 300px;
            padding: 10px;
            box-sizing: border-box;
            border: solid #adadad;
            font-size: 16px;
            resize: both;
        }

        .btn_write {
            position: relative;
            margin-top: 20px;
            margin-bottom: 10px;
            width: 40%;
            height: 40px;
            background-color: red;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
            display: inline;
        }

        .btn_cancel {
            position: relative;
            margin-top: 20px;
            margin-bottom: 10px;
            width: 40%;
            height: 40px;
            background-color: pink;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
            display: inline;
        }
    </style>
    <script>
        const registerForm = () => {

            let writer = document.querySelector("#writer");
            let title = document.querySelector("#title");
            let content = document.querySelector("#content");

            if(writer.value === ''){
                alert("이름을 입력하세요.");
                writer.focus();
                return false;
            }

            if(title.value === ''){
                alert("제목을 입력하세요.");
                title.focus();
                return false;
            }

            if(content.value === ''){
                alert("내용을 입력하세요.");
                content.focus();
                return false;
            }

            document.WriteForm.action = '/board/write';
            document.WriteForm.submit();
        }
    </script>
</head>
<body>
    <div class="mainDiv">
        <img src="/images/logo.jpg" id="topBanner"><br>
        <h1>게시물 등록</h1>
        <br>

        <div>
            <form method="POST" class="WriteForm" name="WriteForm">
                <input type="text" name="writer" id="writer" class="items" placeholder="작성자 이름을 입력하세요.">
                <input type="text" name="title" id="title" class="items" placeholder="제목을 입력하세요.">
                <br><br>
                <textarea name="content" id="content" class="content" cols="100" rows="500" placeholder="내용을 입력하세요."></textarea>
                <input type="button" class="btn_write" value="등록" onclick="registerForm()">
                <input type="button" class="btn_cancel" value="취소" onclick="history.back()">
            </form>
        </div>
        <br><br>
    </div>
</body>
</html>