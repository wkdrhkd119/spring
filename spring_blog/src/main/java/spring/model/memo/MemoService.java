package spring.model.memo;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
@Service 
public class MemoService {
       @Autowired
       private MemoDAO dao;
       @Autowired
        private ReplyDAO_memo rdao;
 
      public void delete(int memono) throws Exception{
 
             rdao.bdelete(memono); //자식레코두 댓글들 삭제
             dao.delete(memono);	//전체레코드 댓글을 가진 부모글 삭제
      }
}