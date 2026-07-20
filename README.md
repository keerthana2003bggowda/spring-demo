### 1. Spring Boot Application

spring-demo

A minimal Spring Boot REST API, containerized with Docker (multi-stage build) and deployed via a Jenkins CI/CD pipeline to Docker Hub and an EC2 host.

What this application does

spring-demo is a Spring Boot 3.x web application exposing two simple REST endpoints — built as a hands-on project to demonstrate an end-to-end CI/CD workflow .

Endpoints
Method	Path	Response
GET	       /	Hello from Spring Boot!
GET	    /hello	Hello World!


Once deployed, the app is reachable at:

http://<host>:9090/
http://<host>:9090/hello

Tech stack
Language / Framework: Java 21, Spring Boot (Spring Web starter)
Build tool: Maven (via mvnw wrapper)
Containerization: Docker (multi-stage build — Maven/JDK build stage → Alpine JRE runtime stage)
CI/CD: Jenkins (declarative pipeline)
Registry: Docker Hub
Code quality: SonarQube (sonar-project.properties present for scan config)
Deployment target: AWS EC2 

Project structure
spring-demo/
├── .mvn/                          # Maven wrapper support files
├── src/
│   └── main/
│       ├── java/com/demo/spring_demo/
│       │   ├── SpringDemoApplication.java   # Spring Boot entry point (@SpringBootApplication)
│       │   └── HelloController.java         # REST controller — "/" and "/hello" endpoints
│       └── resources/
│           ├── static/                      # Static web assets (if any)
│           ├── templates/                   # Server-side templates (if any)
│           └── application.properties       # App configuration
│   └── test/java/com/demo/spring_demo/
│       └── SpringDemoApplicationTests.java  # Default Spring Boot context load test
├── target/                        # Compiled build output (generated, not committed)
├── Dockerfile                     # Multi-stage image build definition
├── Jenkinsfile                    # Main CI/CD pipeline (build → push → deploy)
├── JenkinsfileD                   # Secondary/alternate pipeline variant
├── pom.xml                        # Maven project + dependency definitions
├── sonar-project.properties       # SonarQube scanner configuration
├── mvnw / mvnw.cmd                # Maven wrapper scripts (Linux/Windows)
├── .gitignore / .gitattributes    # Git config
└── README.md
