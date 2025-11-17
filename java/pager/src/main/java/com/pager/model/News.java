package com.pager.model;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class News {
	private long id;
	private String title;
	private String content;
	private LocalDateTime regdate;
	private String category;
}
