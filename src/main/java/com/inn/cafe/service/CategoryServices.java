package com.inn.cafe.service;

import com.inn.cafe.POJO.Category;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface CategoryServices {

   ResponseEntity<String> addNewCategory(Map<String, String> requestMap);

   ResponseEntity<List<Category>> getAllCategory(String filterValue);

   ResponseEntity<String> updateCategory(Map<String, String> requestMap);



}
