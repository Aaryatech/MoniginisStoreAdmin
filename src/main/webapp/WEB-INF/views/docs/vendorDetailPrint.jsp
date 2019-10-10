<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Indent PDF</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->


<style type="text/css">
table {
	border-collapse: separate;
	border-color: black;
	font-family: arial;
	font-weight: bold;
	font-size: 90%;
	width: 100%;
	page-break-inside: auto !important;
	display: block;
}

p {
	color: black;
	font-family: arial;
	font-size: 70%;
	margin-top: 0;
	padding: 0;
	font-weight: bold;
}

.pn {
	color: black;
	font-family: arial;
	font-size: 10%;
	margin-top: 0;
	padding: 0;
	font-weight: normal;
}

h4 {
	color: black;
	font-family: sans-serif;
	font-size: 80%;
	font-weight: bold;
	padding-bottom: 10px;
	margin: 0;
}

h5 {
	color: black;
	font-family: arial;
	font-size: 95%;
	font-weight: bold;
	padding-bottom: 10px;
	margin: 0;
}

h6 {
	color: black;
	font-family: arial;
	font-size: 60%;
	font-weight: normal;
	margin: 10%;
}

th {
	/* background-color: #6a9ef2; */
	color: black;
}

hr {
	height: 1px;
	border: none;
	color: rgb(60, 90, 180);
	background-color: rgb(60, 90, 180);
}

.invoice-box table tr.information table td {
	padding-bottom: 0px;
	align-content: center;
}

.set-height td {
	position: relative;
	overflow: hidden;
	height: 2em;
}

.set-height t {
	position: relative;
	overflow: hidden;
	height: 2em;
}

.set-height p {
	position: absolute;
	margin: .1em;
	left: 0;
	top: 0;
}
</style>


