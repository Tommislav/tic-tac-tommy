package se.salomonsson.ttt.controllers 
{
	import flash.geom.Point;
	import org.robotlegs.mvcs.Command;
	import se.salomonsson.ttt.events.GameEvent;
	import se.salomonsson.ttt.events.RenderGridEvent;
	import se.salomonsson.ttt.model.GridModel;
	import se.salomonsson.ttt.model.PlayersModel;
	
	/**
	 * ...
	 * @author Tommislav
	 */
	public class UpdateGridStateCommand extends Command 
	{
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
			
			var newPosition:Point = event.cell;
			
			// Make sure it's a valid move
			if (isValidMove(newPosition.x, newPosition.y))
			{
				var currentPlayer:int = playerModel.currentPlayerId;
				gridModel.setValue( newPosition.x, newPosition.y, currentPlayer );
				
				playerModel.nextPlayer();
				
				// update visual GUI
				dispatch( new GameEvent( GameEvent.REQUEST_GRID_RE_RENDER ) );
			}
		}
		
		private function isValidMove(x:int, y:int):Boolean
		{
			var validSpanX:Boolean 		= (x >= 0 || x < gridModel.numberOfCellsHorizontal);
			var validSpanY:Boolean 		= (y >= 0 || y < gridModel.numberOfCellsVertical);
			var cellIsEmpty:Boolean 	= (gridModel.getValue( x, y ) == 0);
			
			return (validSpanX && validSpanY && cellIsEmpty);
		}
	}

}