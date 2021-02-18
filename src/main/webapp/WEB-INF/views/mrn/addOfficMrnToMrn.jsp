<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.loader {
	border: 16px solid #f3f3f3;
	border-radius: 50%;
	border-top: 16px solid #3498db;
	width: 120px;
	height: 120px;
	-webkit-animation: spin 2s linear infinite; /* Safari */
	animation: spin 2s linear infinite;
}

/* Safari */
@
-webkit-keyframes spin { 0% {
	-webkit-transform: rotate(0deg);
}

100%
{
-webkit-transform
:
 
rotate
(360deg);
 
}
}
@
keyframes spin { 0% {
	transform: rotate(0deg);
}
100%
{
transform
:
 
rotate
(360deg);
 
}
}
</style>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

#overlay2 {
	position: fixed;
	display: none;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(101, 113, 119, 0.5);
	z-index: 2;
	cursor: pointer;
}

#text2 {
	position: absolute;
	top: 50%;
	left: 50%;
	font-size: 25px;
	color: white;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
}
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	height: 80%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

#overlay {
	position: fixed;
	display: none;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(101, 113, 119, 0.5);
	z-index: 2;
	cursor: pointer;
}

#text {
	position: absolute;
	top: 50%;
	left: 50%;
	font-size: 25px;
	color: white;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
}

