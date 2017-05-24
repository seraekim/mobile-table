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
		.jsgrid-header-row .header-cell-placeholder {
    		background: #E3F1FF;
		}
		.jsgrid-grid-header.jsgrid-header-scrollbar {
			position: fixed;
			overflow-y: hidden;
			overflow-x: auto;
		}

		.jsgrid-grid-body {
	    	margin-top: 109px;
			overflow-y: hidden;
			overflow-x: auto;
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
<!-- 	<script src="resources/lib/jquery/jquery-ui.js"></script> -->
<!-- 	<script src="resources/lib/colResizable-1.6/colResizable-1.6.js"></script> -->
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

	    // 여러 사라밍 동시에 생성,삭제,갱신,조회를 할 때 브라우저상에서는 동기화가 안되므로 예상되는 에러를 처리
		function dealRes (data, item, msg, reload) {
			console.log(data);
			var result = 0;
			if(data == 1) {
				result = item;
			} else if(data == 0) {
				alert(msg);
				if(reload) location.reload();
			} else if(data == -1) {
				alert('db에 문제가 있습니다.')
			} else {
				alert('알 수 없는 에러 발생.');
			}
			return result;
		};
		
		$.ajax({
			type : "GET",
			url : ctxp + "/read"
		}).done(function(res) {
			//console.log(res);
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
				    	var result = 0;
						$.ajax({
							type: 'POST',
							url: '/create',
							data: item,
							async: false
						}).done(function(res2){
							result = dealRes(res2,item,'중복되는 제품코드가 있습니다. 데이터를 리로드합니다.',true);
							
						});
						return result;
				    },
				    
				    updateItem: function(item) {
				    	var result = 0;
				    	$.ajax({
							type: 'POST',
							url: '/update',
							data: item,
							async: false
						}).done(function(res2){
							result = dealRes(res2,item,'디비와 동기화 문제가 있습니다. 데이터를 리로드합니다.', true);
						});
						return result;
				    },
				    
				    deleteItem: function(item) {
						$.ajax({
							type: 'POST',
							url: '/delete',
							data: item
						}).done(function(res2){
							dealRes(res2,item,'이미 디비에 없는 제품입니다.');
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
                	if(args.grid._sortField) {
                    	var sortField = args.grid._sortField.name;
                    	var sortOrder = args.grid._sortField._grid._sortOrder;
                    	grid.jsGrid("sort", { field: sortField, order: sortOrder });
                	} else {
                    	grid.jsGrid("sort", { field: "PHONE_CD", order: "asc" });
                	}
                },
                resizable: true,
                // width 가 1000px까지는 정상적으로 보이는데 그것보다크면.. 이상해짐..
                /* onRefreshed: function(e) {
                    var $headerRow = $("#srkGrid .jsgrid-header-row");
                    var $headerCells = $headerRow.find("th");
                    var fields = e.grid.option("fields");
            
                    $.each(fields, function(index, field) {
                        $headerCells.eq(index).data("JSField", field);
                    });
            		console.log($headerRow);
                    $headerRow.sortable({
                        axis: "x",
                        //forcePlaceholderSize: true,
                        placeholder: "header-cell-placeholder",
                        start: function(e, ui){
                        	console.log(e, ui);
//                         	ui.placeholder.html('<div>placeholder</div>');
//                         	ui.helper.html('<div>helper</div>');
                            ui.placeholder.width(ui.helper.context.style.width);
                        },
                        update: function(e, ui) {
                            var fields = $.map($headerRow.find("th"), function(cell) {
                                return $(cell).data("JSField");
                            });
            
                            grid.jsGrid("option", "fields", fields);
                        }
                    });
                }, */
                
                // 편집기능이 들어가게 되는 경우... 각 행마다 컬럼 넓이가 맞지 않게 된다.
                /* onRefreshed: function (args) {
                    //sync column width on page load
                    $.each(args.grid._headerGrid[0].rows[0].cells, function (i, obj) {
                        $(args.grid._bodyGrid[0].rows[0].cells[i]).css("width", $(obj).css("width"));
                    });

                    //sync column width on column resize
                    $("table").colResizable({
                        onResize: function () {
                            $.each(args.grid._headerGrid[0].rows[0].cells, function (i, obj) {
                                $(args.grid._bodyGrid[0].rows[0].cells[i]).css("width", $(obj).css("width"));
                            });
                        }
                    });
                }, */
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
			
		});
		
		$(document).ajaxError(function(a,b,c,d) {
			alert('서버 에러, 서버 및 브라우저 콘솔 로그를 확인하세요.');
			console.log(a,b,c,d);
		});
	</script>

</body>
</html>
