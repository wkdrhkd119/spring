package spring.model.bbs;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
@Service 
public class BbsService {
       @Autowired
       private BbsDAO dao;
       @Autowired
        private ReplyDAO rdao;
 
      public void delete(int bbsno) throws Exception{
 
             rdao.bdelete(bbsno); //자식레코두 댓글들 삭제
             dao.delete(bbsno);	//전체레코드 댓글을 가진 부모글 삭제
      }
}