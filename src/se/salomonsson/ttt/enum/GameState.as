package se.salomonsson.ttt.enum 
{
	
	/**
	 * <p>Enumeration class.</p>
	 * <p>Describes the different types of players that exist. Either a human or the computer.</p>
	 * @author Tommislav
	 */
	public class GameState 
	{
		
		/** Game is running normally */
		public static const RUNNING:GameState = makeEnum("running");
		
		/** Computer AI is thinking, do not allow input */
		public static const THINKING:GameState = makeEnum("thinking");
		
		/** Someone has won, allow no input */
		public static const GAME_OVER:GameState = makeEnum("game_over");
		
		
		
		
		private static var _locked:Boolean = true;
		private static function makeEnum( enum:String ):GameState
		{
			_locked = false;
			var value:GameState = new GameState( enum );
			_locked = true;
			return value;
		}
		
		
		private var _enumeration:String;
		public function GameState(enumeration:String) 
		{
			
			if (_locked)
				throw new Error( "This is an enumeration, use of 'new' is not allowed" );
			
			_enumeration = enumeration;
		}
		
		public function toString():String
		{
			return _enumeration;
		}
		
		public function valueOf():Object
		{
			return this;
		}
		
	}
	
}