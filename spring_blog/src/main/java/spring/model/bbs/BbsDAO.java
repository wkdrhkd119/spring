package spring.model.bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BbsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Map pageRead(int bbsno){
		return sqlSession.selectOne("bbs.pageRead", bbsno);
	}
	
	//Test하기 위해서 set만 설정해준다.(생성자를 통해서 하기 때문에)
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public boolean checkRefno(int bbsno){
		boolean flag = false;
		int cnt = sqlSession.selectOne("bbs.checkRefno", bbsno);
		if(cnt>0) flag=true;
		return flag;
	}
	
	public int total(String col, String word){
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		
		return sqlSession.selectOne("bbs.total", map);
	}
	
	public void upAnsnum(Map map){
		sqlSession.update("bbs.upAnsnum", map);
	}
	
	
	public boolean createReply(BbsDTO dto){
		boolean flag = false;
		int cnt = sqlSession.insert("bbs.createReply", dto);
		if(cnt>0) flag=true;
		return flag;
	}
	
	
	public BbsDTO readReply(int bbsno){
		return sqlSession.selectOne("bbs.readReply", bbsno);
	}
	
	public boolean delete(int bbsno){
		boolean flag = false;
		int cnt = sqlSession.delete("bbs.delete", bbsno);
		if(cnt>0) flag=true;
		return flag;
	}
	
	
	public boolean update(BbsDTO dto){
		boolean flag = false;
		int cnt = sqlSession.update("bbs.update", dto);
		if(cnt>0) flag=true;
		return flag;
	}
	
	public boolean passCheck(Map map){
		boolean flag = false;
		int cnt = sqlSession.selectOne("bbs.passCheck", map);
		if(cnt>0) flag=true;
		return flag;
	}
	
	
	public BbsDTO read(int bbsno){
		return sqlSession.selectOne("bbs.read", bbsno);
	}
	
	public void upViewcnt(int bbsno){
		sqlSession.update("bbs.upViewcnt", bbsno);
	}
	
	
	public List<BbsDTO> list(Map map){
		return sqlSession.selectList("bbs.list", map);
	}
	
	
	public boolean create(BbsDTO dto){
		boolean flag = false;
		int cnt = sqlSession.insert("bbs.create", dto);
		if(cnt>0) flag=true;
		return flag;
	}

}
