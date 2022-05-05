package web.product.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "VALUE")
public class ValueVO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="valueID")
	private Integer valueID;
	
	@Column(name="attrID")
	private Integer attrID;
	
	@Column(name="value")
	private String value;
	
}
