---
created: 2023-05-04
share: true
category: 经验
title: Kafka
---

> If we look at the world with a love of life, the world will reveal its beauty to us.
> — <cite>Daisaku Ikeda</cite>

### mac quick start
To deploy a Kafka server on macOS, you'll need to follow these steps:

1. Install Homebrew:

If you haven't installed Homebrew yet, you'll need to install it first. Homebrew is a package manager for macOS that makes it easy to install software. Open Terminal and run the following command:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install Java:

Apache Kafka requires Java to run. You can install the latest version of the OpenJDK using Homebrew:

```bash
brew install openjdk
```

Set the JAVA_HOME environment variable:

```bash
echo 'export JAVA_HOME="/usr/local/opt/openjdk"' >> ~/.zshrc
source ~/.zshrc
```

3. Install Kafka:

Now that you have Java installed, you can install Kafka using Homebrew:

```bash
brew install kafka
```

4. Start Zookeeper:

Kafka requires Zookeeper to manage its distributed nature. Start Zookeeper using the following command:

```bash
brew services start zookeeper
```

5. Start Kafka:

Start the Kafka server using the following command:

```bash
brew services start kafka
```

6. Verify Kafka installation:

You can verify that Kafka is running by creating a topic, a producer, and a consumer. First, create a test topic:

```bash
kafka-topics --create --topic test --partitions 1 --replication-factor 1 --bootstrap-server localhost:9092
```

Next, create a producer to send messages to the test topic:

```bash
kafka-console-producer --topic test --bootstrap-server localhost:9092
```

In a separate terminal window, create a consumer to receive messages from the test topic:

```bash
kafka-console-consumer --topic test --from-beginning --bootstrap-server localhost:9092
```

Now, you can type messages in the producer terminal, and they should appear in the consumer terminal.

That's it! You now have a Kafka server running on your macOS.


#### 相同方法
redis


### Kafka producer
import java.util.Properties;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.Producer;
import org.apache.kafka.clients.producer.ProducerRecord;

public class KafkaProducerExample {

    public static void main(String[] args) {
        // Set up the Kafka producer configuration
        Properties props = new Properties();
        props.put("bootstrap.servers", "localhost:9092");
        props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
        props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");

        // Create a Kafka producer instance
        Producer<String, String> producer = new KafkaProducer<>(props);

        // Define the topic
        String topic = "test";

        // Create a message to send
        String key = "exampleKey";
        String value = "Hello, Kafka!";

        // Create a ProducerRecord and send the message
        ProducerRecord<String, String> record = new ProducerRecord<>(topic, key, value);
        producer.send(record);

        // Close the producer
        producer.close();
    }
}

#### use wireshark to capture the traffic
To capture the traffic sent by the previous Kafka producer example using Wireshark, follow these steps:

1. Install Wireshark:
   If you haven't already, download and install Wireshark from the official website: https://www.wireshark.org/download.html

2. Run the Kafka producer example:
   Execute the Java Kafka producer example you've written to send the message to the `test` topic.

3. Start Wireshark and choose the network interface:
   Open Wireshark, and from the main window, select the network interface through which your machine is connected to the Kafka broker. Typically, it's the interface with an active IP address (e.g., Wi-Fi or Ethernet).

4. Apply a capture filter:
   To only capture the Kafka traffic, you can apply a capture filter in Wireshark. In the main window, next to the "Capture" button, enter the filter `tcp port 9092` (replace `9092` with the actual port number if your Kafka broker is running on a different port). Then, click "Capture" to start capturing the packets.

5. Analyze the captured packets:
   Wireshark will start capturing packets that match the filter. Look for packets with the "Protocol" column showing "TCP" and the "Info" column showing the source and destination port numbers as 9092 (or the port you set). You can also apply a display filter `tcp.port == 9092` to only show the Kafka traffic in the list.

Note that Wireshark does not have a built-in Kafka protocol dissector, so the packets will not be displayed with Kafka-specific protocol details. However, you can still analyze the TCP traffic between your producer and the Kafka broker.

If you're interested in decoding the Kafka protocol details, you can try using a custom Wireshark plugin like https://github.com/Financial-Times/kafkacat-wireshark-plugin, which adds support for decoding Kafka traffic. Follow the instructions in the plugin's README to install and use it.

#### Fun fact
every time create a producer, system create a new TCP connection.
