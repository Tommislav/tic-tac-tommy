package se.salomonsson.ttt.mediator 
{
	import org.robotlegs.mvcs.Mediator;
	import se.salomonsson.ttt.model.GridModel;
	import se.salomonsson.ttt.view.IGridView;
	
	/**
	 * ...
	 * @author Tommislav
	 */
	public class GridViewMediator extends Mediator 
	{
		[Inject] public var gridModel:GridModel;
		
		private var _gridView:IGridView;
		
		
		override public function onRegister():void 
		{
			trace("onRegister!");
			
			_gridView = this.viewComponent as IGridView;
			
			// Make view draw itself to match the initial state of the model
			_gridView.drawGrid( gridModel.cellsW, gridModel.cellsH, gridModel.grid );
		}
		
		override public function onRemove():void 
		{
			
		}
	}

}