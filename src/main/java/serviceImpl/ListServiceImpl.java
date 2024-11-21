package serviceImpl;

import java.util.List;

import dao.ListDAO;
import dto.ListDTO;
import service.ListService;

public class ListServiceImpl implements ListService {

	private ListDAO dao;

	// 초기화 해야함 ****
	public ListServiceImpl() {
		dao = new ListDAO();
	}

	@Override
	public List<ListDTO> ListAll() {
		return dao.ListAll();
	}

	@Override
	public ListDTO ListOne(int no) {
		return dao.ListOne(no);
	}

	@Override
	public int PlusCount(int no) {
		return dao.PlusCount(no);
	}

}
