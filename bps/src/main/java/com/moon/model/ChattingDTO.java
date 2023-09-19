package com.moon.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChattingDTO {

	
	private String company;
	private String chat_id;
	private String host_email;
	private String host_email_sub;
	private String host_name;
	private String send_mes;
	private String guest_email;
	private String guest_email_sub;
	private String guest_name; 
	private String res_mes;
	private String sendtime;
	
}
