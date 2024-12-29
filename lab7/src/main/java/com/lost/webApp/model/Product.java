package com.lost.webApp.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;


@RequiredArgsConstructor
@Setter
@Getter
@Component
@Entity
@Table(name = "products", schema = "public")
public class Product {

	@Id
	@Column(name = "productid")
	private int productId;

	@Column(name = "productname")
	private String productName;

	@Column(name = "productprice")
	private int productPrice;

	public Product(int productId, String productName, int productPrice) {
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
	}

}
