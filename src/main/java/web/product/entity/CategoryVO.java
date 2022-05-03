package web.product.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@Data
@NoArgsConstructor
@Entity
@Table(name = "CATEGORY")
public class CategoryVO {

	@Id
	@Column(name = "ctgID")
	private Integer ctgID;
	
	@Column(name = "ctgName")
	private String ctgName;
	
}
