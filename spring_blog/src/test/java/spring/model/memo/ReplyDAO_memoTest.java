package spring.model.memo;

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

public class ReplyDAO_memoTest {
	
	private static ReplyDAO_memo mrdao;
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
		mrdao = (ReplyDAO_memo)beans.getBean("mrdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testRcount() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testCreate() {
		ReplyDTO_memo dto = new ReplyDTO_memo();
		dto.setMemono(1702);
		dto.setContent("test");
		dto.setId("teset");
		assertTrue(mrdao.create(dto));
	}

	@Test @Ignore
	public void testRead() {
		ReplyDTO_memo dto = mrdao.read(5);
		assertNotNull(dto);
	}

	@Test @Ignore
	public void testUpdate() {
		ReplyDTO_memo dto = new ReplyDTO_memo();
		dto.setRnum(3);
		dto.setContent("teset");
		assertTrue(mrdao.update(dto));
	}

	@Test @Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("memono", 1901);
		map.put("sno", 1);
		map.put("eno", 5);
		List<ReplyDTO_memo> list = mrdao.list(map);
		assertEquals(list.size(), 1);
	}

	@Test 
	public void testTotal() {
		int memono = 2102;
		int cnt = mrdao.total(memono);
		assertEquals(cnt, 1);
	}

	@Test @Ignore
	public void testDelete() {
		assertTrue(mrdao.delete(3));
	}

	@Test @Ignore
	public void testBdelete() throws Exception {
		int memono = 2304;
		assertEquals(mrdao.bdelete(memono),0);
	}

}
