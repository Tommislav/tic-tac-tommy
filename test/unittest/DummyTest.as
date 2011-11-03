package unittest
{
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.array;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.collection.hasItem;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.text.containsString;
	import org.hamcrest.text.endsWith;
	import org.hamcrest.text.startsWith;
	/**
	 * Some stupid tests of hamcrest showing simple testing techniques
	 * @author Tommislav
	 */
	public class DummyTest 
	{
		[Test]
		public function testValueEquals():void
		{
			// Note that YOU NEED TO USE equalTo to match if two values are the same!!!
			
			// This only fails if the last value evaluates to false, so this will pass!
			assertThat(1, 2);
			
			// ALWAYS use this syntax instead
			assertThat(1, equalTo(1));
		}
		
		[Test]
		public function testStupidTestsWithString():void
		{
			// Some string operation tests using hamcrest
			assertThat("sträng", startsWith("strä"));
			assertThat("sträng", endsWith("äng"));
			assertThat("sträng", containsString("trä"));
			assertThat("sträng", not(containsString("tommy")));
		}
		
		[Test]
		public function testStupidTestsWithArrays():void
		{
			// Use org.hamcrest.collection when testing against arrays since it will give you a much better description
			// of what went wrong in case of errors
			assertThat(["1", "2", "3"], array("1", "2", "3"));
			assertThat(["1", "2", "3"], hasItem("2"));
			assertThat(["1", "2", "3"], arrayWithSize(3));
		}
	}

}