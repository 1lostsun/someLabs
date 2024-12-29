package com.lost.webApp.service;

import com.lost.webApp.model.Product;
import com.lost.webApp.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

	private ProductRepository productRepository;

	public List<Product> getProducts() {
		return productRepository.findAll();
	}

	public Product getProduct(int productId) {
		return productRepository.findById(productId).orElse(null);
	}

	public void addProduct(Product product) {
		productRepository.save(product);
	}

	public void updateProduct(Product product) {
		productRepository.save(product);
	}

	public void deleteProduct(int productId) {
		productRepository.deleteById(productId);
	}

	@Autowired
	public void setProductRepository(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}
}
