import paho.mqtt.publish as publish
import paho.mqtt.client as mqtt
import ssl
import time
import json
from config import (
    mqtt_host, 
    mqtt_port, 
    mqtt_client_id, 
    mqtt_cafile, 
    mqtt_certfile, 
    mqtt_keyfile, 
    thing_type,
    mqtt_publish_topic,
    mqtt_subscribe_topic,
    mqtt_lwt_topic,
    mqtt_payload
    )


tls = {
    "ca_certs": mqtt_cafile,
    "certfile": mqtt_certfile,
    "keyfile": mqtt_keyfile,
    "tls_version": ssl.PROTOCOL_TLSv1_2
}

def on_connect(client, userdata, flags, rc):
    print("Connected with result code " + str(rc))
    client.subscribe(mqtt_subscribe_topic)

def on_message(client, userdata, msg):
    print("Received message on topic: " + msg.topic)
    print("Payload: " + str(msg.payload))

def on_disconnect(client, userdata, rc):
    if rc != 0:
        print("Unexpected disconnection. Reconnecting...")
        client.reconnect()

def publish_messages():
    # Get the current POSIX timestamp
    timestamp = time.time()
    time.sleep(1)
    count = 0
    for i in range(24000):
        mqtt_payload_json = json.dumps(mqtt_payload)
        print(f"Payload: {mqtt_payload_json}")

        mqtt_client.publish(mqtt_publish_topic, mqtt_payload_json, 1, False)
        count = count + 1
        print(count)
        print("Message published on topic: {}".format(mqtt_publish_topic))
        time.sleep(0.05)
    print(count)
        
try:
    mqtt_client = mqtt.Client(client_id=mqtt_client_id, clean_session=True)
    mqtt_client.tls_set(**tls)
    mqtt_client.on_connect = on_connect
    mqtt_client.on_message = on_message
    mqtt_client.on_disconnect = on_disconnect
    mqtt_client.will_set(mqtt_lwt_topic, payload="Device is disconnected", qos=1, retain=False)
    mqtt_client.connect(mqtt_host, port=mqtt_port, keepalive=120)

    mqtt_client.loop_start()
    publish_messages()
    mqtt_client.disconnect()
    mqtt_client.loop_stop()

except KeyboardInterrupt:
    print("Interrupted by user. Disconnecting...")
    time.sleep(5)
    mqtt_client.disconnect()
    mqtt_client.loop_stop()
