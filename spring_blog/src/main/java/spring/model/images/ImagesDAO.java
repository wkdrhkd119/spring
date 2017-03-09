package spring.model.images;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.utility.blog.DBClose;
import spring.utility.blog.DBOpen;
@Repository
public class ImagesDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Map imgRead(int no){
		return sqlSession.selectOne("images.imgRead", no);
	}
	
	
	/**
	 * 부모글인지 확인
	 * 부모글이면 삭제 못함
	 * @param imagesDTO 삭제 하려고 하는 글 번호
	 * @return true=부모글 번호, false=부모글 번호 아님.
	 */
	public boolean checkRefno(int no){
		boolean flag = false;
		int cnt = sqlSession.selectOne("images.checkRefno", no);
		if(cnt>0) flag=true;
		return flag;
	}
	
	public int total(String col, String word) {
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		return sqlSession.selectOne("images.total", map);
		}

	public void upAnsnum(Map map){
		sqlSession.selectOne("images.upAnsnum", map);
	}
	
	public boolean createReply(ImagesDTO dto){
		boolean flag = false;
		int cnt = sqlSession.insert("images.createReply", dto);
		if(cnt>0) flag=true;
		return flag;

	}
	public ImagesDTO readReply(int no){
		return sqlSession.selectOne("images.readReply", no);
	}
	
	public boolean delete(int no){
		boolean flag = false;
		int cnt = sqlSession.delete("images.delete", no);
		if(cnt>0) flag=true;
		return flag;
		}
	
	public boolean update(ImagesDTO dto) {
		boolean flag = false;
		int cnt = sqlSession.update("images.update", dto);
		if(cnt>0) flag=true;
		return flag;
		}
	
	public boolean passCheck(Map map){
		boolean flag = false; 
		int cnt = sqlSession.selectOne("images.passCheck", map);
		if(cnt>0) flag=true;
		return flag;
		}
	
	public ImagesDTO read(int no){
		return sqlSession.selectOne("images.read", no);
	}
	
	public void upViewcnt(int no){
		sqlSession.update("images.upViewcnt", no);
	}
		
	public List<ImagesDTO> list(Map map) {
		return sqlSession.selectList("images.list", map);

		}

	public boolean create(ImagesDTO dto) {
		boolean flag = false;
		int cnt = sqlSession.insert("images.create", dto);
		if(cnt>0) flag=true;
		return flag;
		}

}