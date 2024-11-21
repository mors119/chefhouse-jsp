package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class ListDTO {
	private int no;
	private String title;
	private String writer;
	private String date;
	private String content;
	private int count;
	private int prev;
	private int next;
	private String prevTitle;
	private String nextTitle;
}
