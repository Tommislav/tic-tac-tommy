package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.utils.getDefinitionByName;
	import flash.utils.getTimer;
	
	/**
	 * Will display a loader while the rest of the swf is downloading, so that we won't
	 * have to look at a white rectangle before loaded.
	 * 
	 * Choose this class as the main class, and add the compilerOption:
	 * "-frame start myProject.MainContainerClass", and make sure that it
	 * matches the MAIN_CLASS string (note: changed MAIN_CLASS from string to compiler flag).
	 * @author Tommislav
	 */
	public class Preloader extends flash.display.MovieClip 
	{
		private const MAIN_CLASS:String = CONFIG::startFrame;
		
		
		
		public function Preloader() 
		{
			showLoader();
			
			stage.addEventListener(Event.RESIZE, onResize);
			stage.addEventListener(Event.ENTER_FRAME, checkLoaded);
			stop();
		}
		
		private function checkLoaded(e:Event):void 
		{
			if (framesLoaded == 2)
			{
				stage.removeEventListener(Event.ENTER_FRAME, checkLoaded);
				stage.removeEventListener(Event.RESIZE, onResize);
				
				removeLoader();
				nextFrame();
				
				var ContainerClass:Class = getDefinitionByName(MAIN_CLASS) as Class;
				stage.addChild(new ContainerClass());
			}
		}
		
		protected function showLoader():void
		{
			
		}
		
		protected function removeLoader():void
		{
			
		}
		
		protected function onResize(e:Event):void 
		{
			
		}
	}
}