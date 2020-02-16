<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/pintuer.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/admin.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/pintuer.js"></script>
    <script type="text/javascript">
        function backList(num) {
            location.href = "${pageContext.request.contextPath}/goods?pageNum=" + num;
        }

        function displayadd() {
            var addNum=document.getElementById("addNum");
            var addStock=document.getElementById("addStock");
            addNum.style.display="block";
            addStock.style.display="none";
        }
    </script>
</head>
<body>
<div class="panel admin-panel margin-top">
    <div class="panel-head" id="add">
        <strong><span class="icon-pencil-square-o"></span>修改商品</strong>
    </div>
    <div class="body-content">
        <form method="post" class="form-x"
              action="${pageContext.request.contextPath}/updateGood?pageNum=${pageNum}">
            <div class="form-group">
                <div class="label">
                    <label>商品编号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w80" value="${good.goodsId}"
                           name="goodsId" readonly="readonly"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>商品名称：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w80" value="${good.goodsName}"
                           name="goodsName"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>市场价：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w80" value="${good.marketPrice}"
                           name="marketPrice"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>商城价：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w80" value="${good.mallPrice}"
                           name="mallPrice"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>商品类别：</label>
                </div>
                <div class="field">
                    <select name="catelog.catelogId">
                        <c:forEach var="cat" items="${cateList}">
                            <option value="${cat.catelogId}" ${cat.catelogId eq good.catelog.catelogId?"selected":""}>${cat.catelogName}</option>
                        </c:forEach>
                    </select>
                </div>
                <ul id="addStock" style="position: absolute;left: 270px;top: 310px">
                    <li><a class="button border-main icon-plus-square-o"
                           href="#" onclick="displayadd()"> 添加库存</a></li>
                </ul>
            </div>
            <div class="form-group" style="display: none" id="addNum">
                <div class="label">
                    <label>添加数量：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w80"
                           name="num"/>
                    <div class="tips"></div>
                </div>
            </div>
            <input type="hidden" name="goodsAddress" value="${good.goodsAddress}">
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit">保存</button>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="button"
                            style="position: relative;left: 250px;bottom: 41px;background-color: #BBBBBB;border-color: #BBBBBB"
                            onclick="backList(${pageNum})">取消
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>