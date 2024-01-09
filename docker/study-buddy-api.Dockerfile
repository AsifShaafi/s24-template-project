FROM openjdk:17 AS build

WORKDIR /build

COPY . .
RUN ./gradlew build --no-daemon -p .

FROM openjdk:17
WORKDIR /app
COPY --from=build /build/build/libs/build-1.0-SNAPSHOT.jar app.jar

# Running the app
ENTRYPOINT exec java $JAVA_OPTS -jar app.jar
