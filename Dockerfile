
FROM ubuntu as builder

RUN apt-get update
RUN apt-get install -y maven

RUN apt-get install -y git
RUN git clone https://github.com/RohithYogi/DevOps
WORKDIR DevOps

RUN mvn install

FROM openjdk:11-jre

COPY --from=builder /DevOps/target/Calculator-1.0-SNAPSHOT.jar /calculator/Calculator-1.0-SNAPSHOT.jar
CMD java -cp /calculator/Calculator-1.0-SNAPSHOT.jar com.calculator.Calculator
