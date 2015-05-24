## How To Use Degrafa ##

This is a quick description of how to start using Degrafa. For more information you can refer to the samples at http://samples.degrafa.com or the documentation at http://docs.degrafa.com. If you don't have Degrafa installed, refer to the Getting Started wiki page.

**Drawing**

Anything that is drawn with Degrafa must be inside a `<Surface>` tag, like this:

```
<degrafa:Surface verticalCenter=“0“ horizontalCenter=“0“>
    <degrafa:GeometryGroup>
        <geometry:Circle/>
    </degrafa:GeometryGroup>
</degrafa:Surface>
```

With the 

&lt;Surface&gt;

 tags added you can start creating a composition using fills, strokes, geometry shapes, geometry groups, repeaters, etc. To draw a shape it must reside inside a Geometry Group, as shown in the following MXML code. You can have multiple Geometry Groups to create advanced compositions. You can also apply effects and filters to Geometry Groups.

```
<degrafa:GeometryGroup>
	<geometry:Circle/>
</degrafa:GeometryGroup>
```

In order for a shape to be visible when drawn, a fill or stroke must be used inline of a shape, or referenced by a shape. For example:

```
<geometry:Circle radius=“150“>
	<geometry:fill>
		<paint:SolidFill color=“#62ABCD“/>
	</geometry:fill>
</geometry:Circle>
```

Or you could reference a fill or stroke, like this:

```
<degrafa:fills>
	<paint:SolidFill id=”blueFill” color=“#62ABCD“/>
</degrafa:fills>

<geometry:Circle fill=“{blueFill}“ radius=“150“>
```

That's the basics. You can do a lot more and we'll try to add more “How to” information as we have more time. For more information, check out the samples at http://samples.degrafa.com or the documentation at http://docs.degrafa.com.