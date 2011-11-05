package se.salomonsson.ttt.controllers 
{
	import flash.geom.Point;
	import org.robotlegs.mvcs.Command;
	import se.salomonsson.ttt.events.GameEvent;
	import se.salomonsson.ttt.events.RenderGridEvent;
	import se.salomonsson.ttt.model.GridModel;
	
	/**
	 * ...
	 * @author Tommislav
	 */
	public class UpdateGridStateCommand extends Command 
	{
		[Inject]
		public var gridModel:GridModel;
		
		[Inject]
		public var event:GameEvent;
		
		override public function execute():void 
		{
			if (event == null)
				throw new Error("Injected gameEvent instance is null...");
			
			var newPosition:Point = event.cell;
			
			// Make sure it's a valid move
			if (newPosition.x < 0 || newPosition.x >= gridModel.numberOfCellsHorizontal || 
				newPosition.y < 0 || newPosition.y >= gridModel.numberOfCellsVertical ||
				gridModel.getValue( newPosition.x, newPosition.y ) != 0)
			{
				// invalid move, quit!
				return;
			}
			
			gridModel.setValue( newPosition.x, newPosition.y, 1 );
			
			// update visual GUI
			dispatch( new GameEvent( GameEvent.REQUEST_GRID_RE_RENDER ) );
		}
	}

}