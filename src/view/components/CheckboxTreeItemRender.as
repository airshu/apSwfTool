package view.components
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.collections.ICollectionView;
	import mx.collections.IList;
	import mx.collections.IViewCursor;
	import mx.controls.CheckBox;
	import mx.controls.Image;
	import mx.controls.Tree;
	import mx.controls.treeClasses.ITreeDataDescriptor;
	import mx.controls.treeClasses.TreeItemRenderer;
	import mx.controls.treeClasses.TreeListData;
	
	public class CheckboxTreeItemRender extends TreeItemRenderer
	{
		public function CheckboxTreeItemRender()
		{
			super();
		}
		
		protected var myImage:Image;  
		private var imageWidth:Number   = 12;  
		private var imageHeight:Number  = 12;  
		// set image properties  
		private var inner:String    = "@Embed(source='assets/inner.png')";  
		protected var checkBox:CheckBox;  
		/** 
		 * 表示CheckBox控件从data中所取数据的字段 
		 */  
		private var _selectedField:String="selected";  
		
		/** 
		 * 点击checkbox时,更新dataProvider 
		 * @param event 
		 */  
		protected function changeHandler(event:Event):void  
		{  
			if (data && data[_selectedField] != undefined)  
			{  
				data[_selectedField]=checkBox.selected;  
			}  
			
			var myListData:TreeListData=TreeListData(this.listData);  
			var tree:Tree=Tree(myListData.owner);  
			/* var toggle:Boolean=checkBox.selected; */  
			toggleChildren(data, tree);  
			var parent:Object=tree.getParentItem(data);  
			toggleParents (parent, tree);  
			
		}  
		
		/** 
		 * 初始化控件时, 给checkbox赋值 
		 */  
		override protected function commitProperties():void  
		{  
			super.commitProperties();  
			//trace(data[_selectedField])  
			if (data && data[_selectedField] != undefined)  
			{  
				checkBox.selected=data[_selectedField];  
			}  
			else  
			{  
				checkBox.selected=false;  
			}   
		}  
		
		/** 
		 * 构建CheckBox 
		 */  
		override protected function createChildren():void  
		{  
			super.createChildren();  
			checkBox=new CheckBox();  
			addChild(checkBox);  
			checkBox.addEventListener(Event.CHANGE, changeHandler);  
//			myImage = new Image();  
//			myImage.source='assets/inner.png';  
//			myImage.addEventListener( MouseEvent.CLICK, imageToggleHandler );  
//			addChild(myImage);  
		}  
		private function imageToggleHandler(event:Event):void  
		{  
			checkBox.selected = !checkBox.selected;  
			changeHandler(event);  
		}  
		
		/** 
		 * 重置itemRenderer的宽度 
		 */  
		override protected function measure():void  
		{  
			super.measure();  
			measuredWidth+=checkBox.getExplicitOrMeasuredWidth();  
		}  
		
		/** 
		 * 重新排列位置, 将label后移 
		 * @param unscaledWidth 
		 * @param unscaledHeight 
		 */  
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void  
		{  
			super.updateDisplayList(unscaledWidth, unscaledHeight);  
			if(super.data)  
			{  
				if (super.icon != null)  
				{  
					checkBox.x = super.icon.x;  
					checkBox.y = 13;  
					super.icon.x = checkBox.x + checkBox.width + 25;  
					super.label.x = super.icon.x + super.icon.width + 3;  
				}  
				else  
				{  
					checkBox.x = super.label.x;  
					checkBox.y = 13;  
					super.label.x = checkBox.x + checkBox.width + 25;  
				}  
//				if (data[_selectedField] == "11")  
//				{  
//					myImage.x = checkBox.x+3 ;  
//					myImage.y = checkBox.y-5 ;  
//					myImage.width = imageWidth;  
//					myImage.height = imageHeight;  
//					checkBox.selected = false;  
//				}  
//				else  
//				{  
//					myImage.x = 0;  
//					myImage.y = 0;  
//					myImage.width = 0;  
//					myImage.height = 0;  
//				}  
			}  
		}  
		
		private function toggleChildren(item:Object, tree:Tree):void  
		{  
			if (item == null)  
			{  
				return;  
			}  
			else  
			{  
				var treeData:ITreeDataDescriptor=tree.dataDescriptor;  
				
				item[_selectedField]=checkBox.selected;  
				
				var tmpTree:IList=tree.dataProvider as IList;  
				tmpTree.itemUpdated(item);  
				
				if (treeData.hasChildren(item))  
				{  
					var children:ICollectionView=treeData.getChildren(item);  
					var cursor:IViewCursor=children.createCursor();  
					while (!cursor.afterLast)  
					{  
						toggleChildren(cursor.current, tree);  
						cursor.moveNext();  
					}  
				}  
			}  
			
		}  
		
		private function toggleParents (item:Object, tree:Tree):void{  
			if (item == null)  
			{  
				return;  
			}  
			else  
			{  
				var numChecks:int = 0;  
				var numUnChecks:int = 0;  
				var numCats:int = 0;  
				
				var treeData:ITreeDataDescriptor=tree.dataDescriptor;  
				var children:ICollectionView=treeData.getChildren(item);  
				var cursor:IViewCursor=children.createCursor();  
				
				while (!cursor.afterLast)  
				{  
					if(cursor.current[_selectedField]){  
						numChecks++;  
					}else{  
						numUnChecks++;  
					}  
					cursor.moveNext();  
				}  
				if(numChecks>0&& numUnChecks>0){  
					item[_selectedField] = "11"  
				}else if(numChecks>0){  
					item[_selectedField]=true;  
				}else{  
					item[_selectedField]=false;  
				}  
				var tmpTree:IList=tree.dataProvider as IList;  
				tmpTree.itemUpdated(item);  
				if(tree.getParentItem(item)!=null){  
					toggleParents(tree.getParentItem(item),tree);  
				}  
			}  
		}  
		
	}
}