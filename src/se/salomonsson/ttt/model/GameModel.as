package se.salomonsson.ttt.model 
{
	import se.salomonsson.ttt.controllers.gamelogic.IGameLogic;
	/**
	 * General model that holds data about the game/application
	 * @author Tommislav
	 */
	public class GameModel 
	{
		private var _screen:String;
		private var _gameLogic:IGameLogic;
		
		public function get screen():String { return _screen; }
		public function set screen(value:String):void 
		{
			_screen = value;
		}
		
		public function get gameLogic():IGameLogic { return _gameLogic; }
		public function set gameLogic(value:IGameLogic):void 
		{
			_gameLogic = value;
		}
	}

}