.bg-overlay {
	background: linear-gradient(rgba(0, 0, 0, .7), rgba(0, 0, 0, .7)),
		url("${pageContext.request.contextPath}/resources/images/smart.jpeg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
	color: #fff;
	height: auto;
	width: auto;
	padding-top: 10px;
	padding-left: 20px;
}
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
<body onload="getInvoiceNo()">
	<%-- <jsp:include page="/WEB-INF/views/include/logout.jsp"></jsp:include> --%>	
	<c:url var="genrateNo" value="/genrateNo" />
	<!--  used here -->

	<div class="container" id="main-container">

		<!-- BEGIN Sidebar -->
		<div id="sidebar" class="navbar-collapse collapse">

			<jsp:include page="/WEB-INF/views/include/navigation.jsp"></jsp:include>

			<div id="sidebar-collapse" class="visible-lg">
				<i class="fa fa-angle-double-left"></i>
			</div>
			<!-- END Sidebar Collapse Button -->
		</div>
		<!-- END Sidebar -->

		<!-- BEGIN Content -->
		<div id="main-content">
			<!-- BEGIN Page Title -->
			<div class="page-title">
				<!-- <div>
					<h1>
						<i class="fa fa-file-o"></i>
					</h1>

				</div> -->
				<br>
			</div>
			<!-- END Page Title -->
			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i> Add Office MRN To MRN
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/getOfficeMrnHeaders">Back
									to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>

						<div class="box-content">
							<form action="${pageContext.request.contextPath}/saveOfficeMrnToMrnProcess" method="post"
								class="form-horizontal" id="validation-form">

								<div class="form-group">
									<label class="col-md-2">MRN Type </label>
									<div class="col-md-3">
										<select name="grn_type" id="grn_type"
											class="form-control chosen" placeholder="Grn Type"
											data-rule-required="true">

											<c:forEach items="${typeList}" var="typeList">
												<c:choose>
													<c:when test="${mrnHeader.mrnType==typeList.typeId}">
														<option value="${typeList.typeId}" selected>
															${typeList.typeName}</option>
													</c:when>
												</c:choose>
											</c:forEach>
										</select>
									</div>
								</div>
								<!--End of form-group div  -->


								<div class="form-group">




									<label class="col-md-2">MRN Date </label>

									<div class="col-md-3">
										<input class="form-control date-picker" id="grn_date" readonly="readonly"
											size="16" type="text" name="grn_date"
											value="${mrnHeader.mrnDate}" required />
									</div>
									<div class="col-md-1"></div>
									<label class="col-md-2">MRN No </label>
									<div class="col-md-3">
										<input type="text" name="grn_no" id="grn_no"
										 class="form-control"
											placeholder="GRN No" data-rule-required="true"
											readonly="readonly" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2"> Vendor </label>
									<div class="col-md-10">
										<select name="vendor_id" id="vendor_id"
											class="form-control chosen" placeholder="Vendor"
											data-rule-required="true">

											<option selected value="${mrnHeader.vendorId}"><c:out
													value="${mrnHeader.vendorName}" /></option>
										</select>
									</div>

								</div>
								<!--/form-grp  -->
								<input type="hidden" name="gate_entry_no" id="gate_entry_no"
									value="${mrnHeader.gateEntryNo}" data-rule-required="true" />
								<input id="gate_entry_date" type="hidden" name="gate_entry_date"
									value="${mrnHeader.gateEntryDate}" required /> <input
									type="hidden" name="chalan_no" id="chalan_no"
									data-rule-required="true" value="${mrnHeader.docNo}" /> <input
									type="hidden" name="chalan_date" id="chalan_date"
									class="form-control" data-rule-required="true"
									value="${mrnHeader.docDate}" />

								<%-- <div class="form-group">
									<label class="col-md-2">Gate
										Entry No </label>

									<div class="col-md-3">
										<input type="text" name="gate_entry_no" id="gate_entry_no"
											value="${mrnHeader.gateEntryNo}" class="form-control"
											placeholder="Gate Entry No" data-rule-required="true" />
									</div>
<div class="col-md-1"></div>
									<label class="col-md-2">Gate
										Entry Date </label>
									<div class="col-md-3">
										<input class="form-control date-picker" id="gate_entry_date"
											size="16" type="text" name="gate_entry_date"
											value="${mrnHeader.gateEntryDate}" required />
									</div>
								</div> --%>
								<%-- <div class="form-group">
									<label class="col-md-2">Challan
										No </label>

									<div class="col-md-3">
										<input type="text" name="chalan_no" id="chalan_no"
											class="form-control" placeholder="Chalan No"
											data-rule-required="true" value="${mrnHeader.docNo}" />
									</div>
<div class="col-md-1"></div>
									<label class="col-md-2">Challan
										Date </label>
									<div class="col-md-3">
										<input class="form-control date-picker" id="chalan_date"
											size="16" type="text" name="chalan_date"
											value="${mrnHeader.docDate}" required />
									</div>

								</div> --%>


								<div class="form-group">
									<label class="col-md-2">Bill/Chalan No </label>

									<div class="col-md-3">
										<input type="text" name="bill_no" id="bill_no"
											class="form-control" placeholder="Bill No"
											readonly="readonly" value="${mrnHeader.billNo}"
											data-rule-required="true" />
									</div>
									<div class="col-md-1"></div>
									<label class="col-md-2">Bill/Chalan Date </label>
									<div class="col-md-3">
										<input class="form-control date-picker" id="bill_date"
											size="16" type="text" name="bill_date" readonly="readonly"
											value="${mrnHeader.billDate}" />
									</div>

								</div>
								<div class="form-group">
									<div class="col-md-2">Remark</div>

									<div class="col-md-10">
										<input type="text" name="lorry_remark" id="lorry_remark"
											class="form-control" placeholder="Lorry Remark"
											value="${mrnHeader.remark1}" data-rule-required="true" />
									</div>
								</div>

								<div class="col-md-2"></div>

								<%-- <div class="col-md-3">	<c:choose>
								<c:when test="${mrnHeader.mrnStatus==4}">
								<input class="btn btn-info"  id="getPoButton" style="text-align: center;"
											onclick="getPoDetail(0,0)" size="16" type="button"
											name="getPoButton" value="Get PO Detail to Add New Item"  >
																</c:when> 
															</c:choose> </div> --%>

								<br />								

								<div class=" box-content">
									<div class="row">
										<div
											style="overflow: scroll; height: auto; width: 100%; overflow: auto">
											<table width="100%" border="1" class="table table-advanced "
												style="width: 100%; font-size: 14px;" id="table_grid1">
												<thead>
													<tr>
														<th style="width: 2%;">Sr</th>
														<th class="col-md-1">Item</th>
														<th class="col-md-1">Office Rec QTY</th>
														<th class="col-md-1">Remaining QTY</th>
														<th class="col-md-1">Current QTY</th>
														<th class="col-md-1">PO No</th>
														<th class="col-md-1">Status</th>
													</tr>
												</thead>

												<tbody>
													<c:forEach items="${mrnDetailList}" var="mrnDetail"
														varStatus="count">
														<tr>

															<td style="width: 2%;"><c:out
																	value="${count.index+1}" /></td>

															<td class="col-md-2">
																<div title="${mrnDetail.itemName}">${mrnDetail.itemCode}
																	${mrnDetail.itemName}</div>
															</td>
															<c:set var="status" value="o"></c:set>
															<c:choose>
																<c:when test="${mrnDetail.mrnDetailStatus==0}">
																	<c:set var="status" value="Pending"></c:set>
																</c:when>
																<c:when test="${mrnDetail.mrnDetailStatus==1}">
																	<c:set var="status" value="Partial"></c:set>
																</c:when>
																<c:when test="${mrnDetail.mrnDetailStatus==2}">
																	<c:set var="status" value="Completed"></c:set>
																</c:when>
																<c:otherwise>
																	<c:set var="status" value="Other"></c:set>
																</c:otherwise>
															</c:choose>

															<td class="col-md-1" style="text-align: right;"><c:out
																	value="${mrnDetail.mrnQty}" /></td>

															<td class="col-md-1" style="text-align: right;"><c:out
																	value="${mrnDetail.remainingQty}" /></td>

															<td class="col-md-1"><input type="text"
																style="text-align: right;" class="form-control"
																id="ofcRecQty${mrnDetail.mrnDetailId}"
																onchange="validateMrnQty(this.value,${mrnDetail.mrnQty})"
																name="ofcRecQty${mrnDetail.mrnDetailId}"
																value="${mrnDetail.mrnQty}"></td>

															<td class="col-md-1"><c:out
																	value="${mrnDetail.poNo}" /></td>

															<td class="col-md-1"><c:out value="${status}" /></td>
														</tr>
													</c:forEach>
												</tbody>

											</table>
										</div>
									</div>
								</div>
								<div class="col-md-5"></div>
								<button class="buttonload" id="loader" style="display: none">
									<i class="fa fa-spinner fa-spin" style="color: red;"></i>Loading
								</button>
								<input type="hidden" name="lorry_no" id="lorry_no"
									value="${mrnHeader.lrNo}" data-rule-required="true" /> <input
									type="hidden" name="transport" id="transport"
									value="${mrnHeader.transport}" data-rule-required="true" /> <input
									id="lorry_date" type="hidden" name="lorry_date"
									value="${mrnHeader.lrDate}" required />
								<div class="form-group"></div>

								<div class="form-group">
									<div class="col-md-4"></div>
									<div class="col-md-3" align=center>
										<input type="submit" class="btn btn-info" value="Submit"
											id="sub_btn">
									</div>
								</div>
							</form>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- END Main Content -->
	<footer>
		<p>2019 © MONGINIS</p>
	</footer>

	<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a>
	
	<!-- END Content -->
	<!-- END Container -->

	<!--basic scripts-->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="${pageContext.request.contextPath}/resources/assets/jquery/jquery-2.0.3.min.js"><\/script>')
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-cookie/jquery.cookie.js"></script>

	<!--page specific plugin scripts-->
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.resize.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.stack.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.crosshair.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.tooltip.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/sparkline/jquery.sparkline.min.js"></script>


	<!--page specific plugin scripts-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>





	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/flaty-demo-codes.js"></script>
	<!--page specific plugin scripts-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/chosen-bootstrap/chosen.jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/clockface/js/clockface.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/common.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>

	<script type="text/javascript">
			function getInvoiceNo() {

				var date = $("#grn_date").val();
				var catId = $("#grn_type").val();

				$.getJSON('${genrateNo}', {

					catId : 1,
					docId : 1,
					date : date,
					typeId : catId,
					ajax : 'true',

				}, function(data) {

					document.getElementById("grn_no").value = data.message;

				});

			}
		
	
	function validateMrnQty(currQty, remQty){
		if(currQty > remQty){
			alert("Edited Qty Limit Exceeds");
			document.getElementById("sub_btn").disabled = true;
		}else{
			document.getElementById("sub_btn").disabled = false;
		}
	}
			
</script>

</body>
</html>

