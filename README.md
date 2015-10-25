# nashorn-shared-validation
This project demonstrates sharing validation logic between the browser and the application server running in Java.
 
Server-side validation is done in addition to the client-side validation to prevent anyone trying to bypass the JavaScript on the client.
On the server we are using Nashorn to execute the same JavaScript code that the browser used to score the password strength.

![Alt text](https://github.com/maximenajim/nashorn-shared-validation/raw/master/password-strength-validator.png "Password strength validation")


# Nashorn

Nashorn is Java’s embedded JavaScript engine that comes part of Java 8.  Nashorn will compile JavaScript to Java bytecode providing interoperability between Java and JavaScript code.  

# Installation instructions

To run:

```
mvn spring-boot:run
```

Then go to: http://localhost:8080/

To test the server-side validation you can disable the JavaScript in the browser by following these instructionsupda: http://www.computerhope.com/issues/ch000891.htm