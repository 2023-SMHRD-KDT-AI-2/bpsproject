package com.moon.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class message {

	
	private String sender;
	private String receiver;
	private String content;

	
}
