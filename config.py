mqtt_host = "a2oacj4t29wjpx-ats.iot.eu-west-2.amazonaws.com"
mqtt_port = 8883
mqtt_client_id = "headset-02"
mqtt_cafile = "./aaa_certs/root.cert"
mqtt_certfile = "./aaa_certs/deviceCertAndCACert.crt"
mqtt_keyfile = "./aaa_certs/deviceCert.key"

thing_type = 'iot-headset-type-eu-west-2'
mqtt_publish_topic = f"iot/iot-headset-type-eu-west-2/device/0000002/publish"
mqtt_subscribe_topic = f"iot/iot-headset-type-eu-west-2/device/0000002/subscribe"
mqtt_lwt_topic = f"iot/{thing_type}/device/{mqtt_client_id}/lwt"


mqtt_payload = "c00006,7,801800,1000,700300,200,1e0,30000,2000e,6000,7001,800001,600,300000,2000e0,60000,4001c,c000"
