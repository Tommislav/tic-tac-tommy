package se.salomonsson.ttt.model 
{
	import org.robotlegs.mvcs.Actor;
	import se.salomonsson.ttt.enums.PlayerType;
	import se.salomonsson.ttt.events.GameEvent;
	import se.salomonsson.ttt.vo.PlayerVO;
	
	/**
	 * Holds and manipulates all the players, both human and computer/ai ones
	 * @author Tommislav
	 */
	public class PlayersModel extends Actor 
	{
		private var _players:Vector.<PlayerVO>;
		private var _currentPlayer:int;
		
		public function PlayersModel() 
		{
			_players = new Vector.<PlayerVO>();
		}
		
		public function get numberOfPlayers():int 		{ return _players.length; }
		public function get currentPlayer():PlayerVO 	{ return _players[_currentPlayer]; }
		public function get currentPlayerId():int 		{ return _players[_currentPlayer].id; }
		
		public function nextPlayer():void
		{
			_currentPlayer++;
			if (_currentPlayer >= _players.length)
				_currentPlayer = 0;
			
			dispatch( new GameEvent(GameEvent.PLAYER_TURN_CHANGED) );
		}
		
		public function setCurrentPlayerIndex(index:int):void 
		{ 
			_currentPlayer = index; 
			dispatch( new GameEvent(GameEvent.PLAYER_TURN_CHANGED) );
		}
		
		public function addPlayer( name:String, type:PlayerType ):void
		{
			var vo:PlayerVO = new PlayerVO();
			vo.name = name;
			vo.type = type;
			vo.id = _players.length + 1;
			
			_players.push(vo);
		}
		
		public function clearPlayers():void { _players = new Vector.<PlayerVO>(); }
	}

}