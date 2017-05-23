<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctxp" value="${pageContext.request.contextPath}" />

<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>mobile devices table</title>
	<base href="${ctxp}/" />
	<link rel="stylesheet" href="resources/lib/materialize/materialize.min.css">
	<link rel="stylesheet" href="resources/lib/jsgrid-1.5.3/css/jsgrid.css">
	<link rel="stylesheet" href="resources/lib/jsgrid-1.5.3/css/theme.css">
	<style>
		html, body, body * {
			font-size: 11px;
		}
		td {
			word-wrap:break-word;
		}
	</style>
	<script src="resources/lib/jquery/jquery-1.8.3.js"></script>
</head>
<body>

    <div id="srkGrid"></div>
	<script src="resources/lib/jsgrid-1.5.3/src/jsgrid.core.js"></script>
	<script src="resources/lib/jsgrid-1.5.3/src/jsgrid.load-indicator.js"></script>
	<script src="resources/lib/jsgrid-1.5.3/src/jsgrid.load-strategies.js"></script>
	<script src="resources/lib/jsgrid-1.5.3/src/jsgrid.sort-strategies.js"></script>
	<script src="resources/lib/jsgrid-1.5.3/src/jsgrid.validation.js"></script>
	<script src="resources/lib/jsgrid-1.5.3/src/jsgrid.field.js"></script>
	<script src="resources/lib/jsgrid-1.5.3/src/fields/jsgrid.field.text.js"></script>
	<script src="resources/lib/jsgrid-1.5.3/src/fields/jsgrid.field.number.js"></script>
	<script src="resources/lib/jsgrid-1.5.3/src/fields/jsgrid.field.select.js"></script>
	<script src="resources/lib/jsgrid-1.5.3/src/fields/jsgrid.field.checkbox.js"></script>
	<script src="resources/lib/jsgrid-1.5.3/src/fields/jsgrid.field.control.js"></script>
	<script src="resources/lib/jsgrid-1.5.3/src/i18n/ko.js"></script>
	<script>
		var ctxp = '${ctxp}';
		jsGrid.locale("ko");
		jsGrid.validators.phone_cd = {
			message: "필수이며, 30자이하여야 합니다.",
			validator: function(value, item) {
			    return /^.{1,30}$/.test(value);
			}
		};
		
		/* $(function(){
			jsGrid.locale("ko");
			
			$('#srkGrid')
		}); */
		/* function hasDuplicates(array) {
		    var valuesSoFar = Object.create(null);
		    for (var i = 0; i < array.length; ++i) {
		        var value = array[i];
		        if (value in valuesSoFar) {
		            return true;
		        }
		        valuesSoFar[value] = true;
		    }
		    return false;
		} */
		
		function lowerIndexOf(a, b) {
			if(a && b) {
				return a.toLowerCase().indexOf(b.toLowerCase()) > -1;
			} else {
				console.log(a, b);
				return true;
			}
		}
		$.ajax({
			type : "GET",
			url : ctxp + "/read"
		}).done(function(res) {
			console.log(res);
			var grid = $("#srkGrid").jsGrid({
                width: "100%",
                filtering: true,
                editing: true,
                inserting: true,
                sorting: true,
                paging: true,
                autoload: true,
                autosearch: true,
                pageSize: 10,
                pageButtonCount: 5,
                controller: {
				    loadData: function(filter) {
				    	return $.grep(res, function(res) {
			                return (!filter.PHONE_CD || lowerIndexOf(res.PHONE_CD, filter.PHONE_CD))
			                    && (!filter.PHONE_NM || lowerIndexOf(res.PHONE_NM, filter.PHONE_NM))
			                    && (!filter.MANU_YMD || lowerIndexOf(res.MANU_YMD, filter.MANU_YMD))
			                    && (!filter.MANU_CD || lowerIndexOf(res.MANU_CD, filter.MANU_CD))
			                    && (!filter.CARRIER_CD || lowerIndexOf(res.CARRIER_CD, filter.CARRIER_CD))
			                    && (!filter.CARRIER_NATION || lowerIndexOf(res.CARRIER_NATION, filter.CARRIER_NATION))
			                    && (!filter.SCR_WIDTH || res.SCR_WIDTH == filter.SCR_WIDTH)
			                    && (!filter.SCR_HEIGHT || res.SCR_HEIGHT == filter.SCR_HEIGHT)
			                    && (!filter.SCR_CD || lowerIndexOf(res.SCR_CD, filter.SCR_CD))
			                    && (!filter.OS_TYPE || lowerIndexOf(res.OS_TYPE, filter.OS_TYPE))
			                    && (!filter.OS_VER || lowerIndexOf(res.OS_VER, filter.OS_VER))
			                    && (!filter.OS_NM || lowerIndexOf(res.OS_NM, filter.OS_NM))
			                    && (!filter.CPU_CORE || lowerIndexOf(res.CPU_CORE, filter.CPU_CORE))
			                    && (!filter.CPU_HZ || lowerIndexOf(res.CPU_HZ, filter.CPU_HZ))
			                    && (!filter.RAM_SIZE || res.RAM_SIZE == filter.RAM_SIZE)
			                    && (!filter.KOR_URL || lowerIndexOf(res.KOR_URL, filter.KOR_URL))
			                    && (!filter.ENG_URL || lowerIndexOf(res.ENG_URL, filter.ENG_URL))
			            });
				    },
				    
				    insertItem: function(item) {
						$.ajax({
							type: 'POST',
							url: '/create',
							data: item
						})
						/* .done(function(res2){
							console.log(res2);
							if(res2 != 1) {
								
							} else {
								
							}
						}).fail(function(xhr, status, e) {
							alert('서버 에러');
							console.log(xhr, status, e);
						}); */
				    },
				    
				    updateItem: function(item) {
				    	$.ajax({
							type: 'POST',
							url: '/update',
							data: item
						});
				    },
				    
				    deleteItem: function(item) {
						$.ajax({
							type: 'POST',
							url: '/delete',
							data: item
						});
				    }
				},
                onItemInserting: function(args) {
                	var d = args.grid.data;
            		for(var i in d) {
            			if(d[i].PHONE_CD == args.item.PHONE_CD) {
            				args.cancel = true;
            				alert('제품코드가 중복됩니다.');
            				break;
            			}
            		}
                },
                onItemInserted: function(args) {
                	console.log(args.grid._sortField);
                	if(args.grid._sortField) {
                    	var sortField = args.grid._sortField.name;
                    	var sortOrder = args.grid._sortField._grid._sortOrder;
                    	grid.jsGrid("sort", { field: sortField, order: sortOrder });
                	} else {
                    	grid.jsGrid("sort", { field: "PHONE_CD", order: "asc" });
                	}
                },
                onItemUpdating: function(args) {
					if(args.previousItem.PHONE_CD != args.item.PHONE_CD) {
	                	var d = args.grid.data;
	            		for(var i in d) {
	            			if(d[i].PHONE_CD == args.item.PHONE_CD) {
	            				args.cancel = true;
	            				alert('제품코드가 중복됩니다.');
	            				break;
	            			}
	            		}
					}
                },
                onItemUpdated: function(args) {
                	console.log(args.grid._sortField);
                	if(args.grid._sortField) {
                    	var sortField = args.grid._sortField.name;
                    	var sortOrder = args.grid._sortField._grid._sortOrder;
                    	grid.jsGrid("sort", { field: sortField, order: sortOrder });
                	} else {
                    	grid.jsGrid("sort", { field: "PHONE_CD", order: "asc" });
                	}
                },
                fields: [
                    { type: "control" },
                    { name: "PHONE_CD", title: "제품코드", type: "text", width: 80, validate: "phone_cd" },
                    { name: "PHONE_NM", title: "제품명", type: "text", width: 80, validate: { validator: "maxLength", param: 100 } },
                    { name: "MANU_YMD", title: "출시년월일", type: "text", width: 80, validate: { validator: "maxLength", param: 15 } }, // 날짜 정규식 필요 및 - 처리 및 datetimepicker
                    { name: "MANU_CD", title: "제조사", type: "text", width: 80, validate: { validator: "maxLength", param: 30 } },
                    { name: "CARRIER_CD", title: "통신사", type: "text", width: 80, validate: { validator: "maxLength", param: 30 } },
                    { name: "CARRIER_NATION", title: "서비스국가", type: "text", width: 80, validate: { validator: "maxLength", param: 30 } },
                    { name: "SCR_WIDTH", title: "화면크기-가로", type: "number", width: 50, validate: { validator: "max", param: 10000 } },
                    { name: "SCR_HEIGHT", title: "화면크기-세로", type: "number", width: 50, validate: { validator: "max", param: 10000 } },
                    { name: "SCR_CD", title: "화면크기", type: "text", width: 80, validate: { validator: "maxLength", param: 30 } },
                    { name: "OS_TYPE", title: "os종류", type: "text", width: 80, validate: { validator: "maxLength", param: 30 } },
                    { name: "OS_VER", title: "os버전", type: "text", width: 80, validate: { validator: "maxLength", param: 20 } },
                    { name: "OS_NM", title: "os이름", type: "text", width: 80, validate: { validator: "maxLength", param: 30 } },
                    { name: "CPU_CORE", title: "cpu core", type: "text", width: 80, validate: { validator: "maxLength", param: 20 } },
                    { name: "CPU_HZ", title: "cpu hz", type: "text", width: 80, validate: { validator: "maxLength", param: 20 } },
                    { name: "RAM_SIZE", title: "ram", type: "number", width: 50, validate: { validator: "max", param: 10000 } }, // decimal 정규식 필요
                    { name: "KOR_URL", title: "힌극어 제품 url", type: "text", validate: { validator: "maxLength", param: 300 } },
                    { name: "ENG_URL", title: "영어 제품 url", type: "text", validate: { validator: "maxLength", param: 300 } }
                ]
            });
			
		}).fail(function(xhr, status, e) {
			console.log(xhr, status, e);
		});
	</script>

</body>
</html>
