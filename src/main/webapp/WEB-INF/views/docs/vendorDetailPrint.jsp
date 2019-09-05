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
					<table width="1000px">
						<tr>
							<td width="200px" valign="top" align="center"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
							</td>
							<td width="600px" valign="top" align="center"
								style="font-family: arial; font-weight: bold; font-size: 95%;">Vendor
								Details</td>
							<td width="200px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

	<div class="invoice-box">
		<table cellpadding="0" cellspacing="0" width="1000px">

			<tr class="information">
				<td valign="top">
					<table width="1000px">
						<tr>
							<td width="120px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								Vendor Code</td>

							<td width="880px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								:&nbsp;&nbsp;${vendorDetail.vendorCode}</td>

						</tr>

						<tr>
							<td width="180px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								Vendor Name</td>
							<td width="820px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								:&nbsp;&nbsp;${vendorDetail.vendorName}</td>

						</tr>

						<tr>
							<td width="120px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								Address</td>

							<td width="880px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								:&nbsp;&nbsp;${vendorDetail.vendorAdd1}</td>

						</tr>

						<tr>
							<td width="120px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								City</td>
							<td width="380px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								:&nbsp;&nbsp;${vendorDetail.vendorCity}</td>

							<td width="120px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								State</td>

							<td width="380px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								:<c:forEach items="${stateList}" var="stateList">
									<c:choose>
										<c:when
											test="${stateList.stateId==vendorDetail.vendorStateId}">&nbsp;&nbsp;${stateList.stateName}
											</c:when>
									</c:choose>
								</c:forEach>
							</td>

						</tr>


						<tr>
							<td width="120px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								Contact Person</td>

							<td width="380px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								:&nbsp;&nbsp;${vendorDetail.vendorContactPerson}</td>

							<td width="120px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								Mobile No</td>

							<td width="380px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								:&nbsp;&nbsp;${vendorDetail.vendorMobile}</td>

						</tr>



						<tr>
							<td width="120px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								Phone No</td>

							<td width="380px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								:&nbsp;&nbsp;${vendorDetail.vendorPhone}</td>

							<td width="120px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								Email</td>

							<td width="380px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								:&nbsp;&nbsp;${vendorDetail.vendorEmail}</td>

						</tr>


						<tr>
							<td width="120px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								GST No.</td>

							<td width="380px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								:&nbsp;&nbsp;${vendorDetail.vendorGstNo}</td>

							<td width="120px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								PAN No.</td>

							<td width="380px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								:&nbsp;&nbsp;${vendorDetail.vendorAdd4}</td>

						</tr>

						<tr>
							<td width="120px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								Item</td>

							<td width="880px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								:&nbsp;&nbsp;${vendorDetail.vendorItem}</td>

							<td width="380px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								FSSI No.</td>

							<td width="380px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								:&nbsp;&nbsp;${vendorDetail.vendorAdd3}</td>

						</tr>



						<tr>
							<td width="120px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								Approved BY</td>

							<td width="380px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								:&nbsp;&nbsp;<c:choose>
									<c:when test="${vendorDetail.vendorApprvBy==1}">
										TRIL
									</c:when>
									<c:when test="${vendorDetail.vendorApprvBy==2}">
										CEAT
									</c:when>
									<c:when test="${vendorDetail.vendorApprvBy==3}">
										OTHER
									</c:when>

								</c:choose>
							</td>
							<td width="120px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
								Type</td>

							<td width="380px" valign="top" align="left"
								style="font-family: arial; font-weight: bold; font-size: 95%;">
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



	<br>


</body>
</html>