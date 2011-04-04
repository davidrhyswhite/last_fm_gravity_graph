package _classes.display {
	import flash.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import fm.last.*;
	
	import mx.core.UIComponent;
	
	import org.cove.ape.*;
	
	[SWF(backgroundColor="#FEFEFE")]
	public class LastFMArtistGraph extends UIComponent
	{
		private var defaultGroup:org.cove.ape.Group = new org.cove.ape.Group();
		private var _user:User;
		public var bottom:RectangleParticle;
		public var left:RectangleParticle;
		public var right:RectangleParticle;
		
		public function LastFMArtistGraph(name:String, width:Number, height:Number)
		{
			initStage();
			
			_user = new User();
			_user.getTopArtists(name);
			_user.addEventListener(User.GET_TOP_ARTISTS, getTopArtistsHandler);
			
			addEventListener(Event.ENTER_FRAME, run);
			
			APEngine.init(0.25);
			APEngine.container = this;
			APEngine.addMasslessForce(new Vector(0,4));
			
			defaultGroup.collideInternal = true;
			bottom = new RectangleParticle(0,height,width*2,30,0,true);
			bottom.setFill(0xFFFFFF, 0);
			bottom.setLine(0, 0xFFFFFF, 0);
			defaultGroup.addParticle(bottom);

			left = new RectangleParticle(0,0,30,height*2,0,true);
			left.setFill(0xFFFFFF, 0);
			left.setLine(0, 0xFFFFFF, 0);
			defaultGroup.addParticle(left);

			right = new RectangleParticle(width,0,30,height*2,0,true);
			right.setFill(0xFFFFFF, 0);
			right.setLine(0, 0xFFFFFF, 0);
			defaultGroup.addParticle(right);
			
			APEngine.addGroup(defaultGroup);
		}
		private function initStage():void
		{
			//trace(stage.stageWidth);
		}
		
		
		private function initFonts():void
		{
			Font.registerFont(AssetManager.FONT_AVANTGARDE);
			Font.registerFont(AssetManager.FONT_HELVETICA);
			
			var fontArray:Array = Font.enumerateFonts(false);
			for(var i:int = 0; i < fontArray.length; i++) {
				var thisFont:Font = fontArray[i];
				trace("name: " + thisFont.fontName);
				trace("typeface: " + thisFont.fontStyle);
			}

		}
		
		private function run(evt:Event):void 
		{
			APEngine.step();
			APEngine.paint();
		}
		
		private function getTopArtistsHandler(e:Event):void
		{
			trace(_user.xml);
			var highestNum:Number = 0;
			var lastNum:Number = 0;
			
			var artist:XMLList = _user.xml.topartists.artist;
			for (var i:uint = 0; i < 15; i++)
			{
				
				trace("Artist name: " + artist[i].name + " and playcount: " + artist[i].playcount);
				if(artist[i].playcount > lastNum)
				{
					highestNum = artist[i].playcount
				}
				lastNum = artist[i].playcount;
			}
			
			for(var j:uint = 0; j < 15; j++)
			{
				var size:Number = ((artist[j].playcount / highestNum) * 100) + 30;
				var cp:CircleParticle = new CircleParticle(350+j,50+j,size, false, 1, .1);
				cp.setFill(0x000000);
				cp.sprite.addEventListener(MouseEvent.MOUSE_DOWN, onMouseEventHandler);
				defaultGroup.addParticle(cp);
				
			
				var textFormat:TextFormat = new TextFormat();
				textFormat.color = 0xFFFFFF;
				textFormat.font = "Helvetica Neue";
				textFormat.size = 11;
				var _content:TextField = new TextField();
				_content.antiAliasType = AntiAliasType.ADVANCED;
				_content.autoSize = TextFieldAutoSize.RIGHT;
				_content.embedFonts = true;
				_content.defaultTextFormat = textFormat;
				_content.selectable = false;
				_content.wordWrap = true;
				_content.multiline = true;
				_content.text = artist[j].name;
				_content.height = _content.textHeight + 5;
				_content.x = -(_content.textWidth / 2);
				cp.sprite.addChild(_content)
				trace( artist[j].name + ": " + cp.radius);
			}
		}
		
		private function onResizeEventHandler(event:Event):void
		{
			
		}
		private function onMouseEventHandler(event:MouseEvent):void
		{

		}
	}
}
