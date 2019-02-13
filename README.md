WireShark plugin to decode MQTT payload in WebSocket frames

Installation
============

Place the .lua file in WireShark's `./plugins/`; it will be loaded at startup.
Alternatively, past the file content in the _Lua Evaluate_ window (Tools > Lua > Evaluate)
and evaluate it.

Usage
=====

The plugin will automatically decode MQTT payload when the protocol has been negotiated as
such during WebSocket upgrade. The protocol will be displayed as "MQTT (WebSocket)",
the _info_ of the packet is defined by the MQTT dissector directly.

References
==========
- [WebSocket dissector](https://fossies.org/linux/wireshark/epan/dissectors/packet-websocket.c)
- [Lua dissector example](https://wiki.wireshark.org/Lua/Examples?action=AttachFile&do=get&target=dissector.lua)
