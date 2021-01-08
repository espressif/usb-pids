# What is this?

This is a repository for customer-allocated PIDs under the Espressif VID (0x303A). As getting your own
USB VID can be expensive for a company only making small runs of products, for customers using
Espressif chips with USB functionality, we offer the option of using a PID allocating under the
Espressif VID.

# When do I need this?

You would need a custom PID if you use a custom USB class on your ESP32 which needs a non-standard
driver on the host. If you use e.g. TinyUSB with the standard drivers it comes with, you would not
need a custom PID as TinyUSB by default already uses a pre-allocated PID specific to the classes 
selected.

# How do I get a PID in this range?

To get a PID, you can fork this repository, edit the allocated-pids.txt file and commit the changes. 
Please make sure to use the next available PID in the range allocated, for easy managing purposes we'd
like to keep the customer allocated PIDs sequential. Finally, file a pull request here so we can merge 
the result. Make sure to mention the following in the pull request:

- A short description of what the device is going to do (e.g. cat tracker with USB trace download)

- What chip are you using for the device the PID is allocated for (e.g. ESP32-S2)

- Why you need a custom PID (and can't, for instance, use the default TinyUSB PIDs)

- If you're requesting a PID on behalf of a company, please mention the name of the company

- If applicable/available, a website or other URL with information about your product or company

After you have done that, we will get back to you soon to either merge the request (after which you're
free to use the PID) or to ask for clarification if needed.
