package ;

import massive.munit.Assert;

using haxe.Json;

using com.blakwurm.ModularEntity;
using dataclass.JsonConverter;
using com.blakwurm.DataClassExt;


class ModularEntityTest 
{
	
	var testEntity : ModularEntity;

	public function new() {}
	
	@BeforeClass
	public function beforeClass() {}
	
	@AfterClass
	public function afterClass() {}
	
	@Before
	public function setup() {
		testEntity = new ModularEntity({name: "TestEntity"});
	}
	
	@After
	public function tearDown() {}
	
	@Test
	public function putsAndGets() {
		var testA = new TestA({name: "Fern"});
		testEntity.set(TestA, testA);
		Assert.areEqual(testA, testEntity.get(TestA));
	}

	@Test
	public function replaces() {
		var testB1 = new TestB({name: "dinghow", tess: 12345, krak: true});
		var testB2 = testB1.copy();
		testB2.name = "Xing";

		Assert.areNotEqual(testB1, testB2);

		testEntity.set(TestB, testB1);

		Assert.areEqual(testB1, testEntity.get(TestB));
		
		testEntity.set(TestB, testB2);

		Assert.areNotEqual(testB1, testEntity.get(TestB));
	}

	@Test
	public function isTypeSafe() {
		var testA1 = new TestA({name: "thingA"});
		var testB1 = new TestB({name: "dinghow", tess: 12345, krak: true});

		testEntity.set(TestA, testA1).set(TestB, testB1);

		var testA2 : TestA = testEntity.get(TestA);
		var testB2 : TestB = testEntity.get(TestB);

		Assert.areEqual(testA1, testA2);
		Assert.areEqual(testB1, testB2);

	}

	@Test
	public function handlesNull() {
		Assert.isNull(testEntity.get(TestNeverUsed));
	}

	@Test
	public function removes() {
		var testA = new TestA({name: "Hello World"});
		testEntity.set(TestA, testA);
		Assert.areEqual(testA, testEntity.get(TestA));

		testEntity.remove(TestA);
		Assert.isNull(testEntity.get(TestA));
	}

	/* @Test
	public function copies() {
		var testA1 = new TestA({name: "thingA"});

		trace("test a1 " + testA1);
		testEntity.set(TestA, testA1);

		trace("TestEntity is " + testEntity);
		var anotherTestEntity = testEntity.copy();

		trace("New Test Entity is " + anotherTestEntity);
		Assert.areNotEqual(testEntity, anotherTestEntity);
	} */

	@Test
	public function roundTripsWithJson() {
		var newJson = testEntity.toJson().stringify();

		trace(newJson);

		var newEntity = ModularEntity.fromJson(newJson.parse());

		Assert.areNotEqual(testEntity, newEntity);
	}

	@Test
	public function copiesCleanly() {
		var newEntity = testEntity.copy();
		Assert.areNotEqual(testEntity, newEntity);
		Assert.areEqual(newEntity.name, testEntity.name);

		var testA = new TestA({name: "Farfo"});
		testEntity.set(TestA, testA);
		Assert.areEqual(testEntity.get(TestA), testA);
		Assert.isNull(newEntity.get(TestA));
	}
}

class TestA implements Module {
	public var name: String;
}

class TestB implements Module {
	public var tess: Int;
	public var name: String;
	public var krak: Bool;
}

class TestNeverUsed implements Module {
	public var name: String;
}