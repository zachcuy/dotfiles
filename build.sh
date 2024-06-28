mvn clean install -DskipTests spring-boot:run | tee "zachlog-$(date '+%Y-%m-%d_%H-%M-%S').txt"
