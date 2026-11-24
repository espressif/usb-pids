# Espressif USB customer-allocated PID repository

## What is this?

This is a repository for customer-allocated PIDs under the Espressif VID (0x303A). Getting your
own USB Vendor ID (VID) can be expensive for an individual or a company only making small runs
of products. As such we offer the option of using a PID allocated under the Espressif VID.
You can use this service if your device contains an Espressif chip with a USB interface and
the requested PID is used for that interface.

## When do I need this?

You would need a custom PID if you use a custom USB class on your ESP32 which needs a non-standard
driver on the host. If you use e.g. TinyUSB with the standard drivers it comes with, you would not
need a custom PID as TinyUSB by default already uses a pre-allocated PID specific to the classes 
selected.

## How do I get a PID in this range?

[Open a PID request issue](https://github.com/espressif/usb-pids/issues/new?template=pid-request.yml) and fill in
the form. It asks for:

- A short description of what the device is going to do (e.g. cat tracker with USB trace download)

- What chip you are using for the device the PID is allocated for (e.g. ESP32-S2)

- Why you need a custom PID (and can't, for instance, use the default TinyUSB PIDs)

- The name of your company if you're requesting a PID on behalf of one, and the product name(s)

- If applicable/available, a website or other URL with information about your product or company

You don't need to pick a PID number. An automated check will comment on your request, usually within
minutes. If something is missing it will tell you what; just edit the issue and it checks again. Once a
maintainer approves the request, the next free PID(s) are assigned automatically, added to the list, and
posted as a comment on your issue. From then on you're free to use them.

If your application is specifically designed to run on unmodified Espressif-built devboards, choose that
option in the form; the PID will then be added to allocated-pids-espressif-devboards.txt instead.

## Disclaimer

Espressif reserves the right to deny a PID request for any reason. A PID
request granted here does not mean endorsment of your product by Espressif, and should not be
used as such in marketing material etc. As a PID is just a number, having your request
granted here does not entitle you to anything; it simply serves as a cooperative way for people 
not to choose the same number for different products.
