plugins {
    id("java")
    id("application")
}

group = "com.charlesbourget.lox"
version = "1.0-SNAPSHOT"

java.sourceCompatibility = JavaVersion.VERSION_17
java.targetCompatibility = JavaVersion.VERSION_17

val jar by tasks.getting(Jar::class) {
    manifest {
        attributes["Main-Class"] = "com.charlesbourget.lox.Lox"
    }
}

application {
    mainClass.set("com.charlesbourget.lox.Lox")
}
