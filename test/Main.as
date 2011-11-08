package  
{
	import com.boblu.test.LUContainer;
	import com.boblu.test.LURunner;
	import flash.display.Sprite;
	import org.flexunit.runner.FlexUnitCore;
	import utils.TestStageGetter;
	import Suite;
	
	/**
	 * ...
	 * @author Tommislav
	 */
	public class Main extends LUContainer 
	{
		private var _core:FlexUnitCore;
		private var _runner:LURunner;
		private var _suites:Array;
		
		override protected function setup():void 
		{
			TestStageGetter.stage = stage;
		}
		
		override protected function start():void 
		{
			_core = new FlexUnitCore();
			_runner = new LURunner();
			
			_core.addListener( _runner );
			addChild( _runner );
			
			_core.run( Suite );
		}
	}

}