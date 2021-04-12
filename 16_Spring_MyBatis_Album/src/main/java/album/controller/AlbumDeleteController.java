package album.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import album.model.AlbumDao;

@Controller
public class AlbumDeleteController {
	
	private final String command = "/delete.ab";
	private final String gotoPage = "redirect:/list.ab";
	
	@Autowired
	private AlbumDao albumDao;
	
// 이 아래 변경함
//@RequestParam을 사용함

	@RequestMapping(command)
	public String doAction(@RequestParam(value="num", required=true) int num,
			@RequestParam(value="pageNumber", required=true) int pageNumber) {
		
		System.out.println("num:" + num);
		System.out.println("pageNumber:" + pageNumber);
		
		albumDao.deleteAlbum(num);
		return gotoPage+"?pageNumber="+pageNumber; // redirect:/list.ab?pageNumber=2
	}
}








