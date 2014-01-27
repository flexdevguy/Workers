package
{
	import flash.display.Sprite;
	import flash.system.MessageChannel;
	import flash.system.Worker;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.Button;
	
	import components.MyComponent;
	
	public class MyFirstWorker extends Sprite
	{
		private var mainToWorker:MessageChannel;
		private var workerToMain:MessageChannel;
		
		public function MyFirstWorker()
		{
			super();
			
			mainToWorker = Worker.current.getSharedProperty("mainToWorker");//createMessageChannel(myFirstWorker);
			workerToMain =  Worker.current.getSharedProperty("workerToMain");//myFirstWorker.createMessageChannel(Worker.current);
			
			var arrBtn:Array = [];
			for (var i:int = 0; i < 50009 ; i++) 
			{
				var btn:Button = new Button();
				btn.label = i.toString();
				arrBtn.push(btn);
			}
			
			// won't work -> accessing other components is not possible in workers
			MyComponent.myArray = arrBtn;
			
			workerToMain.send("Hai main App");
//			workerToMain.send({id:"firstObj",label:"Gowtham"});
//			workerToMain.send(new Array({id:"firstObj",label:"Gowtham"},{id:"firstObj",label:"Gowtham"},{id:"firstObj",label:"Gowtham"}));
//			workerToMain.send(arrBtn); not possible to send array with ui component
		}
	}
}