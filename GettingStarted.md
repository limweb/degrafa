# Using Degrafa #

Degrafa works with Flex2.0.1 and Flex3 (beta). If you don't have either of those, you can [download Flex 2.0.1](https://www.adobe.com/cfusion/tdrc/index.cfm?product=flex), or [download the beta of Flex 3](http://labs.adobe.com/technologies/flex/) from Adobe Labs.

  1. Download the latest version of the degrafa.swc from the Download page.
  1. Create a new Flex project in Flex Builder.
  1. In your Flex project, create a lib directory.
  1. Extract the degrafa.swc file from the .zip, and place it in the lib directory.
  1. Right click on the project name in the project Navigator, and select Properties.
  1. Select “Flex Build Path“ on the left.
  1. Select the “Library Path“ tab.
  1. Click the “Add SWC Folder“ button.
  1. Type in “lib“, press “OK“
  1. Press “OK“ to commit your changes.
  1. Degrafa is now available to use in your project. To use Degrafa, you need to use the proper XML Namespace: xmlns:degrafa=“http://www.degrafa.com/2007“
  1. Once the degrafa name space is added in your MXML file, you can use any of the Degrafa classes: <degrafa:Circle ... />