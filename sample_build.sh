#sample build with docker image and jar file

docker run -it -d --name worwhere_jar openjdk:8-jdk-alpine 
git clone https://github.com/worzwhere/maven_docker.git target
docker cp target/sample_jar/hello-world-rest-api.jar worwhere_jar:/tmp
docker exec worwhere_jar ls /tmp
docker container commit worwhere_jar worzwhere/hello-world-rest-api:manual1
docker run worzwhere/hello-world-rest-api:manual1
docker container commit --change='CMD ["java","-jar","/tmp/hello-world-rest-api.jar"]' worwhere_jar worzwhere/hello-world-rest-api:manual2
docker run -p 8080:8080 worzwhere/hello-world-rest-api:manual2
