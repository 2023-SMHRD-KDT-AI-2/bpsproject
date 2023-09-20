package com.moon.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeBoard {
	
	private String board_id;
    private String board_title;
    private String userid;
    private String board_date;
    private String board_content;
    private String company_num;// String
    private String notice_check;
    private String noti;

}
