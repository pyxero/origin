<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="../../common/web/lib.jsp"%>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 品牌管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<div class="text-c">
		<form class="Huiform" method="post" action="" target="_self">
			<input type="text" placeholder="分类名称" value="" class="input-text" style="width:120px">
			<span class="btn-upload form-group">
			<input class="input-text upload-url" type="text" name="uploadfile-2" id="uploadfile-2" readonly  datatype="*" nullmsg="请添加附件！" style="width:200px">
			<a href="javascript:void();" class="btn btn-primary upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
			<input type="file" multiple name="file-2" class="input-file">
			</span> <span class="select-box" style="width:150px">
			<select class="select" name="brandclass" size="1">
				<option value="1" selected>国内品牌</option>
				<option value="0">国外品牌</option>
			</select>
			</span><button type="button" class="btn btn-success" id="" name="" onClick="picture_colume_add(this);"><i class="Hui-iconfont">&#xe600;</i> 添加</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a></span> <span class="r">共有数据：<strong>54</strong> 条</span> </div>
	<div class="mt-20">
		<table id="expmale2" class="table table-border table-bordered table-bg table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="70">ID</th>
					<th width="80">排序</th>
					<th width="200">LOGO</th>
					<th width="120">品牌名称</th>
					<th>具体描述</th>
					<th width="100"  >操作</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
$(function() {
    $('#expmale2').DataTable( {
    	  "processing": false, 
          "serverSide": true,
          "stateSave": true,
          "autofill": true,
          "searching" : false,	//禁用表格内搜索
          "lengthMenu": [10, 25, 50, 100],
      		"ajax" :   "b/brand/list",
          "columns": [
                      { "data": "id" },
                      { "data": "id" },
                      { "data": "sort" },
                      { "data": "logo" },
                      { "data": "logo" },
                      { "data": "descript" },
					  {
							"data" : "",
							"bSortable" : false,
							"searchable" : false,
							"defaultContent" : '<button  class="btn btn-xs btn-primary modify">修改</button><button class="btn btn-xs btn-primary deletebtn">删除</button>'
						}
                  ],
                  "language": {
  					"sInfo":         "当前显示第 _START_ 至 _END_ 项，共 _TOTAL_ 项。",
  					"sInfoEmpty":    "当前显示第 0 至 0 项，共 0 项",
  					"sSearch":       "搜索:",
  					"sEmptyTable":     "表中数据为空",
  					"sLoadingRecords": "载入中...",
  					"oPaginate": {
  						"sFirst":    "首页",
  						"sPrevious": "上页",
  						"sNext":     "下页",
  						"sLast":     "末页",
  					},
  					"oAria": {
  						"sSortAscending":  ": 以升序排列此列",
  						"sSortDescending": ": 以降序排列此列"
  					}
  				}
    } );
} );
		

</script>