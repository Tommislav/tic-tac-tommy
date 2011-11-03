package 
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import se.salomonsson.ttt.TicTacTommyContext;
	
	/**
	 * ...
	 * @author Tommislav
	 */
	public class Main extends Sprite 
	{
		private var _ticTacTommyContext:TicTacTommyContext;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 	
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			// Here we go...
			_ticTacTommyContext = new TicTacTommyContext(this);
		}
		
	}
	
}