package spring.model.memo;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

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

public class MemoDAOTest {

	private static MemoDAO mdao;
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
		mdao = (MemoDAO)beans.getBean("mdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testTotal() {
		assertEquals(mdao.total("title", "수정"),1);
	}

	@Test @Ignore
	public void testUpViewcnt() {
		fail("Not yet implemented");
	}

	@Test 
	public void testDelete() {
		assertTrue(mdao.delete(2301));
	}

	@Test @Ignore
	public void testUpdate() {
		MemoDTO dto = mdao.read(1701);
		dto.setContent("Junit");
		dto.setTitle("Junit");
		assertTrue(mdao.update(dto));
	}

	@Test @Ignore
	public void testRead() {
		mdao.upViewcnt(1701);
		MemoDTO dto = mdao.read(1701);
		assertNotNull(dto);
	}

	@Test @Ignore
	public void testCreate() {
		MemoDTO dto = new MemoDTO();
		dto.setTitle("test1");
		dto.setContent("test1");
		assertTrue(mdao.create(dto));
	}

	@Test @Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		List<MemoDTO> list = mdao.list(map);
		assertEquals(list.size(), 5);
	}

}
