package web.product.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "ATTRIBUTES")
public class AttributesVO {

	
	@Id
	@Column(name = "attrID")
	private Integer attrID;
	
	@Column(name = "ctgID")
	private Integer ctgID;
	
	@Column(name = "attrName")
	private String attrName;
}
