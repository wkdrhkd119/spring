package spring.model.bbs;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class BbsDAOTest {

	private static BbsDAO bdao;
	private static BeanFactory beans;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("blog.xml");
		beans = new XmlBeanFactory(resource);
		
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		bdao = (BbsDAO)beans.getBean("bdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore 
	public void testCheckRefno() {
		int bbsno = 3;
		assertTrue(bdao.checkRefno(bbsno));
	}

	@Test @Ignore
	public void testTotal() {
		assertEquals(bdao.total("wname", "Junit"),1); //1은 이름의 갯수
		//assertEquals(bdao.total("", ""),6);
		
	}

	@Test @Ignore
	public void testUpAnsnum() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testCreateReply() {
		BbsDTO dto = bdao.readReply(3);
		dto.setTitle("TEst");
		dto.setContent("Junit");
		dto.setWname("Junit");
		dto.setPasswd("123");
		dto.setFilename("Junit");
		dto.setFilesize(50);
		Map map = new HashMap();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());
		bdao.upAnsnum(map);
		assertTrue(bdao.createReply(dto));
	}

	@Test @Ignore
	public void testReadReply() {
		BbsDTO dto = bdao.readReply(3);
		assertEquals(dto.getGrpno(), 3);
		assertEquals(dto.getIndent(), 0);
		assertEquals(dto.getAnsnum(), 0);
		assertEquals(dto.getTitle(), "test");
	}

	@Test @Ignore
	public void testDelete() {
		assertTrue(bdao.delete(2));
	}

	@Test @Ignore
	public void testUpdate() {
		BbsDTO dto = new BbsDTO();
		dto.setBbsno(1);
		dto.setWname("test1");
		dto.setTitle("test1");
		dto.setContent("test1");
		dto.setFilename("test1");
		dto.setFilesize(200);
		assertTrue(bdao.update(dto));
	}

	@Test @Ignore
	public void testPassCheck() {
		Map map = new HashMap();
		map.put("bbsno", 2);
		map.put("passwd", "123");
		assertTrue(bdao.passCheck(map));
	}

	@Test @Ignore
	public void testRead() {
		bdao.upViewcnt(3);
		BbsDTO dto = bdao.read(3);
		assertNotNull(dto);
	}

	@Test @Ignore
	public void testUpViewcnt() {
		fail("Not yet implemented");
	}

	public void testList() {
		Map map = new HashMap();
		map.put("sno", 1);
		map.put("eno", 5);
		map.put("col", "");
		map.put("word", "");
		List<BbsDTO> list = bdao.list(map);
		assertEquals(list.size(), 4);
	}

	@Test @Ignore
	public void testCreate() {
		BbsDTO dto = new BbsDTO();
		dto.setWname("user2");
		dto.setTitle("test");
		dto.setPasswd("123");
		dto.setContent("test");
		dto.setFilename("test.jpg");
		dto.setFilesize(100);
		assertTrue(bdao.create(dto));
	}

}
