package com.lost.webApp.controller;

import com.lost.webApp.model.Product;
import com.lost.webApp.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/products")
public class ProductController {

	private ProductService service;

	@GetMapping()
	public List<Product> getProducts() {
		return service.getProducts();
	}

	@GetMapping("/{id}")
	public Product getProductById(@PathVariable int id) {
		return service.getProduct(id);
	}

	@PostMapping()
	public void addProduct(@RequestBody Product product) {
		service.addProduct(product);
	}

	@PutMapping()
	public void updateProduct(@RequestBody Product product) {
		service.updateProduct(product);
	}

	@DeleteMapping("/{productId}")
	public void deleteProduct(@PathVariable int productId) {
		service.deleteProduct(productId);
	}

	@Autowired
	public void setService(ProductService service) {
		this.service = service;
	}

}
