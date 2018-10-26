package com.ats.tril.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.ats.tril.model.Category;
import com.ats.tril.model.GetItem;
import com.ats.tril.model.TaxForm;
import com.ats.tril.model.Vendor;

@Controller
@Scope("session")
public class RmRateVarificationController {
	
	List<GetItem> itemList = new ArrayList<>();
	
	@RequestMapping(value = "/showRmRateVarificationRate", method = RequestMethod.GET)
	public ModelAndView showMrnRpoert(HttpServletRequest request, HttpServletResponse response) {

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
		 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		return taxForm;
	}
	 
	 @RequestMapping(value = "/getVederListByItemId", method = RequestMethod.GET)
		public @ResponseBody TaxForm getVederListByItemId(HttpServletRequest request, HttpServletResponse response) {

			 
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
			 
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
			return taxForm;
		}
	 
}
