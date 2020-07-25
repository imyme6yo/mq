
# @AUTHOR: imyme6yo "imyme6yo@gmail.com"
# @DRAFT: 20200725
# @REFERENCE: 
#   https://kafka-python.readthedocs.io/en/master/usage.html
#   https://github.com/wurstmeister/kafka-docker
# Python modules
from time import sleep
from multiprocessing import Process

# Kafka modules
from kafka import KafkaConsumer
from kafka import KafkaProducer
from kafka import KafkaClient
from kafka.errors import KafkaError

def consumer_process(server):
    consumer = KafkaConsumer(
        'test_topic',
        api_version=(2, 5, 0),
        group_id="mq-service",
        bootstrap_servers=["mq-kafka:9092"]
        # bootstrap_servers=[server]
    )
    for message in consumer:
        # message value and key are raw bytes -- decode if necessary!
        # e.g., for unicode: `message.value.decode('utf-8')`
        print ("%s:%d:%d: key=%s value=%s" % (message.topic, message.partition,
                                            message.offset, message.key,
                                            message.value))

def on_success(record_metadata):
    print("Success")
    print(record_metadata.topic)
    print(record_metadata.partition)
    print(record_metadata.offset)
    print("")

def on_error(exception):
    print("Failure")
    print('error', exc_info=exception)
    print("")

def producer_process(server):
    # producer = KafkaProducer(api_version=(2, 5, 0), bootstrap_servers=[server]).add_callback(on_success).add_errback(on_error)
    # producer = KafkaProducer(api_version=(2, 5, 0), bootstrap_servers=[server])
    producer = KafkaProducer(api_version=(2, 5, 0), bootstrap_servers=["mq-kafka:9092"])
    for i in range(100):
        message = "{}".format(i)
        print("send msg")
        producer.send(
            'test_topic', 
            message.encode()
        )
        sleep(2)
        producer.flush()
        
if __name__ == '__main__':
    # client = KafkaClient(api_version=(2, 5, 0), bootstrap_servers=['mq-kafka:9092'])
    # print(client.cluster.brokers())
    # metadata = list(client.cluster.brokers())[0]

    # server = "{}:{}".format(metadata[1], metadata[2])
    server = "mq-kafka:9092"
    print(server)
    consumer = Process(target=consumer_process, args=(server,))
    producer = Process(target=producer_process, args=(server,))
    consumer.start()
    producer.start()

    consumer.join()
    producer.join()
