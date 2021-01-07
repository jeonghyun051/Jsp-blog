package com.cos.blog.domain.board.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SaveListDto {

	private int userId;
	private String title;
	private String content;
	private Timestamp createDate;
	
}
