package com.alonepig.abc
{
	import com.alonepig.abc.data.Class_info;
	import com.alonepig.abc.data.Cpool_info;
	import com.alonepig.abc.data.Instance_info;
	import com.alonepig.abc.data.Metadata_info;
	import com.alonepig.abc.data.Method_body_info;
	import com.alonepig.abc.data.Method_info;
	import com.alonepig.abc.data.Script_info;
	import com.alonepig.model.ModelLocator;
	

	public class ABC extends BaseABCData
	{
		/**
		 * 常量  
		 */		
		public var minor_version:int = 16;
		/**
		 * 常量 
		 */		
		public var major_version:int = 46;
		public var constant_info:Cpool_info;
		public var method_count:uint;
		public var methods:Vector.<Method_info>;
		public var metadata_count:uint;
		public var metadatas:Vector.<Metadata_info>;
		/**
		 * 自定义类的个数 
		 */		
		public var class_count:uint;
		public var instances:Vector.<Instance_info>;
		public var classs:Vector.<Class_info>;
		public var script_count:uint;
		public var scripts:Vector.<Script_info>;
		public var method_body_count:uint;
		public var method_bodys:Vector.<Method_body_info>;
		
		public function ABC(bt:ABCData=null)
		{
			ModelLocator.abc = this;
			
			constant_info = new Cpool_info();
			methods = new Vector.<Method_info>();
			metadatas = new Vector.<Metadata_info>();
			instances = new Vector.<Instance_info>();
			classs = new Vector.<Class_info>();
			scripts = new Vector.<Script_info>();
			method_bodys = new Vector.<Method_body_info>();
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			minor_version = bt.readUnsignedShort();
			major_version = bt.readUnsignedShort();
			
			constant_info.read( bt );
			
			readMethods(bt);
			
			readMetadata(bt);
			
			readInstances(bt);
			
			readClasses(bt);
			
			readScripts(bt);
			
			readMethodBodies(bt);
		}
		
		private function readMethodBodies(bt:ABCData):void
		{
			method_body_count = bt.readU32();
			for (var i:int = 0; i < method_body_count; i++) 
			{
				method_bodys.push( new Method_body_info(bt) );
			}
		}
		
		private function readScripts(bt:ABCData):void
		{
			script_count = bt.readU32();
			for (var i:int = 0; i < script_count; i++) 
			{
				scripts.push( new Script_info(bt) );
			}
			
		}
		
		private function readClasses(bt:ABCData):void
		{
			var classInfo:Class_info;
			for (var i:int = 0; i < class_count; i++) 
			{
				classInfo = new Class_info(bt);
				
				classInfo.name = ""+instances[i].nameStr;
				trace(classInfo.name, "@##################");
				classs.push( classInfo );
			}
		}
		
		private function readInstances(bt:ABCData):void
		{
			class_count = bt.readU30();
			var instance_info:Instance_info;
			for (var i:int = 0; i < class_count; i++) 
			{
				instance_info = new Instance_info(bt)
				instance_info.nameStr = constant_info.multinames[instance_info.name].data.toString();
				instance_info.super_nameStr = constant_info.multinames[instance_info.super_name].data.toString();
				instances.push( instance_info );
			}
		}
		
		private function readMetadata(bt:ABCData):void
		{
			metadata_count = bt.readU30();
			
			var metadata:Metadata_info;
			for (var i:int = 0; i < metadata_count; i++) 
			{
				metadata = new Metadata_info(bt);
				metadata.nameStr = constant_info.strings[metadata.name].utf8;
				for (var j:int = 0; j < metadata.item_count; j++) 
				{
					metadata.items[j].keyStr = constant_info.strings[metadata.items[j].key].utf8;
					metadata.items[j].valueStr = constant_info.strings[metadata.items[j].value].utf8;
				}
				metadatas.push( metadata );
			}
		}
		
		private function readMethods(bt:ABCData):void
		{
			var method:Method_info;
			
			method_count = bt.readU30();
			
			for(var i:int=0; i<method_count; i++)
			{
				// 这里以后可能会将常量池传过去来设置对应关系
				method = new Method_info(bt);
				methods.push( method );
				method.nameStr = constant_info.strings[method.name].utf8;
				if(method.return_type!=0)
					method.return_typeStr = constant_info.multinames[method.return_type].data.toString();
			}
		}		
		
		
	}
}