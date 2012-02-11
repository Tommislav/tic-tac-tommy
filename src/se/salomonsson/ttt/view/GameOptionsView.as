package se.salomonsson.ttt.view
{
	import com.bit101.components.PushButton;

	import flash.events.MouseEvent;

	import org.osflash.signals.ISignal;

	import flash.display.DisplayObject;
	import flash.display.Sprite;

	import org.osflash.signals.Signal;

	/**
	 * The in-game options view
	 * @author Tommislav
	 */
	public class GameOptionsView extends Sprite implements IGameOptionsView
	{
		private var _onResetGameSignal:Signal = new Signal();

		private var _resetButton:PushButton;

		public function GameOptionsView()
		{
			init();
		}

		private function init():void
		{
			_resetButton = new PushButton(this, 0, 0, "Reset game", onResetClick);
		}

		private function onResetClick(e:MouseEvent):void
		{
			_onResetGameSignal.dispatch();
		}

		/* INTERFACE se.salomonsson.ttt.view.IGameOptionsView */
		public function get displayObject():DisplayObject { return this; }
		public function get onResetGameSignal():ISignal { return _onResetGameSignal; }
	}
}