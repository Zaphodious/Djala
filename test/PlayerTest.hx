package ;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import com.blakwurm.djala.Character;


class PlayerTest 
{
	
	
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
	}
	
	@After
	public function tearDown()
	{
	}
	
	@Test
	public function testExample()
	{
		Assert.isTrue(true);
	}

	@Test
	public function testA() {
		var thing = new Character({name: "Herbert"});
		trace(thing);
		Assert.isNotNull(thing);
	}
}