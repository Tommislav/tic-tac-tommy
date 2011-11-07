package se.salomonsson.ttt.controllers 
{
	import flash.geom.Point;
	import org.robotlegs.mvcs.Command;
	import se.salomonsson.ttt.enum.GameState;
	import se.salomonsson.ttt.events.GameEvent;
	import se.salomonsson.ttt.events.RenderGridEvent;
	import se.salomonsson.ttt.model.GameModel;
	import se.salomonsson.ttt.model.GridModel;
	import se.salomonsson.ttt.model.PlayersModel;
	
	/**
	 * This is the command that reacts to the request that a player has made a move.
	 * Will check if it is a valid move, will check if someone won or pass the turn to the next player.
	 * @author Tommislav
	 */
	public class UpdateGridStateCommand extends Command 
	{
		[Inject]
		public var gameModel:GameModel;
		
		[Inject]
		public var gridModel:GridModel;
		
		[Inject]
		public var playerModel:PlayersModel;
		
		[Inject]
		public var event:GameEvent;
		
		
		
		
		override public function execute():void 
		{
			if (event == null)
				throw new Error("Injected gameEvent instance is null...");
			
			// don't accept input if we are in game-over state
			if (gameModel.gameState == GameState.GAME_OVER)
				return;
			
			
			var newPosition:Point = event.cell;
			
			// Make sure it's a valid move
			if (gridModel.isValidMove(newPosition.x, newPosition.y))
			{
				var currentPlayer:int = playerModel.currentPlayerId;
				gridModel.setValue( newPosition.x, newPosition.y, currentPlayer ); // update value on model
				
				// update visual GUI
				dispatch( new GameEvent( GameEvent.REQUEST_GRID_RE_RENDER ) );
				
				
				var win:Boolean = gameModel.gameLogic.checkWin( gridModel.getGridVO() );
				if (win)
				{
					// get the list of cells and highlight them
					//...
					
					gameModel.gameState = GameState.GAME_OVER;
				}
				else
				{
					// new players turn
					playerModel.nextPlayer();
				}
			}
		}
	}
}