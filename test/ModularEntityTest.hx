package ;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import com.blakwurm.ModularEntity;
import DataClass;


class ModularEntityTest 
{
	
	var testEntity : ModularEntity;

	public function new() 
	{
		
	}
	
	@BeforeClass
	public function beforeClass()
	{
	}
	
	@AfterClass
	public function afterClass()
	{
	}
	
	@Before
	public function setup()
	{
		testEntity = new ModularEntity({name: "TestEntity", id: "123456789"});
	}
	
	@After
	public function tearDown()
	{
	}
	
	@Test
	public function testExample()
	{
		var testA = new TestA({name: "Fern"});
		testEntity.set(TestA, testA);
		Assert.areEqual(testA, testEntity.get(TestA));
	}
}

class TestA implements DataClass {
	public var name: String;
}