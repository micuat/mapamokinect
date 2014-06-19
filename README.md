mapamokinect
========

A [ProCamToolkit]( https://github.com/YCAMInterlab/ProCamToolkit ) addon for dynamic projection mapping by Kinect depth map.


Installation
========

    $ cd <oFdir>/addons
    $ git clone https://github.com/kylemcdonald/ofxCv.git
    $ git clone https://github.com/kylemcdonald/ofxControlPanel.git
    $ cd ../apps
    $ git clone https://github.com/YCAMInterlab/ProCamToolkit.git
    $ cd apps
    $ git clone https://github.com/micuat/mapamokinect.git


Setup
========

* a projector
* a Kinect
* cardboard boxes


Instructions
========

First, put a Kinect on a projector and pile up cardboard boxes in front of the projector like this.

![](http://cim.mcgill.ca/~nhieda/mapamokinect/01setup.jpg)

These boxes are only for calibration and cleared afterwards :) Make sure that at least six corners are covered by the projection and also visible to the Kinect. Launch mapamokinect and you'll see a screen like this.

![](http://cim.mcgill.ca/~nhieda/mapamokinect/02point.jpg)

Then, press `c` to freeze the point cloud. Now you are ready to calibrate. If you are unfamiliar with mapamok, read [the mapamok document]( https://github.com/YCAMInterlab/ProCamToolkit/wiki/mapamok-(English) ) for calibration procedures. You may select 5th tab of the control panel and increase `slowLerpRate` to make point dragging faster.

![](http://cim.mcgill.ca/~nhieda/mapamokinect/03freeze.jpg)

Once calibration is finished, turn off `setupMode`, select `mapping` in `drawMode` and choose `shader` in `shading`. Then, decrease `meshThreshold` so that the background is not captured anymore. Finally, press `tab` to hide the panel.

![](http://cim.mcgill.ca/~nhieda/mapamokinect/04ready.jpg)

You are ready to turn of the lights.

![](http://cim.mcgill.ca/~nhieda/mapamokinect/05projection.jpg)

Finally, clear the boxes and put whatever you want for projection mapping.

![](http://cim.mcgill.ca/~nhieda/mapamokinect/06projection.jpg)
