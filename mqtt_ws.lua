-- Decode MQTT payload in WebSocket frames
--
-- Uses the mechanism available to register a dissector for negotiated mqtt in WebSocket
-- See https://fossies.org/linux/wireshark/epan/dissectors/packet-websocket.c
do
  local mqtt_ws_proto_name = "MQTT (WebSocket)"

  mqtt_ws_proto = Proto("mqtt_ws", mqtt_ws_proto_name)

  mqtt_ws_proto.fields = {}
  
  function mqtt_ws_proto.init()
  end

  -- delegate to the MQTT dissector and override the protocol column
  function mqtt_ws_proto.dissector(buffer, pkt_info, tree)
    Dissector.get("mqtt"):call(buffer, pkt_info, tree)
    pkt_info.cols.protocol = mqtt_ws_proto_name
  end

  ws_dissector_table = DissectorTable.get("ws.protocol")
  -- register our dissector to handle "mqtt" data
  ws_dissector_table:add("mqtt", mqtt_ws_proto)
end