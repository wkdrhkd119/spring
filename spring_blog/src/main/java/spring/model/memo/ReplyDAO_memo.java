package spring.model.memo;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.iReplyDAO;

@Repository
public class ReplyDAO_memo implements iReplyDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public int rcount(int memono){
		return sqlSessionTemplate.selectOne("replyMemo.rcount", memono);
	}
		
	public boolean create(ReplyDTO_memo dto) {
		boolean flag = false;

		int cnt = (Integer) sqlSessionTemplate.insert("replyMemo.create", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	public ReplyDTO_memo read(int rnum) {

		return (ReplyDTO_memo) sqlSessionTemplate.selectOne("replyMemo.read", rnum);

	}

	public boolean update(ReplyDTO_memo dto) {
		boolean flag = false;

		int cnt = sqlSessionTemplate.update("replyMemo.update", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	public List<ReplyDTO_memo> list(Map map) {

		return sqlSessionTemplate.selectList("replyMemo.list", map);
	}

	public int total(int memono) {
		return (Integer) sqlSessionTemplate.selectOne("replyMemo.total", memono);
	}

	public boolean delete(int rnum) {
		boolean flag = false;
		int cnt = sqlSessionTemplate.delete("replyMemo.delete", rnum);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	/** 하나의 글의 여러댓글들 삭제 */ //글 삭제할 때 댓글도 같이 삭제 사용
	public int bdelete(int memono) throws Exception {
		return sqlSessionTemplate.delete("replyMemo.mdelete", memono);

	}
}