# Technical assessment

This small set of exercises is intended to test some basic abilities as a software developer.

## Exercise 1

Clone this repository in your development machine. You should answer the questions below directly in this text file and commit the answers to your local copy of the repository.

## Exercise 2

Given the following piece of code, written in Java:

```java
public class SomethingIsWrong {
    public static void main(String[] args) {
        Rectangle myRect;
        myRect.width = 40;
        myRect.height = 50;
        System.out.println("myRect's area is " + myRect.area());
    }
}
```

a. What is wrong with the code?

R: Considering that exist the class **Rectangle** and the same are imported, the fields exists and are public. The only thing missing will be the object's initialization;

b. How can we fix it?

R:

```java
public class Rectangle {
    public int width;
    public int heigth;

    public int area(){
        return this.width * this.heigth;
    }

    public static void main(String[] args) {
        Rectangle myRect = new Rectangle();
        myRect.width = 10;
        myRect.heigth = 10;
        System.out.println("myRect's area is " + rectangle.area());
    }


}
```

## Exercise 3

Consider the following two classes:

```java
public class ClassA {
    public void methodOne(int i) {
    }
    public void methodTwo(int i) {
    }
    public static void methodThree(int i) {
    }
    public static void methodFour(int i) {
    }
}

public class ClassB extends ClassA {
    public static void methodOne(int i) {
    }
    public void methodTwo(int i) {
    }
    public void methodThree(int i) {
    }
    public static void methodFour(int i) {
    }
}
```

a. Which method overrides a method in the superclass?

R: **methodTwo**

b. Which method hides a method in the superclass?  

R: **methodThree**

c. What do the other methods do?

R: **methodOne, methodFour** static method can't override a normal method and static method can't override.

## Exercise 4

a. What is the difference between Dependency Inversion and Dependency Injection?

Dependency Inversion, aims to decrease the level of dependency of a project module, flexible systems should depends on interface or abstract class.

Dependency Injection has the objective to organize the initialization and the hierarchy of creation.

b. Why should we use each one?

R:
Dependency Inversion has the capacity to remove the higth dependency on external libraries, and convert to low level. This means that if a library is discontinued or a better one emerges, moving to another does not cause major problems or code changes.

Dependency injection helps orchestrate the creation of dependencies, especially in a layered architecture. It also helps in the creation of unique instances (Singletons).

## Exercise 5

At the root folder you will see two projects:

- [pokedex_android](./pokedex_android) which you open with [Android Studio](https://developer.android.com/studio)
- [pokedex_flutter](./pokedex_flutter) which you can open with [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)

Choose one of them (or even both!) to answer this exercise.

When you execute them you will see this screen:

<div align="center">
    <img src="./images/project_initial.png" width="40%">
</div>

<br/>
<br/>

You need to make the necessary changes for it look like this:

<div align="center">
    <img src="./images/project_complete.png" width="40%">
</div>

## Exercise 6

Create a private repository and push these exercises to it. Tip: add a new remote repository to your local git copy. Keep the repository private and grant access only to codehashi@codehashi.com.
