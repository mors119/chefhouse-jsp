package service;

import java.util.List;

import dto.ListDTO;

public interface ListService {
	List<ListDTO> ListAll();

	ListDTO ListOne(int no);

	int PlusCount(int no);
}
