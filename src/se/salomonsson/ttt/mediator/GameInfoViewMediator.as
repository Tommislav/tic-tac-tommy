package se.salomonsson.ttt.mediator 
{
	import org.robotlegs.mvcs.Mediator;
	import se.salomonsson.ttt.enum.GameState;
	import se.salomonsson.ttt.events.GameEvent;
	import se.salomonsson.ttt.model.GameModel;
	import se.salomonsson.ttt.model.PlayersModel;
	import se.salomonsson.ttt.view.IGameInfoView;
	import se.salomonsson.ttt.vo.PlayerVO;
	
	/**
	 * Mediates the gameInfoView that displays whos turn it is and if someone has won.
	 * @author Tommislav
	 */
	public class GameInfoViewMediator extends Mediator 
	{
		[Inject]
		public var playerModel:PlayersModel;
		
		[Inject]
		public var gameModel:GameModel;
		
		[Inject]
		public var gameInfoView:IGameInfoView;
		
		override public function onRegister():void 
		{
			
			addContextListener( GameEvent.GAME_STATE_CHANGED, updateGameState );
			addContextListener( GameEvent.PLAYER_TURN_CHANGED, updatePlayerTurn );
			addContextListener( GameEvent.RESET_GAME, onResetGame );
		}
		
		private function onResetGame(e:GameEvent):void 
		{
			//gameInfoView.reset();
		}
		
		private function updateGameState(e:GameEvent):void 
		{
			if (gameModel.gameState == GameState.GAME_OVER)
				gameInfoView.showWinner(playerModel.currentPlayer.name, playerModel.currentPlayer.id);
			
		}
		
		private function updatePlayerTurn(e:GameEvent):void 
		{
			var currentPlayer:PlayerVO = playerModel.currentPlayer;
			gameInfoView.showCurrentPlayer(currentPlayer.name, currentPlayer.id);
		}
	}

}