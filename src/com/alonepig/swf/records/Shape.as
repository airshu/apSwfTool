package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.exporters.AS3ShapeExporter;
	
	/**
	 * 
	 */	
	public class Shape extends BaseData
	{
		
		public var numFillBits:uint;
		public var numLineBits:uint;
		public var shapeRecords:Vector.<ShapeRecord>;
		
		public function Shape(bt:SWFData=null)
		{
			shapeRecords = new Vector.<ShapeRecord>();
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			bt.resetBitsPending();
			numFillBits = bt.readUB(4);
			numLineBits = bt.readUB(4);
			readShapeRecords(bt, numFillBits, numLineBits, shapeType);
			
//			var start:int = bt.position*8;
//			numFillBits = Tools.readUBits(bt, start, 4);
//			numLineBits = Tools.readUBits(bt, start+4, 4);
		}
		
		protected function readShapeRecords(data:SWFData, fillBits:uint, lineBits:uint, level:uint = 1):void {
			var shapeRecord:ShapeRecord;
			while (!(shapeRecord is ShapeRecordEnd)) {
				// The SWF10 spec says that shape records are byte aligned.
				// In reality they seem not to be?
				// bitsPending = 0;
				var edgeRecord:Boolean = (data.readUB(1) == 1);
				if (edgeRecord) 
				{
					var straightFlag:Boolean = (data.readUB(1) == 1);
					var numBits:uint = data.readUB(4) + 2;
					if (straightFlag)
					{
						shapeRecord = new ShapeRecordStraightEdge();
						shapeRecord.numBits = numBits;
						shapeRecord.read(data);
					}
					else
					{
						shapeRecord = new ShapeRecordCurvedEdge();
						shapeRecord.numBits = numBits;
						shapeRecord.read(data);
					}
				}
				else 
				{
					//TypeFlag = 0
					var states:uint = data.readUB(5);
					if (states == 0) 
					{
						shapeRecord = new ShapeRecordEnd();
					} 
					else
					{
						var styleChangeRecord:ShapeRecordStyleChange = new ShapeRecordStyleChange();
						styleChangeRecord.stateNewStyles = ((states & 0x10) != 0);
						styleChangeRecord.stateLineStyle = ((states & 0x08) != 0);
						styleChangeRecord.stateFillStyle1 = ((states & 0x04) != 0);
						styleChangeRecord.stateFillStyle0 = ((states & 0x02) != 0);
						styleChangeRecord.stateMoveTo = ((states & 0x01) != 0);
						styleChangeRecord.shapeType = level;
						styleChangeRecord.numFillBits = fillBits;
						styleChangeRecord.numLineBits = lineBits;
						styleChangeRecord.read(data);
						if (styleChangeRecord.stateNewStyles) 
						{
							fillBits = styleChangeRecord.numFillBits;
							lineBits = styleChangeRecord.numLineBits;
						}
						shapeRecord = styleChangeRecord;
					}
				}
				shapeRecords.push(shapeRecord);
			}
		}
		
		
		/**
		 * 解析成AS 
		 * @param handler
		 * 
		 */		
		public function export(handler:AS3ShapeExporter):void
		{
			// Create edge maps
//			createEdgeMaps();
			// If no handler is passed, default to DefaultShapeExporter (does nothing)
//			if (handler == null) { handler = new DefaultShapeExporter(null); }
			// Let the doc handler know that a shape export starts
//			handler.beginShape();
			// Export fills first
//			exportFillPath(handler);
			// Export strokes last
//			exportLinePath(handler);
			// Let the doc handler know that we're done exporting a shape
//			handler.endShape();
		}
		
		
		protected var edgeMapsCreated:Boolean = false;
		
//		protected function createEdgeMaps():void {
//			if(!edgeMapsCreated) {
//				var xPos:Number = 0;
//				var yPos:Number = 0;
//				var from:Point;
//				var to:Point;
//				var control:Point;
//				var fillStyleIdxOffset:int = 0;
//				var lineStyleIdxOffset:int = 0;
//				var currentFillStyleIdx0:uint = 0;
//				var currentFillStyleIdx1:uint = 0;
//				var currentLineStyleIdx:uint = 0;
//				var subPath:Vector.<IEdge> = new Vector.<IEdge>();
//				fillEdgeMap = new Dictionary();
//				lineEdgeMap = new Dictionary();
//				for (var i:uint = 0; i < _records.length; i++) {
//					var shapeRecord:SWFShapeRecord = _records[i];
//					switch(shapeRecord.type) {
//						case SWFShapeRecord.TYPE_STYLECHANGE:
//							var styleChangeRecord:SWFShapeRecordStyleChange = shapeRecord as SWFShapeRecordStyleChange;
//							if (styleChangeRecord.stateLineStyle || styleChangeRecord.stateFillStyle0 || styleChangeRecord.stateFillStyle1) {
//								processSubPath(subPath, currentLineStyleIdx, currentFillStyleIdx0, currentFillStyleIdx1);
//								subPath = new Vector.<IEdge>();
//							}
//							if (styleChangeRecord.stateNewStyles) {
//								fillStyleIdxOffset = _fillStyles.length;
//								lineStyleIdxOffset = _lineStyles.length;
//								appendFillStyles(_fillStyles, styleChangeRecord.fillStyles);
//								appendLineStyles(_lineStyles, styleChangeRecord.lineStyles);
//							}
//							if (styleChangeRecord.stateLineStyle) {
//								currentLineStyleIdx = styleChangeRecord.lineStyle;
//								if (currentLineStyleIdx > 0) {
//									currentLineStyleIdx += lineStyleIdxOffset;
//								}
//							}
//							if (styleChangeRecord.stateFillStyle0) {
//								currentFillStyleIdx0 = styleChangeRecord.fillStyle0;
//								if (currentFillStyleIdx0 > 0) {
//									currentFillStyleIdx0 += fillStyleIdxOffset;
//								}
//							}
//							if (styleChangeRecord.stateFillStyle1) {
//								currentFillStyleIdx1 = styleChangeRecord.fillStyle1;
//								if (currentFillStyleIdx1 > 0) {
//									currentFillStyleIdx1 += fillStyleIdxOffset;
//								}
//							}
//							if (styleChangeRecord.stateMoveTo) {
//								xPos = styleChangeRecord.moveDeltaX / unitDivisor;
//								yPos = styleChangeRecord.moveDeltaY / unitDivisor;
//							}
//							break;
//						case SWFShapeRecord.TYPE_STRAIGHTEDGE:
//							var straightEdgeRecord:SWFShapeRecordStraightEdge = shapeRecord as SWFShapeRecordStraightEdge;
//							from = new Point(NumberUtils.roundPixels400(xPos), NumberUtils.roundPixels400(yPos));
//							if (straightEdgeRecord.generalLineFlag) {
//								xPos += straightEdgeRecord.deltaX / unitDivisor;
//								yPos += straightEdgeRecord.deltaY / unitDivisor;
//							} else {
//								if (straightEdgeRecord.vertLineFlag) {
//									yPos += straightEdgeRecord.deltaY / unitDivisor;
//								} else {
//									xPos += straightEdgeRecord.deltaX / unitDivisor;
//								}
//							}
//							to = new Point(NumberUtils.roundPixels400(xPos), NumberUtils.roundPixels400(yPos));
//							subPath.push(new StraightEdge(from, to, currentLineStyleIdx, currentFillStyleIdx1));
//							break;
//						case SWFShapeRecord.TYPE_CURVEDEDGE:
//							var curvedEdgeRecord:SWFShapeRecordCurvedEdge = shapeRecord as SWFShapeRecordCurvedEdge;
//							from = new Point(NumberUtils.roundPixels400(xPos), NumberUtils.roundPixels400(yPos));
//							var xPosControl:Number = xPos + curvedEdgeRecord.controlDeltaX / unitDivisor;
//							var yPosControl:Number = yPos + curvedEdgeRecord.controlDeltaY / unitDivisor;
//							xPos = xPosControl + curvedEdgeRecord.anchorDeltaX / unitDivisor;
//							yPos = yPosControl + curvedEdgeRecord.anchorDeltaY / unitDivisor;
//							control = new Point(xPosControl, yPosControl);
//							to = new Point(NumberUtils.roundPixels400(xPos), NumberUtils.roundPixels400(yPos));
//							subPath.push(new CurvedEdge(from, control, to, currentLineStyleIdx, currentFillStyleIdx1));
//							break; 
//						case SWFShapeRecord.TYPE_END:
//							// We're done. Process the last subpath, if any
//							processSubPath(subPath, currentLineStyleIdx, currentFillStyleIdx0, currentFillStyleIdx1);
//							break;
//					}
//				}
//				cleanEdgeMap(fillEdgeMap);
//				cleanEdgeMap(lineEdgeMap);
//				edgeMapsCreated = true;
//			}
//		}
//		
//		protected function exportFillPath(handler:IShapeExporter):void {
//			var path:Vector.<IEdge> = createPathFromEdgeMap(fillEdgeMap);
//			var pos:Point = new Point(Number.MAX_VALUE, Number.MAX_VALUE);
//			var fillStyleIdx:uint = uint.MAX_VALUE;
//			if(path.length > 0) {
//				handler.beginFills();
//				for (var i:uint = 0; i < path.length; i++) {
//					var e:IEdge = path[i];
//					if (fillStyleIdx != e.fillStyleIdx) {
//						fillStyleIdx = e.fillStyleIdx;
//						pos = new Point(Number.MAX_VALUE, Number.MAX_VALUE);
//						try {
//							var matrix:Matrix;
//							var fillStyle:SWFFillStyle = _fillStyles[fillStyleIdx - 1];
//							switch(fillStyle.type) {
//								case 0x00:
//									// Solid fill
//									handler.beginFill(ColorUtils.rgb(fillStyle.rgb), ColorUtils.alpha(fillStyle.rgb));
//									break;
//								case 0x10:
//								case 0x12:
//								case 0x13:
//									// Gradient fill
//									var colors:Array = [];
//									var alphas:Array = [];
//									var ratios:Array = [];
//									var gradientRecord:SWFGradientRecord;
//									matrix = fillStyle.gradientMatrix.matrix.clone();
//									matrix.tx /= 20;
//									matrix.ty /= 20;
//									for (var gri:uint = 0; gri < fillStyle.gradient.records.length; gri++) {
//										gradientRecord = fillStyle.gradient.records[gri];
//										colors.push(ColorUtils.rgb(gradientRecord.color));
//										alphas.push(ColorUtils.alpha(gradientRecord.color));
//										ratios.push(gradientRecord.ratio);
//									}
//									handler.beginGradientFill(
//										(fillStyle.type == 0x10) ? GradientType.LINEAR : GradientType.RADIAL,
//										colors, alphas, ratios, matrix,
//										GradientSpreadMode.toString(fillStyle.gradient.spreadMode),
//										GradientInterpolationMode.toString(fillStyle.gradient.interpolationMode),
//										fillStyle.gradient.focalPoint
//									);
//									break;
//								case 0x40:
//								case 0x41:
//								case 0x42:
//								case 0x43:
//									// Bitmap fill
//									matrix = fillStyle.bitmapMatrix.matrix.clone();
//									matrix.tx /= 20;
//									matrix.ty /= 20;
//									handler.beginBitmapFill(
//										fillStyle.bitmapId,
//										matrix,
//										(fillStyle.type == 0x40 || fillStyle.type == 0x42),
//										(fillStyle.type == 0x40 || fillStyle.type == 0x41)
//									);
//									break;
//							}
//						} catch (e:Error) {
//							// Font shapes define no fillstyles per se, but do reference fillstyle index 1,
//							// which represents the font color. We just report solid black in this case.
//							handler.beginFill(0);
//						}
//					}
//					if (!pos.equals(e.from)) {
//						handler.moveTo(e.from.x, e.from.y);
//					}
//					if (e is CurvedEdge) {
//						var c:CurvedEdge = CurvedEdge(e);
//						handler.curveTo(c.control.x, c.control.y, c.to.x, c.to.y);
//					} else {
//						handler.lineTo(e.to.x, e.to.y);
//					}
//					pos = e.to;
//				}
//				handler.endFill();
//				handler.endFills();
//			}
//		}
//		
//		protected function exportLinePath(handler:IShapeExporter):void {
//			var path:Vector.<IEdge> = createPathFromEdgeMap(lineEdgeMap);
//			var pos:Point = new Point(Number.MAX_VALUE, Number.MAX_VALUE);
//			var lineStyleIdx:uint = uint.MAX_VALUE;
//			var lineStyle:SWFLineStyle;
//			if(path.length > 0) {
//				handler.beginLines();
//				for (var i:uint = 0; i < path.length; i++) {
//					var e:IEdge = path[i];
//					if (lineStyleIdx != e.lineStyleIdx) {
//						lineStyleIdx = e.lineStyleIdx;
//						pos = new Point(Number.MAX_VALUE, Number.MAX_VALUE);
//						try {
//							lineStyle = _lineStyles[lineStyleIdx - 1];
//						} catch (e:Error) {
//							lineStyle = null;
//						}
//						if (lineStyle != null) {
//							var scaleMode:String = LineScaleMode.NORMAL;
//							if (lineStyle.noHScaleFlag && lineStyle.noVScaleFlag) {
//								scaleMode = LineScaleMode.NONE;
//							} else if (lineStyle.noHScaleFlag) {
//								scaleMode = LineScaleMode.HORIZONTAL;
//							} else if (lineStyle.noVScaleFlag) {
//								scaleMode = LineScaleMode.VERTICAL;
//							}
//							handler.lineStyle(
//								lineStyle.width / 20, 
//								ColorUtils.rgb(lineStyle.color), 
//								ColorUtils.alpha(lineStyle.color), 
//								lineStyle.pixelHintingFlag,
//								scaleMode,
//								LineCapsStyle.toString(lineStyle.startCapsStyle),
//								LineCapsStyle.toString(lineStyle.endCapsStyle),
//								LineJointStyle.toString(lineStyle.jointStyle),
//								lineStyle.miterLimitFactor);
//							
//							if(lineStyle.hasFillFlag) {
//								var fillStyle:SWFFillStyle = lineStyle.fillType;
//								switch(fillStyle.type) {
//									case 0x10:
//									case 0x12:
//									case 0x13:
//										// Gradient fill
//										var colors:Array = [];
//										var alphas:Array = [];
//										var ratios:Array = [];
//										var gradientRecord:SWFGradientRecord;
//										var matrix:Matrix = fillStyle.gradientMatrix.matrix.clone();
//										matrix.tx /= 20;
//										matrix.ty /= 20;
//										for (var gri:uint = 0; gri < fillStyle.gradient.records.length; gri++) {
//											gradientRecord = fillStyle.gradient.records[gri];
//											colors.push(ColorUtils.rgb(gradientRecord.color));
//											alphas.push(ColorUtils.alpha(gradientRecord.color));
//											ratios.push(gradientRecord.ratio);
//										}
//										handler.lineGradientStyle(
//											(fillStyle.type == 0x10) ? GradientType.LINEAR : GradientType.RADIAL,
//											colors, alphas, ratios, matrix,
//											GradientSpreadMode.toString(fillStyle.gradient.spreadMode),
//											GradientInterpolationMode.toString(fillStyle.gradient.interpolationMode),
//											fillStyle.gradient.focalPoint
//										);
//										break;
//								}
//							}
//						} else {
//							// We should never get here
//							handler.lineStyle(0);
//						}
//					}
//					if (!e.from.equals(pos)) {
//						handler.moveTo(e.from.x, e.from.y);
//					}
//					if (e is CurvedEdge) {
//						var c:CurvedEdge = CurvedEdge(e);
//						handler.curveTo(c.control.x, c.control.y, c.to.x, c.to.y);
//					} else {
//						handler.lineTo(e.to.x, e.to.y);
//					}
//					pos = e.to;
//				}
//				handler.endLines();
//			}
//		}
		
		
	}
}