# Espressif USB customer-allocated PID repository

## What is this?

This is a repository for customer-allocated PIDs under the Espressif VID (0x303A). As getting your own
USB Vendor ID (VID) can be expensive for an individual or a company only making small runs of products, 
for customers using Espressif chips with USB functionality, we offer the option of using a PID 
allocated under the Espressif VID.

## When do I need this?

You would need a custom PID if you use a custom USB class on your ESP32 which needs a non-standard
driver on the host. If you use e.g. TinyUSB with the standard drivers it comes with, you would not
need a custom PID as TinyUSB by default already uses a pre-allocated PID specific to the classes 
selected.

## How do I get a PID in this range?

To get a PID, you can fork this repository, edit the allocated-pids.txt file and commit the changes. 
Please make sure to use the next available PID in the range allocated, for easy managing purposes we'd
like to keep the customer allocated PIDs sequential. Finally, file a pull request here so we can merge 
the result. Make sure to mention the following in the pull request:

- A short description of what the device is going to do (e.g. cat tracker with USB trace download)

- What chip are you using for the device the PID is allocated for (e.g. ESP32-S2)

- Why you need a custom PID (and can't, for instance, use the default TinyUSB PIDs)

- If you're requesting a PID on behalf of a company, please mention the name of the company

- If applicable/available, a website or other URL with information about your product or company

(Note that if your application specifically is designed to run on Espressif-built devboards, you will
need to edit allocated-pids-espressif-devboards.txt instead.)

After you have done that, we will get back to you soon to either merge the request (after which you're
free to use the PID) or to ask for clarification if needed. Note that we may need to ask you to rebase
your request to start at a new PID if someone elses request got merged before yours.

## Disclaimer

Espressif reserves the right to deny a pull request to this repository for any reason. A pull
request granted here does not mean endorsment of your product by Espressif, and should not be
used as such in marketing material etc. As a PID is just a number, having your pull request
merged here does not entitle you to anything; it simply serves as a cooperative way for people 
not to choose the same number for different products.
