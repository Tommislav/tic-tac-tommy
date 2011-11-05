package se.salomonsson.ttt.mediator 
{
	import org.robotlegs.mvcs.Mediator;
	import se.salomonsson.ttt.events.RenderGridEvent;
	import se.salomonsson.ttt.model.GridModel;
	import se.salomonsson.ttt.view.IGridView;
	import se.salomonsson.ttt.vo.GridVO;
	
	/**
	 * Mediator for the grid view
	 * @author Tommislav
	 */
	public class GridViewMediator extends Mediator 
	{
		private var _gridView:IGridView;
		
		override public function onRegister():void 
		{
			// Get typed reference to the view we are connected to
			_gridView = this.viewComponent as IGridView;
			
			
			addContextListener( RenderGridEvent.RENDER, renderGrid, RenderGridEvent );
		}
		
		override public function onRemove():void 
		{
			
		}
		
		
		
		private function renderGrid(e:RenderGridEvent):void
		{
			var vo:GridVO = e.gridVO;
			_gridView.drawGrid( vo.numberOfHorisontalCells, vo.numberOfVerticalCells, vo.grid );
		}
	}

}