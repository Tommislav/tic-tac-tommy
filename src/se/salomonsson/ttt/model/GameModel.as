package se.salomonsson.ttt.model 
{
	import org.robotlegs.mvcs.Actor;
	import se.salomonsson.ttt.controllers.gamelogic.IGameLogic;
	import se.salomonsson.ttt.enum.GameState;
	import se.salomonsson.ttt.events.GameEvent;
	/**
	 * General model that holds data about the game/application
	 * @author Tommislav
	 */
	public class GameModel extends Actor
	{
		private var _gameLogic:IGameLogic;
		private var _gameState:GameState
		
		
		public function get gameLogic():IGameLogic { return _gameLogic; }
		public function set gameLogic(value:IGameLogic):void 
		{
			_gameLogic = value;
		}
		
		public function get gameState():GameState { return _gameState; }
		public function set gameState(value:GameState):void 
		{
			_gameState = value;
			dispatch( new GameEvent( GameEvent.GAME_STATE_CHANGED ) );
		}
		
		
	}

}