package se.salomonsson.ttt.model 
{
	import org.robotlegs.mvcs.Actor;
	import se.salomonsson.ttt.enum.PlayerType;
	
	/**
	 * Holds and manipulates all the players, both human and computer/ai ones
	 * @author Tommislav
	 */
	public class PlayersModel extends Actor 
	{
		private var _players:Array;
		
		public function PlayersModel() 
		{
			_players = new Array();
		}
		
		public function get numberOfPlayers():int { return _players.length; }
		
		public function addPlayer( name:String, type:PlayerType )
		{
			// ... add a new player to the game and assign a symbol!
		}
	}

}