////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2008 The Degrafa Team : http://www.Degrafa.com/team
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
////////////////////////////////////////////////////////////////////////////////
package com.degrafa.geometry.segment{
	
	import com.degrafa.GraphicPoint;
	import com.degrafa.geometry.command.CommandStack;
	import com.degrafa.geometry.command.CommandStackItem;
	import com.degrafa.geometry.utilities.GeometryUtils;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.registerClassAlias;
	
	//--------------------------------------
	//  Other metadata
	//--------------------------------------
	
	[IconFile("CubicBezierTo.png")]
	
	//(C,c,S,s) path data commands
	[Bindable]	
	/**
 	*  A cubic Bézier (C,c S,s) segment is defined by a end point and two control points.
 	*  
 	*  @see http://www.w3.org/TR/SVG/paths.html#PathDataCubicBezierCommands
 	*  
 	**/	
	public class CubicBezierTo extends Segment implements ISegment{
		/**
	 	* Constructor.
	 	*  
	 	* <p>The CubicBezierTo constructor accepts 9 optional arguments that define it's 
	 	* data, properties, coordinate type and a flag that specifies a short sequence.</p>
	 	* 
	 	* @param cx A number indicating the x-coordinate of the first control point of the curve. 
	 	* @param cy A number indicating the y-coordinate of the first control point of the curve.
	 	* @param cx1 A number indicating the x-coordinate of the second control point of the curve.
	 	* @param cy1 A number indicating the y-coordinate of the second control point of the curve.   
	 	* @param x A number indicating the x-coordinate of the end point of the curve.
	 	* @param y A number indicating the y-coordinate of the end point of the curve.
	  	* @param data A string indicating the data to be used for this segment.
	 	* @param coordinateType A string indicating the coordinate type (absolute or relative) to be used for this segment.
	 	* @param isShortSequence A boolean indicating the if this segment is a short segment definition. 
	 	**/
		public function CubicBezierTo(cx:Number=0,cy:Number=0,cx1:Number=0,cy1:Number=0,x:Number=0,y:Number=0,
		data:String=null,coordinateType:String="absolute",isShortSequence:Boolean=false){
			
			this.cx =cx;
			this.cy =cy;
			this.cx1 =cx1;
			this.cy1 =cy1;
			this.x =x;
			this.y =y;
			
			this.data =data;
			this.coordinateType=coordinateType;
			this.isShortSequence =isShortSequence
			
			registerClassAlias("com.degrafa.geometry.segment.CubicBezierTo", CubicBezierTo);	
			
		}
		
		/**
		* Return the segment type
		**/
		override public function get segmentType():String{
			return "CubicBezierTo";
		}


		/**
		* CubicBezierTo short hand data value.
		* 
		* <p>The cubic Bézier data property expects exactly 6 values 
		* cx, cy, cx1, cy1, x and y separated by spaces.</p>
		* 
		* @see Segment#data
		* 
		**/
		override public function set data(value:String):void{
			if(super.data != value){
				super.data = value;
				
				//parse the string on the space
				var tempArray:Array = value.split(" ");
				
				if (tempArray.length == 6){
					_cx=tempArray[0];
					_cy=tempArray[1];
					_cx1=tempArray[2];
					_cy1=tempArray[3];
					_x=tempArray[4];
					_y=tempArray[5];
				}
				invalidated = true;
			}
		}  
				
				
		private var _x:Number=0;
		/**
		* The x-coordinate of the end point of the curve. If not specified 
		* a default value of 0 is used.
		**/
		public function get x():Number{
			return _x;
		}
		public function set x(value:Number):void{
			if(_x != value){
				_x = value;
				invalidated = true;
			}
		}
		
		
		private var _y:Number=0;
		/**
		* The y-coordinate of the end point of the curve. If not specified 
		* a default value of 0 is used.
		**/
		public function get y():Number{
			return _y;
		}
		public function set y(value:Number):void{
			if(_y != value){
				_y = value;
				invalidated = true;
			}
		}
		
		
				
		private var _cx:Number=0;
		/**
		* The x-coordinate of the first control point of the curve. If not specified 
		* a default value of 0 is used.
		**/
		public function get cx():Number{
			return _cx;
		}
		public function set cx(value:Number):void{
			if(_cx != value){
				_cx = value;
				invalidated = true;
			}
		}
		
		
		private var _cy:Number=0;
		/**
		* The y-coordinate of the first control point of the curve. If not specified 
		* a default value of 0 is used.
		**/
		public function get cy():Number{
			return _cy;
		}
		public function set cy(value:Number):void{
			if(_cy != value){
				_cy = value;
				invalidated = true;
			}
		}
		
		
		private var _cx1:Number=0;
		/**
		* The x-coordinate of the second control point of the curve. If not specified 
		* a default value of 0 is used.
		**/
		public function get cx1():Number{
			return _cx1;
		}
		public function set cx1(value:Number):void{
			if(_cx1 != value){
				_cx1 = value;
				invalidated = true;
			}
		}
		
		
		private var _cy1:Number=0;
		/**
		* The y-coordinate of the second control point of the curve. If not specified 
		* a default value of 0 is used.
		**/
		public function get cy1():Number{
			return _cy1;
		}
		public function set cy1(value:Number):void{
			if(_cy1 != value){
				_cy1 = value;
				invalidated = true;
			}
		}
				
		private var _bounds:Rectangle;
		/**
		* The tight bounds of this segment as represented by a Rectangle object. 
		**/
		public function get bounds():Rectangle{
			return _bounds;	
		}
				
		/**
		* Calculates the bounds for this segment. 
		**/	
		private function calcBounds():Rectangle{
			
			if(commandStackItem.commandStack.length==0){return null;}
			
			var boundsMaxX:Number =0;
			var boundsMaxY:Number =0;
			var boundsMinX:Number =Number.MAX_VALUE;
			var boundsMinY:Number =Number.MAX_VALUE;
			
			var item:CommandStackItem;
			
			for each(item in this.commandStackItem.commandStack.source){
				if(item.type==2){
					with(item){	
						boundsMinX = Math.min(boundsMinX,x1);
						boundsMinX = Math.min(boundsMinX,cx);
						boundsMaxX = Math.max(boundsMaxX,x1);
						boundsMaxX = Math.max(boundsMaxX,cx);
						
						boundsMinY = Math.min(boundsMinY,y1);
						boundsMinY = Math.min(boundsMinY,cy);
						boundsMaxY = Math.max(boundsMaxY,y1);
						boundsMaxY = Math.max(boundsMaxY,cy);
					}
				}
				
	  		}
	  
	      	_bounds = new Rectangle(boundsMinX,boundsMinY,boundsMaxX-boundsMinX,boundsMaxY-boundsMinY);
			
			return _bounds;
		}
		
		/**
		* @inheritDoc 
		**/
		override public function preDraw():void{
			calcBounds();
			invalidated = false;
		} 
				
		private var lastPoint:Point;
		private var absRelOffset:Point;
		private var lastControlPoint:Point;
		
		/**
		* Compute the segment adding instructions to the command stack. 
		**/
		public function computeSegment(lastPoint:Point,absRelOffset:Point,lastControlPoint:Point,commandStack:CommandStack):void{
			
			if(!invalidated && lastPoint){
				if(this.lastPoint && !invalidated){
					if(!lastPoint.equals(this.lastPoint)){
						invalidated =true;
					}
				}
			}
			
			if(!invalidated && absRelOffset){
				if(this.absRelOffset && !invalidated){
					if(!absRelOffset.equals(this.absRelOffset)){
						invalidated =true;
					}
				}
			}
			
			if(!invalidated && lastControlPoint){
				if(this.lastControlPoint && !invalidated){
					if(!lastControlPoint.equals(this.lastControlPoint)){
						invalidated =true;
					}
				}
			}
			
			//test if anything has changed and only recalculate if something has
			if(!invalidated){
				return;
			}
									
			//if the last controly and the y are the same add a 
			//minute offset to avoid a display parasite that 
			//can sometimes occur from this.
			var cy1Offset:Number=0;
			if (cy1 == y) {
			
				cy1Offset =0.000001;
		
			}
			
			//add for the first run
			if(!commandStackItem){			
				commandStackItem = new CommandStackItem(CommandStackItem.COMMAND_STACK,
				NaN,NaN,NaN,NaN,NaN,NaN,NaN,NaN,new CommandStack());
				commandStack.addItem(commandStackItem);
			}
			
			//clear the array in this case as it's a complex item
			commandStackItem.commandStack.length=0;
						
			if(isShortSequence){
				
				GeometryUtils.cubicToQuadratic(
				new GraphicPoint(lastPoint.x,lastPoint.y),
				new GraphicPoint(lastPoint.x+(lastPoint.x-lastControlPoint.x),lastPoint.y+(lastPoint.y-lastControlPoint.y)),
				new GraphicPoint(absRelOffset.x+cx1,absRelOffset.y+cy1+cy1Offset),
				new GraphicPoint(absRelOffset.x+x,absRelOffset.y+y),
				1,commandStackItem.commandStack,true);
			}
			else{
				GeometryUtils.cubicToQuadratic(
				new GraphicPoint(lastPoint.x,lastPoint.y),
				new GraphicPoint(absRelOffset.x+cx,absRelOffset.y+cy),
				new GraphicPoint(absRelOffset.x+cx1,absRelOffset.y+cy1+cy1Offset),
				new GraphicPoint(absRelOffset.x+x,absRelOffset.y+y),
				1,commandStackItem.commandStack,true);
			}
			
			this.lastPoint =lastPoint;
			this.absRelOffset=absRelOffset;
			this.lastControlPoint=lastControlPoint;
						
			//pre calculate the bounds for this segment
			preDraw();
			
		}
			
		
	}
}