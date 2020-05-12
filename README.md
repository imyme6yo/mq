# Microservice Architecture Communications

## TODOs
* [x] 1. Provision (ansible)
* [ ] 2. Message Queues
  * [ ] RabbitMQ
  * [ ] Kafka
    [Kafka 운영자가 말하는 처음 접하는 Kafka](https://www.popit.kr/kafka-%EC%9A%B4%EC%98%81%EC%9E%90%EA%B0%80-%EB%A7%90%ED%95%98%EB%8A%94-%EC%B2%98%EC%9D%8C-%EC%A0%91%ED%95%98%EB%8A%94-kafka/)
    [kafka docker connectivity](https://github.com/wurstmeister/kafka-docker/wiki/Connectivity)
    [Kafka on alpine](https://github.com/blacktop/docker-kafka-alpine)
    [Kafka on alpine Dockerfile](https://hub.docker.com/r/blacktop/kafka/dockerfile)
    [Kafka 이해하기](https://medium.com/@umanking/%EC%B9%B4%ED%94%84%EC%B9%B4%EC%97%90-%EB%8C%80%ED%95%B4%EC%84%9C-%EC%9D%B4%EC%95%BC%EA%B8%B0-%ED%95%98%EA%B8%B0%EC%A0%84%EC%97%90-%EB%A8%BC%EC%A0%80-data%EC%97%90-%EB%8C%80%ED%95%B4%EC%84%9C-%EC%9D%B4%EC%95%BC%EA%B8%B0%ED%95%B4%EB%B3%B4%EC%9E%90-d2e3ca2f3c2)
    * [ ] Zookeeper
  * [ ] Redis
* [ ] 3. Databases
  * [ ] mongdb
* [ ] 4. Services
  * [ ] echo-realtime (Go)
  * [ ] fastapi-realtime (Python)
  * [ ] folka-realtime (Node)
  * [ ] vibora-realtime (Python)
* [ ] 5. Test

## References
* [Setting up a Docker Swarm cluster using Docker in Docker](https://callistaenterprise.se/blogg/teknik/2017/12/18/docker-in-swarm-mode-on-docker-in-docker/)
* [Docker 및 Consul을 사용한 서비스 검색 : 1 부](http://www.smartjava.org/content/service-discovery-docker-and-consul-part-1/)
* [Docker swarm: 도커 스웜 사용후기 > 복수개의 컨테이너 손쉽게 관리하기](https://hidekuma.github.io/docker/swarm/docker-swarm/)
* [Automatic container registration with Consul and Registrator](https://jlordiales.me/posts/2015/02/automatic-container-registration-with-consul-and-registrator/)
* [Building an automatic environment using Consul and Docker – part 1](https://www.spirulasystems.com/blog/2015/06/25/building-an-automatic-environment-using-consul-and-docker-part-1/)
* [Docker Swarm – Single Node](https://www.spirulasystems.com/blog/2015/07/02/automatic-environment-using-consul-and-docker-swarm-part-2/)
* [Docker 앱에 대한 개발 워크플로](https://docs.microsoft.com/ko-kr/dotnet/architecture/microservices/docker-application-development-process/docker-app-development-workflow)