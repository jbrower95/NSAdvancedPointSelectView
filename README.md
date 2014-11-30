NSAdvancedPointSelectView


1. What is it?

  It's a quicker way to let your users of your OSX app click on things. It guesses where the user is heading to with their mouse
  and 'highlights' the item that the user is heading towards. If the user clicks once the item is selected, the supposed 
  item is clicked. It's fully customizable, fully integratable, and requires four files to be added in your project.
  
2. How do I use it?
  
  Download the repository and open it. Open the group called 'NSAdvancedPointSelect'. Copy this group and the included source
  files to your project, making sure to copy the source files if it asks.
  
  Anywhere you want to use this new view, either:
  
      a) Go into interface builder and change the class of your NSView to NSAdvancedPointSelectView. Anywhere you programatically
      modify this view, make sure you add
      
          #import "NSAdvancedPointSelectView.h"
          
      b) Just import the view file (use the above #import line)

3. TODO

  - Find a more effecient algorithm for determining whether or not a line (given by a point and a vector) intersects 
  a rectangle. The currently implemented code is pretty ineffecient, although functional.

4. LICENSE - This poorly written library is released under the MIT license -

The MIT License (MIT)

Copyright (c) 2014 Justin Brower

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
