package album.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

/*AlbumDao myAlbumDao = new AlbumDao();*/
@Component("myAlbumDao")
public class AlbumDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate ;
	
	public AlbumDao() {
		System.out.println("AlbumDao()");
	}

	public List<AlbumBean> getAlbumList(Paging pageInfo, Map<String,String> map) {
		
		List<AlbumBean> lists = new ArrayList<AlbumBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit()); // 1페이지:0,2  2페이지:2,2  2페이지:4,2       
		lists = sqlSessionTemplate.selectList("album.AlbumBean.GetAlbumList",map,rowBounds); // namespace안의 id
		System.out.println("lists.size():"+lists.size());
		return lists;
	}
	public int getTotalCount(Map<String,String> map){
		int cnt = sqlSessionTemplate.selectOne("album.AlbumBean.GetTotalCount",map);
		return cnt;
	}

	public int insertAlbum(AlbumBean album) {
		int cnt = sqlSessionTemplate.insert("album.AlbumBean.InsertAlbum",album);
		System.out.println("insertAlbum cnt:" + cnt);
		return cnt;
	}

	public int deleteAlbum(int num) {
		int cnt = sqlSessionTemplate.delete("album.AlbumBean.DeleteAlbum",num);
		return cnt;
	}

	public AlbumBean getAlbum(int num) {
		AlbumBean bean = sqlSessionTemplate.selectOne("album.AlbumBean.GetAlbum",num);
		return bean;
	}

	public int updateAlbum(AlbumBean album) {
		int cnt = sqlSessionTemplate.update("album.AlbumBean.UpdateAlbum",album);
		return cnt;
	}
}







