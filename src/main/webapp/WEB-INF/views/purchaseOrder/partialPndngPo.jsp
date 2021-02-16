<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<body>
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
						<i class="fa fa-file-o"></i>Indent Header
					</h1>

				</div> -->
			</div>
			<br>
			<!-- END Page Title -->



			<!-- BEGIN Main Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-title">
							<h3>
								<i class="fa fa-bars"></i>Pending/Partial Pending Indent
							</h3>
							<div class="box-tool">
								<div class="box-tool">
									<%-- <a href="${pageContext.request.contextPath}/showIndent">Add
										Indent</a> <a data-action="collapse" href="#"><i
										class="fa fa-chevron-up"></i></a> --%>
								</div>
							</div>
							<!-- <div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> <a data-action="close" href="#"><i
									class="fa fa-times"></i></a>
							</div> -->
						</div>

						<c:set value="0" var="isEdit"></c:set>
						<c:set value="0" var="isDelete"></c:set>
						<c:forEach items="${sessionScope.newModuleList}"
							var="allModuleList">
							<c:choose>
								<c:when
									test="${allModuleList.moduleId==sessionScope.sessionModuleId}">
									<c:forEach items="${allModuleList.subModuleJsonList}"
										var="subModuleJsonList">
										<c:choose>
											<c:when
												test="${subModuleJsonList.subModuleId==sessionScope.sessionSubModuleId}">
												<c:choose>

													<c:when test="${subModuleJsonList.editReject eq 'visible'}">
														<c:set value="1" var="isEdit"></c:set>
													</c:when>
												</c:choose>
												<c:choose>
													<c:when
														test="${subModuleJsonList.deleteRejectApprove eq 'visible'}">
														<c:set value="1" var="isDelete"></c:set>
													</c:when>
												</c:choose>
											</c:when>
										</c:choose>
									</c:forEach>
								</c:when>
							</c:choose>

						</c:forEach>


						<div class="box-content">
							<%-- <div class="form-group">
									<label class="col-sm-3 col-lg-2 control-label">From
										Date</label>
									<div class="col-sm-5 col-lg-3 controls">
										<input class="form-control date-picker" id="from_date"
											size="16" type="text" name="from_date" value="${fromDate}"
											required />
									</div>
									
									<div
										class="col-sm-25 col-sm-offset-3 col-lg-30 col-lg-offset-0">
										<input type="submit" value="Submit" class="btn btn-primary">
									</div>
								</div> --%>

							<div class="clearfix"></div>
							<div id="table-scroll" class="table-scroll">

								<div id="faux-table" class="faux-table" aria="hidden">
									<table id="table2" class="main-table">
										<thead>
											<tr class="bgpink">
												<!-- <th width="180" style="width: 90px">Indent No</th>
													<th width="200" align="left">Date</th>
													<th width="358" align="left">Category</th>
													<th width="194" align="left">Type</th>
													<th width="102" align="left">Development</th>
													<th width="102" align="left">Monthly</th>

													<th width="88" align="left">Action</th> -->
											</tr>
										</thead>
									</table>

								</div>
								<div class="col-md-8"></div>

								<div class="input-group">
									<input type="text" id="myInput"
										style="text-align: left; color: green;" class="form-control"
										onkeyup="myFunction()"
										placeholder="Search Indent By No Or Type" /> <span
										class="input-group-addon"> <i class="fa fa-search"></i>
									</span>
								</div>
								<br />
								<div class="table-wrap">

									<table id="table1" class="table table-advance">
										<thead>
											<tr class="bgpink">
											<th class="col-sm-1">Sr No</th>
											<th class="col-md-1">Indent No.</th>
											<th class="col-md-1">Date</th>
											<th class="col-md-1">Category</th>
											<th class="col-md-1">Indent Type</th>
											<th class="col-md-1">Account Head</th>
											<th class="col-md-1">Is Monthly</th>
											<th class="col-md-1">Status</th>
											 <th class="col-md-1">Action</th> 
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${indentListRes2}" var="indent"
												varStatus="count">
												<tr>
													<td class="col-sm-1"><c:out value="${count.index+1}" /></td>
													<td class="col-md-2"><c:out value="${indent.indMNo}" /></td>
													<td class="col-md-2"><c:out value="${indent.indMDate}" /></td>
													<td class="col-md-1"><c:out value="${indent.catDesc}" /></td>
													<td class="col-md-1"><c:forEach items="${typeList}"
															var="typeList">
															<c:choose>
																<c:when test="${indent.indMType==typeList.typeId}">
														${typeList.typeName}
														</c:when>
															</c:choose>
														</c:forEach></td>
													<td class="col-md-1"><c:out
															value="${indent.accountHead}" /></td>
													<td class="col-md-1"><c:choose>
															<c:when test="${indent.indIsmonthly==1}">YES</c:when>
															<c:when test="${indent.indIsmonthly==0}">NO</c:when>
														</c:choose></td>
													<c:set var="sts" value="-"/>
															<c:choose>
																<c:when test="${indent.indMStatus==9}">
																	<c:set var="sts" value="Approval peding"></c:set>
																</c:when>
																<c:when test="${indent.indMStatus==7}">
																	<c:set var="sts" value="Approval peding"></c:set>
																</c:when>
																<c:when test="${indent.indMStatus==0}">
																	<c:set var="sts" value="Indet Pending"></c:set>
																</c:when>
																<c:when test="${indent.indMStatus==1}">
																	<c:set var="sts" value="Partially Indent"></c:set>
																</c:when>
																<c:when test="${indent.indMStatus==2}">
																	<c:set var="sts" value="Indent Complete"></c:set>
																</c:when>
															</c:choose>
																
														 <td  ><c:out value="${sts}" /></td>

													<td><a
														href="${pageContext.request.contextPath}/addPurchaseOrderFromDashboard/${indent.indMId}/${indent.indMType}">PO
													</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
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
		</div>
		<!-- END Content -->
	</div>
	<!-- END Container -->

	<!--basic scripts-->


	<script type="text/javascript">
		function genPdf(id) {

			window.open('pdfForReport?url=/pdf/indentPdfDoc/' + id);

		}

		function commonPdf() {

			var list = [];

			$("input:checkbox[name=name1]:checked").each(function() {
				list.push($(this).val());
			});

			window.open('pdfForReport?url=/pdf/indentPdfDoc/' + list);

		}
	</script>


	<script>
		function myFunction() {
			var input, filter, table, tr, td, td1, i;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("table1");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[5];
				td1 = tr[i].getElementsByTagName("td")[1];
				if (td || td1) {
					if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}//end of for

		}
	</script>


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
</body>
</html>