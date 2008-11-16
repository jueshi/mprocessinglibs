/**
 * Show how to discover devices 
 *
 * Mary Jane Soft - Marlon J. Manrique 
 *
 * http://mjs.darkgreenmedia.com
 * http://marlonj.darkgreenmedia.com 
 * 
 * Changes :
 * 
 * 1.0 (January - 2008) Initial Release  
 *
 * $Id: DiscoverDevices.pde 354 2008-01-14 16:59:08Z marlonj $
 */
import mjs.processing.mobile.mbt.*;

// Bluetooth library
MBt mBt;

// Message 
String message = "Press Any Key to Search";

/*
 * Init font properties and library objects 
 */
void setup()
{
  // Set font properties 
  textFont(loadFont());
  textAlign(CENTER);
  
  // Create library object 
  mBt = new MBt(this);
}

/*
 * Draw status information 
 */
void draw()
{
  background(0);
  text(message,width/2,height/2);
}

/* 
 * Listen keyboard events 
 */
void keyPressed()
{
  // Start a device discover 
  mBt.discoverDevices();
  message = "Searching ...";
}

/*
 * Listen library events 
 */
void libraryEvent(Object library, int event, Object data)
{
  // Check if event is Bluetooth 
  if(library == mBt)
  {
    switch(event)
    {
      // Update message according event 
      case MBt.EVENT_ERROR :
        message = (String) data;
        break;       
      case MBt.EVENT_DISCOVER_DEVICE :
        message = "Device : " + ((MDevice) data).name();
        break;
      case MBt.EVENT_DISCOVER_DEVICE_COMPLETED :
        message = "Devices Found : " + length((MDevice[]) data);
        break;
    }
  }
}
