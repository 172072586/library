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
            width: 100px;
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
    <div class="demoTable layui-form">
        <div class="layui-inline">
            <input class="layui-input" name="book_name" id="book_name" autocomplete="off"  placeholder="请输入借阅书名">
        </div>
        <div class="layui-inline">
            <div class="layui-input-block">
                <select name="state" id="state">
                    <option value="">请选择归还状态</option>
                    <option value="已借阅">已借阅</option>
                    <option value="已归还">已归还</option>
                </select>
            </div>
        </div>
        <a class="layui-btn" onclick="selecLend();" data-type="reload">搜索</a>
        <a href="listDisBack.action" class="layui-btn"  data-type="reload">查看图书借阅记录</a>
    </div>
</div>

<br>
</select>
<div style=" text-align: center;  color: #808080;">
    <table width="100%" border="1" style="border-color: #999999">
        <thead style="height: 47px; font-size: 18px;" >
        <tr bgcolor="#eff8ff"  >
            <td>借阅人</td>
            <td>书本编号</td>
            <td>书名</td>
            <td>借阅时间</td>
            <td>借阅状态(点击归还)</td>
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
        //进入界面查询借阅记录
        var reader_name = $("#use").text().trim();
        $.ajax({
            url:"ReaderLendInfo.action?reader_name=" + reader_name,
            type:"post",
            dataType:"json",
            success:function (data) {
                /*$("#tbody").empty();*/
                eachLendInfo(data);
            }
        })
    })

    //条件查询
    function selecLend() {
        var book_name = $("#book_name").val().trim();
        var state = $("#state").val().trim();
        /*alert(book_name+""+state);*/
        if (book_name != "" && state != "") {
            $.ajax({
                url: "queryLendInfo.action",
                dataType: "json",
                type: "post",
                data: {"book_name": book_name, "state": state},
                success: function (data) {
                    eachLendInfo(data)
                }
            })
        }else if(book_name != "" && state == ""){
            $.ajax({
                url: "queryLendName.action",
                dataType: "json",
                type: "post",
                data: {"book_name": book_name},
                success: function (data) {
                    eachLendInfo(data)
                }
            })
        }else if(book_name == "" && state != ""){
            $.ajax({
                url: "queryState.action",
                dataType: "json",
                type: "post",
                data: { "state": state},
                success: function (data) {
                    eachLendInfo(data)
                }
            })
        }else if (book_name == "" && state == "") {
            alert("请输入查询条件！")
        }
    }

    //查询借阅事件
    //遍历返回的json格式book数据
    function eachLendInfo(data) {
        var lendinfo = "";
        $.each(data, function(i, n) {
            var a = "";
            a += "<tr style='height: 42px'><td>"+n.reader_name+"</td><td>"+n.book_id+"</td><td>"+n.book_name+"</td><td>"+n.lend_date+"</td><td>" +
                "<button id="+n.book_id+" "+"onclick='deleteLendInfo("+ n.book_id +");'>"+n.state+"</button></td></tr>"
            lendinfo += a;
        });
        $("#tbody").empty();
        $("#tbody").append(lendinfo);
    }


    //归还图书事件
    function deleteLendInfo(book_id) {
        var  state= $("#"+book_id).text(); //借阅状态
        if(state == "已归还"){
            alert("改图书已归还   无需再次归还")
        }
        if(state == "已借阅"){
            //归还图书
            var reader_name = $("#use").text().trim();
            $.ajax({
                url:"editLendInfo.action",
                type:"post",
                data:{"book_id":book_id,"reader_name":reader_name},
                dataType:"text",
                success:function (data) {
                    if(data != null){
                        alert("归还成功")
                    }else{
                        alert("归还失败")
                    }
                }
            })
            window.location.reload();
        }
    }


</script>
</body>
</html>
