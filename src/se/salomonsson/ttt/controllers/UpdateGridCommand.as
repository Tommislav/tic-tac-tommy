package se.salomonsson.ttt.controllers 
{
	import org.robotlegs.mvcs.Command;
	import se.salomonsson.ttt.events.RenderGridEvent;
	import se.salomonsson.ttt.model.GridModel;
	import se.salomonsson.ttt.vo.GridVO;
	
	/**
	 * Command that will fetch the current layout of the grid and dispatch a redraw-grid event
	 * @author Tommislav
	 */
	public class UpdateGridCommand extends Command 
	{
		[Inject]
		public var gridModel:GridModel;
		
		override public function execute():void 
		{
			var vo:GridVO 				= new GridVO();
			vo.grid 					= gridModel.grid;
			vo.numberOfHorisontalCells 	= gridModel.cellsW;
			vo.numberOfVerticalCells 	= gridModel.cellsH;
			
			dispatch( new RenderGridEvent( RenderGridEvent.RENDER, vo ) );
		}
	}

}