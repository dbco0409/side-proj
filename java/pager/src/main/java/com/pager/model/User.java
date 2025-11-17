package com.pager.model;

import lombok.Data;

@Data
public class User {
	private Long id;
    private String mbId;
    private String mbPassword;
    private String mbName;
    private String joinDate;
    private String recentDate;
    private String hashYN;
}
