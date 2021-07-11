<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>图书管理系统</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <style>
        .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
    </style>
    <style type="text/css">
        button{
            border-color: unset;
            height: 35px;
            width: 55px;
            color: white;
            background-color: #28B779;
            font-size: 20px;
        }

    </style>
</head>
<body <%--class="layui-layout-body"--%>>
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/WEB-INF/jsp/common/header.jsp" flush="true"/>
</div>
    <!-- 搜索条件表单 -->

    <div align="center">
        <div class="layui-inline ">
            <input class="layui-input" name="book_name" id="book_name" autocomplete="off"  placeholder="请输入书名">
        </div>
        <div class="layui-inline">
            <input class="layui-input" name="author" id="author" autocomplete="off"  placeholder="请输入作者">
        </div>
        <%--<div class="layui-inline layui-input-block"> <!--获取到数据不显示出来。。。。-->
            <select  id="typeBtn" onclick="bookType();">
                <option value="">请选择书本类别</option>
            </select>
        </div>--%>
        <a class="layui-btn" onclick="selectBook();" data-type="reload">搜索</a>
        <a href="book.action" class="layui-btn"  data-type="reload">查看所有图书</a>
        <c:if test="${admin!=null}">
        <a style="margin-left: 70px" class="layui-btn layui-btn-normal" onclick="add();">添加图书</a>
        </c:if>
    </div>

<br>
</select>
<div style=" text-align: center;  color: #808080;">
    <table width="100%" border="1" style="border-color: #999999">
        <thead style="height: 45px; font-size: 18px;" >
        <tr bgcolor="#eff8ff"  >
            <td>书本编号</td>
            <td>书名</td>
            <td>作者</td>
            <td>出版社</td>
            <td>出版日期</td>
            <td>库存(本)</td>
            <td>价格(元)</td>
            <c:if test="${admin!=null}">
            <td>操作</td>
            </c:if>
        </tr>
        </thead >

        <tbody id="tbody" style=" font-size: 18px">
        </tbody>
    </table>
</div>


<script src="js/layui.js"></script>

<script>
    layui.config({
        version: '1554901098009' //为了更新 js 缓存，可忽略
    });

    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function() {
        var laydate = layui.laydate //日期
            , laypage = layui.laypage //分页
            , layer = layui.layer //弹层
            , table = layui.table //表格
            , carousel = layui.carousel //轮播
            , upload = layui.upload //上传
            , element = layui.element //元素操作
            , slider = layui.slider //滑块
    })


    $(function () {
        //进入界面查询所有图书
        var book = "";
        $.ajax({
            url:"findAllBook.action",
            type:"post",
            dataType:"json",
            success:function (data) {
                /*$("#tbody").empty();*/
               eachAllBook(data);
            }
        })
    })

    //条件查询
    function selectBook() {
        var name = $("#book_name").val().trim();
        var author = $("#author").val().trim();
        /*alert(name+""+author);*/
        if (name != "" && author != "") {
            $.ajax({
                url: "querySomeBook.action",
                dataType: "json",
                type: "post",
                data: {"book_name": book_name, "author": author},
                success: function (data) {
                    eachAllBook(data)
                }
            })
        }else if(book_name != "" && author == ""){
            $.ajax({
                url: "queryNameBook.action",
                dataType: "json",
                type: "post",
                data: {"book_name": book_name},
                success: function (data) {
                    eachAllBook(data)
                }
            })
        }else if(book_name == "" && author != ""){
            $.ajax({
                url: "queryAuthorBook.action",
                dataType: "json",
                type: "post",
                data: { "author": author},
                success: function (data) {
                    eachAllBook(data)
                }
            })
        }else if (book_name == "" && author == "") {
            alert("请输入查询条件！")
        }


    }
    //查询所有图书事件
    //遍历返回的json格式book数据
    function eachAllBook(data) {
        var user = $("#user").text();
        if(user == "图书后台管理系统"){
            var book = "";
            $.each(data, function(i, n) {
                var a = "";
                a += "<tr><td>"+n.book_id+"</td><td>"+n.book_name+"</td><td>"+n.author+"</td><td>"+n.publish+"</td><td>"+n.pubdate+"</td><td>"+n.stock+"</td><td>"+n.price+"</td><td>" +
                    "<button id="+n.book_id+" "+"onclick='editBook("+ n.book_id +");'>修改</button>"+" "+"<button id="+n.book_id+" "+ "onclick='removeBook("+n.book_id+");'>删除</button></td></tr>"
                book += a;
            });
            $("#tbody").empty();
            $("#tbody").append(book);
        }else if(user == "图书管理系统"){
            var book = "";
            $.each(data, function(i, n) {
                var a = "";
                a += "<tr style='height: 36px'><td>"+n.book_id+"</td><td>"+n.book_name+"</td><td>"+n.author+"</td><td>"+n.publish+"</td><td>"+n.pubdate+"</td><td>"+n.stock+"</td><td>"+n.price+"</td><td>"
                book += a;
            });
            $("#tbody").empty();
            $("#tbody").append(book);
        }



    }


    function add(){//添加弹层
        layer.open({
            type: 2,
            title: '添加图书',
            skin: 'layui-layer-demo', //加上边框
            area: ['800px', '600px'], //宽高
            content: 'addBook.action'
        });
    }

    function editBook(book_id){//修改图书弹层
        layer.open({
            type: 2,
            title: '修改图书',
            skin: 'layui-layer-demo', //加上边框
            area: ['800px', '600px'], //宽高
            content: 'changeBook.action?book_id='+book_id
        });
    }

    //删除功能
    function removeBook(book_id) {
        var id = book_id;
        var result = confirm("确认删除图书？");
        if(result==true){
            $.ajax({
                url:"removeBook.action",
                dataType:"json",
                type:"post",
                data:{"book_id":id},
                success:function(data) {
                    /*$("#tbody").empty();*/
                }
            })
        }
        window.location.reload();
    }

</script>
</body>
</html>
