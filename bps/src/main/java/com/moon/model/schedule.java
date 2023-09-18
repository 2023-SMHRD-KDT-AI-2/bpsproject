package com.moon.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class schedule {
	private int id;
	private String department;
	private String name;
	private String employee_id;
	private String title;
	private String detail;
	private String add_date;
}
