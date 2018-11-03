package com.ats.tril.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.tril.common.Constants;
import com.ats.tril.common.DateConvertor;
import com.ats.tril.model.Category;
import com.ats.tril.model.GetItem;
import com.ats.tril.model.GetRmRateVerificationRecord;
import com.ats.tril.model.ItemListByRateVerification;
import com.ats.tril.model.RmRateVerificationList;
import com.ats.tril.model.RmRateVerificationRecord;
import com.ats.tril.model.TaxForm;
import com.ats.tril.model.Vendor;
import com.ats.tril.model.VendorListForRateVarification;

@Controller
@Scope("session")
public class RmRateVarificationController {
	
	List<GetItem> itemList = new ArrayList<>();
	RmRateVerificationList rmRateVerificationList = new RmRateVerificationList();
	

	public static Logger logger = LoggerFactory.getLogger(RmRateVarificationController.class);

	
	@RequestMapping(value = "/showRmRateVarificationRate", method = RequestMethod.GET)
	public ModelAndView showRmRateVarificationRate(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {
			RestTemplate rest = new RestTemplate();
			model = new ModelAndView("rmRateVarification/showRmRateVarificationRate");
			Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
			List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));

			model.addObject("vendorList", vendorList);
			 
			Category[] category = rest.getForObject(Constants.url + "/getAllCategoryByIsUsed", Category[].class);
			List<Category> categoryList = new ArrayList<Category>(Arrays.asList(category)); 
			model.addObject("categoryList", categoryList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/submitRmRateVerification", method = RequestMethod.POST)
	public String submitRmRateVerification(HttpServletRequest request, HttpServletResponse response) {

		RestTemplate rest = new RestTemplate();
		String ret = new String();
		try {
				int itemId = Integer.parseInt(request.getParameter("rm_id"));
				int suppId = Integer.parseInt(request.getParameter("supp_id"));
				String date = request.getParameter("curr_rate_date");
				float currRateTaxExtra = Float.parseFloat(request.getParameter("curr_rate_tax_extra"));
				float currRateTaxIncl = Float.parseFloat(request.getParameter("curr_rate_tax_incl"));
				int groupId = Integer.parseInt(request.getParameter("groupId"));
				int taxId = Integer.parseInt(request.getParameter("tax_id"));
				int isItem = Integer.parseInt(request.getParameter("isItem"));
				
				if(isItem==1) {
					ret="redirect:/showRmRateVarificationRate";
				}
				else {
					ret="redirect:/showRmRateVarificationRateByVendor";
				}
				
				rmRateVerificationList.setDate2(DateConvertor.convertToYMD(rmRateVerificationList.getDate1()));
				rmRateVerificationList.setRate2TaxExtra(rmRateVerificationList.getRate1TaxExtra());
				rmRateVerificationList.setRate2TaxIncl(rmRateVerificationList.getRate1TaxIncl());
				
				rmRateVerificationList.setDate1(DateConvertor.convertToYMD(rmRateVerificationList.getRateDate()));
				rmRateVerificationList.setRate1TaxExtra(rmRateVerificationList.getRateTaxExtra());
				rmRateVerificationList.setRate1TaxIncl(rmRateVerificationList.getRateTaxIncl());
				
				rmRateVerificationList.setRateDate(DateConvertor.convertToYMD(date));
				rmRateVerificationList.setRateTaxExtra(currRateTaxExtra);
				rmRateVerificationList.setRateTaxIncl(currRateTaxIncl);
				rmRateVerificationList.setGrpId(groupId);
				
				rmRateVerificationList.setSuppId(suppId);
				rmRateVerificationList.setRmId(itemId);
				rmRateVerificationList.setTaxId(taxId);
				
				RmRateVerificationList res = rest.postForObject(Constants.url + "/saveRmRateVarification",rmRateVerificationList, RmRateVerificationList.class);
				 
				logger.info("res " + res);
				
				if(res!=null) {
					RmRateVerificationRecord rmRateVerificationRecord = new RmRateVerificationRecord();
					
					rmRateVerificationRecord.setRateDate(DateConvertor.convertToYMD(date));
					rmRateVerificationRecord.setRateTaxExtra(currRateTaxExtra);
					rmRateVerificationRecord.setRateTaxIncl(currRateTaxIncl);
					rmRateVerificationRecord.setSuppId(suppId);
					rmRateVerificationRecord.setRmId(itemId);
					
					RmRateVerificationRecord resp = rest.postForObject(Constants.url + "/saveRateVarificationRecord",rmRateVerificationRecord, RmRateVerificationRecord.class);
					
					logger.info("resp " + resp);
					
				}
	 
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ret;
	}
	
	@RequestMapping(value = "/itemLIstByCatIdForItemVarification", method = RequestMethod.GET)
	public @ResponseBody List<GetItem>  itemLIstByCatIdForItemVarification(HttpServletRequest request, HttpServletResponse response) {

		 itemList = new ArrayList<>();
		try {
			
			int catId = Integer.parseInt(request.getParameter("catId"));
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			RestTemplate rest = new RestTemplate();
			map.add("catId", catId);
			GetItem[] getItem = rest.postForObject(Constants.url + "/itemListByCatId",map, GetItem[].class);
			itemList = new ArrayList<GetItem>(Arrays.asList(getItem));
 
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return itemList;
	}
	
	 @RequestMapping(value = "/getUomTax", method = RequestMethod.GET)
	public @ResponseBody TaxForm getUomTax(HttpServletRequest request, HttpServletResponse response) {

		 
		 TaxForm taxForm = new TaxForm();
		 try {
			 
			 int rmId = Integer.parseInt(request.getParameter("rmId"));
			 GetItem taxId = new GetItem();
			 
		 for(int i = 0 ; i<itemList.size() ; i++ ) {
			 if(itemList.get(i).getItemId()==rmId) {
				 
				 taxId=itemList.get(i);
				 break;
			 }
		 }
		  
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		RestTemplate rest = new RestTemplate();
		map.add("taxId", taxId.getItemIsCapital());
		taxForm = rest.postForObject(Constants.url + "/getTaxFormByTaxId", map, TaxForm.class);
  
		taxForm.setTaxDesc(taxId.getItemUom());
		taxForm.setCreatedIn(taxId.getGrpId());
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		return taxForm;
	}
	 
	 @RequestMapping(value = "/getVederListByItemId", method = RequestMethod.GET)
		public @ResponseBody List<VendorListForRateVarification> getVederListByItemId(HttpServletRequest request, HttpServletResponse response) {

			 
		 List<VendorListForRateVarification> vendorListByItemId = new ArrayList<>();
			 try {
				 
				 int rmId = Integer.parseInt(request.getParameter("rmId"));
				   
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			RestTemplate rest = new RestTemplate();
			map.add("itemId", rmId);
			VendorListForRateVarification[] vendor = rest.postForObject(Constants.url + "/getVendorListByItemIdForRateVerification", map, VendorListForRateVarification[].class);
			vendorListByItemId = new ArrayList<VendorListForRateVarification>(Arrays.asList(vendor));
			
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
			return vendorListByItemId;
		}
	 
	 @RequestMapping(value = "/getRmRateVerification", method = RequestMethod.GET)
		public @ResponseBody RmRateVerificationList getRmRateVerification(HttpServletRequest request, HttpServletResponse response) {

			 
		  rmRateVerificationList = new RmRateVerificationList();
			 try {
				 
				 int rmId = Integer.parseInt(request.getParameter("rm_id"));
				 int suppId = Integer.parseInt(request.getParameter("supp_id")); 
				 
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			RestTemplate rest = new RestTemplate();
			map.add("itemId", rmId);
			map.add("vendId", suppId);
			
			 rmRateVerificationList = rest.postForObject(Constants.url + "/rmVarificationListByItemIdAndVendId", map, RmRateVerificationList.class);
			 
			 System.out.println(rmRateVerificationList);
			 }catch(Exception e) {
				 e.printStackTrace();
				 rmRateVerificationList = new RmRateVerificationList();
			 }
			return rmRateVerificationList;
		}
	 
	 @RequestMapping(value = "/showRmRateVarificationRecordList", method = RequestMethod.GET)
		public ModelAndView showRmRateVarificationRecordList(HttpServletRequest request, HttpServletResponse response) {

			ModelAndView model = null;
			try {
				RestTemplate rest = new RestTemplate();
				model = new ModelAndView("rmRateVarification/showRmRateVarificationRecord");
				Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
				List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));

				model.addObject("vendorList", vendorList);
				 
				GetItem[] item = rest.getForObject(Constants.url + "/getAllItems",  GetItem[].class); 
				List<GetItem> itemList = new ArrayList<GetItem>(Arrays.asList(item));
				model.addObject("itemList", itemList);
				
				if(request.getParameter("fromDate")!=null && request.getParameter("toDate")!=null) {
					
					MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,Object>();
					String fromDate = request.getParameter("fromDate");
					String toDate = request.getParameter("toDate");
					int itemId = Integer.parseInt(request.getParameter("itemId"));
					int vendId = Integer.parseInt(request.getParameter("vendId"));
					
					map.add("fromDate", DateConvertor.convertToYMD(fromDate));
					map.add("toDate", DateConvertor.convertToYMD(toDate));
					map.add("itemId", itemId);
					map.add("vendId", vendId);
					
					GetRmRateVerificationRecord[] getRmRateVerificationRecord = rest.postForObject(Constants.url + "/getRateVerificationRecordListDateWise",map,  GetRmRateVerificationRecord[].class); 
					List<GetRmRateVerificationRecord> getRmRateVerificationRecordList = new ArrayList<GetRmRateVerificationRecord>(Arrays.asList(getRmRateVerificationRecord));
					model.addObject("getRmRateVerificationRecordList", getRmRateVerificationRecordList);
					
					model.addObject("fromDate", fromDate);
					model.addObject("toDate", toDate);
					model.addObject("itemId", itemId);
					model.addObject("vendId", vendId);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}

			return model;
		}
	 
	 @RequestMapping(value = "/showRmRateVarificationRateByVendor", method = RequestMethod.GET)
		public ModelAndView showRmRateVarificationRateByVendor(HttpServletRequest request, HttpServletResponse response) {

			ModelAndView model = null;
			try {
				RestTemplate rest = new RestTemplate();
				model = new ModelAndView("rmRateVarification/showRmRateVarificationRateByVendor");
				Vendor[] vendorRes = rest.getForObject(Constants.url + "/getAllVendorByIsUsed", Vendor[].class);
				List<Vendor> vendorList = new ArrayList<Vendor>(Arrays.asList(vendorRes));

				model.addObject("vendorList", vendorList);
				 
				Category[] category = rest.getForObject(Constants.url + "/getAllCategoryByIsUsed", Category[].class);
				List<Category> categoryList = new ArrayList<Category>(Arrays.asList(category)); 
				model.addObject("categoryList", categoryList);
				
			} catch (Exception e) {
				e.printStackTrace();
			}

			return model;
		}
	 
	 @RequestMapping(value = "/getItemListByVendId", method = RequestMethod.GET)
		public @ResponseBody List<ItemListByRateVerification> getItemListByVendId(HttpServletRequest request, HttpServletResponse response) {

			 
		 List<ItemListByRateVerification> ItemListByVendId = new ArrayList<>();
			 try {
				 
				 int suppId = Integer.parseInt(request.getParameter("suppId"));
				   
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			RestTemplate rest = new RestTemplate();
			map.add("vendId", suppId);
			ItemListByRateVerification[] vendor = rest.postForObject(Constants.url + "/getItemListByVendId", map, ItemListByRateVerification[].class);
			ItemListByVendId = new ArrayList<ItemListByRateVerification>(Arrays.asList(vendor));
			
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
			return ItemListByVendId;
		}
	 
}
