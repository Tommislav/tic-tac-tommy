package  
{
	import unittest.DummyTest;
	import unittest.se.salomonsson.ttt.controllers.gamelogic.ThreeInARowLogicTest;
	
	/**
	 * ...
	 * @author Tommislav
	 */
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]	
	public class Suite 
	{
		
		public var hamcrestDummyTest:DummyTest;
		
		
		// Test game logic
		public var threeInARowLogic:ThreeInARowLogicTest;
		
	}
	
}