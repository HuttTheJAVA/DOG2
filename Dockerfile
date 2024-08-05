# Java 17을 사용하는 기본 이미지
FROM openjdk:17-jdk-alpine

# 컨테이너 내부의 작업 디렉토리 설정
WORKDIR /app

# 호스트에서 컨테이너로 JAR 파일 복사
COPY build/libs/your-application-name.jar /app/app.jar

# 애플리케이션이 사용하는 포트 노출
EXPOSE 8081

# JAR 파일 실행 명령어 설정
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