</head>
<body>
	<div class="invoice-box">
		<table cellpadding="0" cellspacing="0" width="1000px">

			<tr class="information">
				<td valign="top">
					<table width="100%">
						<tr>
							<td width="200px"><img
								src="${pageContext.request.contextPath}/resources/img/monginislogo.png"
								width="110" height="85" /></td>

							<td width="600px" valign="top"
								style="font-weight: bold; margin: 0px;" align="center">
								<h4 align="center" style="font-size: 20px;">${company.companyName}</h4>
								<h6 style="font-weight: bold; margin: 0px; font-size: 18px;"
									align="center">Delivery & Billing Addr.:
									${company.factoryAdd}</h6>
								<h6 style="font-weight: normal; margin: 0px; font-size: 18px;"
									align="center">CIN NO : ${company.cinNumber}</h6>
							</td>

							<td width="200px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
							</td>

						</tr>

					</table>
				</td>
			</tr>
		</table>
	</div>


	<br>
	<div class="invoice-box">
		<table cellpadding="0" cellspacing="0" width="1000px">

			<tr class="information">
				<td valign="top">
					<table width="1000px">
						<tr>


							<td width="100%"
								style="border-left: 1px solid #313131; border-top: 1px solid #313131; border-bottom: 1px solid #313131; border-right: 1px solid #313131; padding: 8px; color: #000; font-size: 14px;">

								<div class="invoice-box">
									<table cellpadding="0" cellspacing="0" width="1000px">

										<tr class="information">
											<td valign="top">
												<table width="1000px" style="padding-left: 20px;">


													<tr style="height: 40px;">
														<td width="1000px" valign="top" align="center"
															style="font-family: arial; font-weight: bold; font-size: 20px;">
															VENDOR DETAILS</td>

													</tr>
												</table>
												<table width="1000px" style="padding-left: 20px;">


													<tr style="height: 40px;">
														<td width="120px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															Vendor Code</td>

														<td width="880px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															:&nbsp;&nbsp;${vendorDetail.vendorCode}</td>

													</tr>

													<tr style="height: 40px;">
														<td width="180px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															Vendor Name</td>
														<td width="820px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															:&nbsp;&nbsp;${vendorDetail.vendorName}</td>

													</tr>

													<tr style="height: 40px;">
														<td width="120px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															Address</td>

														<td width="880px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															:&nbsp;&nbsp;${vendorDetail.vendorAdd1}</td>

													</tr>

													<tr style="height: 40px;">
														<td width="180px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															City</td>
														<td width="880px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															:&nbsp;&nbsp;${vendorDetail.vendorCity}</td>


													</tr>

													<tr style="height: 40px;">

														<td width="180px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															State</td>

														<td width="880px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															:<c:forEach items="${stateList}" var="stateList">
																<c:choose>
																	<c:when
																		test="${stateList.stateId==vendorDetail.vendorStateId}">&nbsp;&nbsp;${stateList.stateName}
																	</c:when>
																</c:choose>
															</c:forEach>
														</td>

													</tr>


													<tr style="height: 40px;">
														<td width="180px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															Contact Person</td>

														<td width="880px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															:&nbsp;&nbsp;${vendorDetail.vendorContactPerson}</td>

													</tr>

													<tr style="height: 40px;">

														<td width="180px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															Mobile No</td>

														<td width="880px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															:&nbsp;&nbsp;${vendorDetail.vendorMobile}</td>

													</tr>

													<tr style="height: 40px;">
														<td width="180px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															Phone No</td>

														<td width="880px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															:&nbsp;&nbsp;${vendorDetail.vendorPhone}</td>



													</tr>

													<tr style="height: 40px;">

														<td width="180px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															Email</td>

														<td width="880px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															:&nbsp;&nbsp;${vendorDetail.vendorEmail}</td>

													</tr>


													<tr style="height: 40px;">
														<td width="180px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															GST No.</td>

														<td width="880px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															:&nbsp;&nbsp;${vendorDetail.vendorGstNo}</td>


													</tr>

													<tr style="height: 40px;">


														<td width="180px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															PAN No.</td>

														<td width="880px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															:&nbsp;&nbsp;${vendorDetail.vendorAdd4}</td>

													</tr>

													<tr style="height: 40px;">
														<td width="180px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															Item</td>

														<td width="880px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															:&nbsp;&nbsp;${vendorDetail.vendorItem}</td>


													</tr>
													<tr style="height: 40px;">


														<td width="180px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															FSSAI No.</td>

														<td width="880px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															:&nbsp;&nbsp;${vendorDetail.vendorAdd3}</td>

													</tr>


													<tr style="height: 40px;">
														<td width="180px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															Approved BY</td>

														<td width="880px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															:&nbsp;&nbsp;<c:choose>
																<c:when test="${vendorDetail.vendorApprvBy==1}">
										Lutf Foods
									</c:when>
																<c:when test="${vendorDetail.vendorApprvBy==2}">
										Lutf Foods
									</c:when>
																<c:when test="${vendorDetail.vendorApprvBy==3}">
										OTHER
									</c:when>

															</c:choose>
														</td>

													</tr>

													<tr style="height: 40px;">

														<td width="180px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															Type</td>

														<td width="880px" valign="top" align="left"
															style="font-family: arial; font-weight: bold; font-size: 18px;">
															:&nbsp;&nbsp;<c:choose>
																<c:when test="${vendorDetail.vendorType==1}">
									 	Authorized Dealer
									 </c:when>
																<c:when test="${vendorDetail.vendorType==2}">
									 	Authorized Distributors
									 </c:when>
																<c:when test="${vendorDetail.vendorType==3}">
									 	Traders
									 </c:when>
																<c:when test="${vendorDetail.vendorType==4}">
									 	Manufacturer
									 </c:when>
																<c:when test="${vendorDetail.vendorType==5}">
									 	Importer
									 </c:when>

															</c:choose>
														</td>
													</tr>



												</table>
											</td>
										</tr>
									</table>
								</div>
							</td>

						</tr>

					</table>
				</td>
			</tr>
		</table>
	</div>
	<br>
	<table width="100%">


		<tr>
			<td width="25%"><p
					style="color: #000; font-size: 18px; vertical-align: top; text-align: center; margin: 0px; font-weight: bold; font-family: arial;">
					For ${company.companyName} <br> <br> <br> <br>
					Prepared By <br></td>
			<td width="50%"></td>
			<td width="25%">
				<p
					style="color: #000; font-size: 18px; vertical-align: top; text-align: center; margin: 0px; font-weight: bold; font-family: arial;">
					For ${company.companyName} <br> <br> <br> <br>
					Authorised By <br>
					<!-- Shabbir Fatehnagri/Shabbir Kanorewala -->
			</td>
		</tr>


	</table>
	<br>
	<p
		style="color: #000; font-size: 18px; text-align: left; margin: 0px; font-weight: bold;">DOCUMENT
		ATTACHED -</p>
	<p
		style="color: #000; font-size: 18px; text-align: left; margin: 0px; font-weight: bold;">
		1) GST Certificate <br> 2) PAN Card <br> 3) FSSAI
		Certificate <br>

	</p>






</body>
</html>