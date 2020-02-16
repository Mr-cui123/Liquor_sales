<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<script src="${pageContext.request.contextPath}/js/pintuer.js"></script>
<script src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加商品</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" enctype="multipart/form-data"
		  action="${pageContext.request.contextPath}/addGood">
      <div class="form-group">
        <div class="label">
          <label>商品名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w80" name="goodsName"   data-validate="required:请填写商品名称" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>商品描述：</label>
        </div>
        <div class="field">
          <input type="text" class="input w80" name="goodsMiaoshu"   data-validate="required:请填写商品描述" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>商品图片：</label>
        </div>
        <div class="field">
          <input type="file" class="input w80" name="file" />
          <div class="tips"></div>
        </div>
      </div>
	  	<div class="form-group">
					<div class="label">
						<label>市场价：</label>
					</div>
					<div class="field">
						<input type="text" class="input w80" name="marketPrice"
							data-validate="required:请填写市场价" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>商城价：</label>
					</div>
					<div class="field">
						<input type="text" class="input w80" name="mallPrice"
							data-validate="required:请填写商城价" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>商品类别：</label>
					</div>
					<div class="field">
						<select name="catelog.catelogId">
							<c:forEach var="ca" items="${cate}">
								<option value=${ca.catelogId}>${ca.catelogId}:${ca.catelogName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>库存数量：</label>
					</div>
					<div class="field">
						<input type="text" class="input w80" name="stockNum"
							data-validate="required:请填写库存数量" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>生产地址：</label>
					</div>
					<div class="field">
						<input type="text" class="input w80" name="goodsAddress"
							data-validate="required:请填写生产地址" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>上市日期：</label>
					</div>
					<div class="field">
						<input type="text" class="input w80" name="date"
							   onclick="WdatePicker({readOnly:true})"
							data-validate="required:请填写上市日期" />
						<div class="tips"></div>
					</div>
				</div>
            <div class="form-group">
               <div class="label">
                 <label></label>
             </div>
            <div class="field">
              <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
            </div>
          </div>
    </form>
  </div>
</div>
</body>
</html>