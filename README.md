# AWS IoT Workshop

## Version 1.0

Author: Faisal Usman
Role: AWS DevOps Engineer

# Creating an IoT Thing

In this guide, we will walk through the process of creating an IoT thing and setting up a MQTT client to communicate with it.

## Step 1: Create a Thing

1. Log in to the AWS Management Console.
2. Navigate to the AWS IoT service.
3. Click on "Manage" in the "Manage things" section.
4. Click on "Create" to create a new thing.
5. Provide a name for your thing and any additional optional attributes.
6. Click on "Create thing" to create the thing.

## Step 2: Create a Policy

1. In the AWS IoT Console, navigate to the "Secure" section.
2. Click on "Policies" and then "Create" to create a new policy.
3. Define a name for your policy and add the necessary permissions for your MQTT client.
4. Click on "Create" to create the policy.

## Step 3: Create a Certificate

1. In the AWS IoT Console, navigate to the "Secure" section.
2. Click on "Certificates" and then "Create" to create a new certificate.
3. Choose the type of certificate and click on "Create certificate".
4. Download the certificate, private key, and public key.
5. Make sure to save them in a secure location.

## Step 4: Download the AmazonRootCA Certificate

1. In the AWS IoT Console, navigate to the "Secure" section.
2. Click on "Settings" and then "Download" to download the AmazonRootCA certificate.
3. Save the AmazonRootCA certificate in the same directory as your MQTT client script.

## Step 5: Test the MQTT Client

1. Set up an MQTT client of your choice (e.g., Python Paho MQTT library).
2. Configure the MQTT client with the downloaded certificate, private key, public key, and the AmazonRootCA certificate.
3. Connect the MQTT client to the AWS IoT endpoint using the appropriate credentials and settings.
4. Subscribe to the desired topic to receive messages.
5. Publish messages to the thing's MQTT topic to send commands or data to the thing.

That's it! You have successfully created an IoT thing, set up the necessary certificates and policies, and tested the MQTT client to communicate with the thing.

Remember to follow the best practices for securing your IoT devices and communication.


