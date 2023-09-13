---
created: 2023-05-06
share: true
category: 经验
title: 设计模式
---
> [!Question]
> tell me some real world example of Template pattern


### Brief Intro
Design patterns are reusable solutions to common problems that occur in software design. They can be grouped into three main categories: Creational, Structural, and Behavioral patterns. Here's a brief overview of each pattern and its usage:

Creational Patterns:
1. Singleton: Ensures that a class has only one instance and provides a global point of access to that instance. Useful when you need to control access to shared resources or maintain state across the application.
2. Factory Method: Defines an interface for creating objects, but allows subclasses to determine which class to instantiate. Useful when you want to delegate object creation to subclasses or have multiple ways to create objects based on runtime criteria.
3. Abstract Factory: Provides an interface for creating families of related or dependent objects without specifying their concrete classes. Useful when you have multiple product families and want to ensure that products from one family can work together.
4. Prototype: Specifies the kind of objects to create using a prototypical instance and creates new objects by cloning the prototype. Useful when object creation is expensive or complex, and you want to create new instances by copying an existing instance.
5. Builder: Separates the construction of a complex object from its representation, allowing the same construction process to create different representations. Useful when creating complex objects with many optional or varying components.

Structural Patterns:
1. Adapter: Converts the interface of a class into another interface that clients expect. Useful when you want to make incompatible interfaces work together.
2. Bridge: Decouples an abstraction from its implementation, allowing them to vary independently. Useful when both abstraction and implementation need to be extended or changed frequently.
3. Composite: Composes objects into tree structures to represent part-whole hierarchies, allowing clients to treat individual objects and compositions uniformly. Useful when working with hierarchies of objects or recursive structures.
4. Decorator: Attaches additional responsibilities to an object dynamically, providing a flexible alternative to subclassing for extending functionality. Useful when you want to add or remove functionality from an object at runtime.
5. Facade: Provides a unified interface to a set of interfaces in a subsystem, defining a higher-level interface that makes the subsystem easier to use. Useful when you want to simplify access to a complex system or provide a single entry point.
6. Flyweight: Uses sharing to support a large number of fine-grained objects efficiently, reducing the memory overhead of object instances. Useful when dealing with a large number of similar objects with shared state.
7. Proxy: Provides a surrogate or placeholder for another object to control access to it. Useful when you need to add functionality to an object, like access control, caching, or remote access, without changing its implementation.

Behavioral Patterns:
1. Chain of Responsibility: Gives more than one object a chance to handle a request, creating a chain of potential handlers. Useful when you want to avoid coupling the sender of a request to its receiver or allow multiple handlers to process a request.
2. Command: Encapsulates a request as an object, allowing you to parameterize clients with different requests, queue or log requests, and support undoable operations. Useful when you want to decouple the object that invokes an action from the object that performs it.
3. Interpreter: Defines a representation for a grammar and provides an interpreter to deal with instances of the language. Useful when you need to interpret a specialized language or build a parser for a simple grammar.
4. Iterator: Provides a way to access the elements of an aggregate object sequentially without exposing its underlying representation. Useful when you need to traverse a collection of objects without revealing its implementation details.
5. Mediator: Defines an object that encapsulates how a set of objects interact, promoting loose coupling by keeping objects from referring to each other explicitly. Useful when you want to simplify communication between a group of objects or reduce dependencies between them.

6. Memento: Captures and externalizes an object's internal state without violating encapsulation so that it can be restored later. Useful when you need to provide undo/redo functionality or save the state of an object for later use.

7. Observer: Defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically. Useful when you need to keep multiple objects in sync with the state of another object, such as in a Model-View-Controller (MVC) architecture.

8. State: Allows an object to alter its behavior when its internal state changes, appearing as if the object changed its class. Useful when an object's behavior depends on its state, and the object must change its behavior at runtime based on that state.

9. Strategy: Defines a family of algorithms, encapsulates each one, and makes them interchangeable. It allows the algorithm to vary independently from clients that use it. Useful when you have multiple ways to perform a task and want to switch between them at runtime.

10. Template Method: Defines the skeleton of an algorithm in an operation, deferring some steps to subclasses. It allows subclasses to redefine certain steps of the algorithm without changing the algorithm's structure. Useful when you have a common algorithm with varying parts that can be overridden by subclasses.

11. Visitor: Represents an operation to be performed on the elements of an object structure, allowing you to define new operations without changing the classes of the elements on which they operate. Useful when you need to perform multiple, unrelated operations on a collection of objects without modifying their implementation.

These design patterns provide a reusable solution to common problems in software design, helping developers write more efficient, modular, and maintainable code. By understanding the purpose and usage of each pattern, you can choose the most appropriate one to solve a particular problem in your project.


#### Why
Design patterns are used in software development for several reasons:

1. **Reusability**: Design patterns provide solutions that are proven to solve common problems effectively. These solutions are reusable across different projects, thus reducing the time and effort required to develop software.

2. **Understandability**: Design patterns provide a standard terminology and are easy to understand. They describe how a problem is solved, making it easier for developers to communicate with each other.

3. **Efficiency**: Design patterns often increase efficiency by reducing the number of bugs and problems that can arise during development. They have been proven over time and tested in many different situations to ensure they provide an efficient solution.

4. **Modularity**: Design patterns can help to improve the structure of your code and make it more modular. This makes your code easier to read, understand, and maintain.

5. **Best Practices**: Design patterns embody best practices for object-oriented design and programming. By using design patterns, you ensure that your software is built upon sound design principles.

6. **Design Flexibility**: Design patterns provide solutions that are flexible and can accommodate future changes. They help prevent minor changes in one part of a program from impacting other parts of the program.

7. **Reduce Development Time**: Because design patterns provide prepackaged paradigms for software development, they reduce development time since they provide tested, proven development paradigms.

Remember, while design patterns are powerful tools, they should not be forced into places where they are not needed. The key to effectively using design patterns is knowing when to use them and understanding how they can be adapted to fit in your software design.

#### Structure, Behavior, Constructor - Why categorize like this?
Design patterns are divided into three types: Creational, Structural, and Behavioral patterns. This categorization is based on what the patterns do and their area of focus.

1. **Creational Patterns**: These patterns deal with object creation mechanisms, trying to create objects in a manner suitable to the situation. Examples include Singleton, Factory Method, and Abstract Factory. These patterns abstract the instantiation process and help make the system independent of how its objects are created, composed, and represented.

2. **Structural Patterns**: These patterns deal with the composition of classes or objects. They help ensure that when parts of a system change, the entire structure does not need to change. This leads to a system that is easier to manage and also promotes flexibility. Examples include Adapter, Bridge, and Composite. These patterns explain how to assemble objects and classes into larger structures, while keeping these structures flexible and efficient.

3. **Behavioral Patterns**: These patterns deal with communication between objects, how objects operate and interact, how responsibilities are distributed, and how the objects cooperate. Examples include Observer, Strategy, and Template Method. These patterns are concerned with algorithms and the assignment of responsibilities between objects.

So, patterns are classified as Structural or Behavioral based on whether they primarily address issues of composition (how objects are composed from other objects) or behavior (how objects interact and distribute responsibilities).


### 行为 Behavior
These patterns deal with communication between objects, how objects operate and interact, how responsibilities are distributed, and how the objects cooperate. Examples include Observer, Strategy, and Template Method. These patterns are concerned with algorithms and the assignment of responsibilities between objects.

#### 命令 Command
The Command pattern is a behavioral design pattern that turns a request into a stand-alone object that contains all information about the request. This transformation lets you pass requests as a method argument, delay or queue a request's execution, and support undoable operations. Here are a few real-world examples of the Command pattern:

1. **Graphical User Interfaces (GUIs)**: In a GUI, user actions (like clicks, keypresses, menu selections, etc.) are often implemented as command objects. This lets the GUI framework trigger these commands in response to user actions without knowing the exact function that will be performed. It also makes it easy to add new user actions - just create a new Command subclass.

2. **Remote Procedure Calls (RPCs)**: In a distributed system, commands can be used to encapsulate a request as an object, which can then be transferred over the network and invoked on a remote service.

3. **Job Queues**: In a job queue or a thread pool, commands can be used to represent jobs to be performed. The command object encapsulates the work to be done, and it can be added to the queue and executed later by a wotopicrker thread.

4. **Undo/Redo Functionality**: The Command pattern can also be used to implement undo/redo functionality. Each action a user takes is stored as a command object in a history list. To undo an action, the command object can perform a reverse operation. To redo an action, the command object can simply execute its action again.

Here's a simple code example in Java:

```java
public interface Command {
    void execute();
    void undo();
}

public class LightOnCommand implements Command {
    private Light light;

    public LightOnCommand(Light light) {
        this.light = light;
    }

    public void execute() {
        light.turnOn();
    }

    public void undo() {
        light.turnOff();
    }
}

public class LightOffCommand implements Command {
    private Light light;

    public LightOffCommand(Light light) {
        this.light = light;
    }

    public void execute() {
        light.turnOff();
    }

    public void undo() {
        light.turnOn();
    }
}

public class Light {
    public void turnOn() {
        // Turn on the light
    }

    public void turnOff() {
        // Turn off the light
    }
}

public class RemoteControl {
    private Command command;

    public void setCommand(Command command) {
        this.command = command;
    }

    public void pressButton() {
        command.execute();
    }

    public void pressUndo() {
        command.undo();
    }
}
```

In this example, `LightOnCommand` and `LightOffCommand` are concrete command classes that encapsulate actions on a `Light` object. The `RemoteControl` class uses these command objects to perform actions, but it is decoupled from the actual objects performing the actions.

#### 访问 Vistor
The Visitor pattern is particularly useful when you need to perform multiple, unrelated operations on a collection of objects without modifying their implementation. Here are some real-world examples of the Visitor pattern:

1. Document rendering: Imagine you have a document object model (DOM) that represents a structured document with elements like paragraphs, headings, lists, images, and tables. You may need to render the document in different formats, such as HTML, PDF, or plain text. The Visitor pattern allows you to create separate visitor classes for each rendering format, keeping the rendering logic separate from the DOM structure.

```java
interface DocumentElement {
    void accept(DocumentRenderer visitor);
}

class Paragraph implements DocumentElement { /*...*/ }
class Heading implements DocumentElement { /*...*/ }
class Image implements DocumentElement { /*...*/ }

interface DocumentRenderer {
    void visit(Paragraph paragraph);
    void visit(Heading heading);
    void visit(Image image);
}

class HTMLRenderer implements DocumentRenderer { /*...*/ }
class PDFRenderer implements DocumentRenderer { /*...*/ }
class PlainTextRenderer implements DocumentRenderer { /*...*/ }
```

2. File system traversal: In a file system application, you may have a hierarchy of file and directory objects. You may need to perform various operations on these objects, such as calculating the total size, counting the number of files, searching for a specific file, or generating a report. The Visitor pattern can be used to separate these operations from the file system object structure.

```java
interface FileSystemElement {
    void accept(FileSystemVisitor visitor);
}

class File implements FileSystemElement { /*...*/ }
class Directory implements FileSystemElement { /*...*/ }

interface FileSystemVisitor {
    void visit(File file);
    void visit(Directory directory);
}

class SizeCalculator implements FileSystemVisitor { /*...*/ }
class FileCounter implements FileSystemVisitor { /*...*/ }
class FileSearcher implements FileSystemVisitor { /*...*/ }
class ReportGenerator implements FileSystemVisitor { /*...*/ }
```

3. Syntax tree traversal: In a compiler, the abstract syntax tree (AST) is a representation of the source code's structure. The compiler may need to perform various operations on the AST, such as semantic analysis, optimization, or code generation. The Visitor pattern enables you to create separate visitor classes for each operation, keeping the operation logic separate from the AST structure.

```java
interface ASTNode {
    void accept(ASTVisitor visitor);
}

class VariableDeclaration implements ASTNode { /*...*/ }
class FunctionCall implements ASTNode { /*...*/ }
class Assignment implements ASTNode { /*...*/ }

interface ASTVisitor {
    void visit(VariableDeclaration node);
    void visit(FunctionCall node);
    void visit(Assignment node);
}

class SemanticAnalyzer implements ASTVisitor { /*...*/ }
class Optimizer implements ASTVisitor { /*...*/ }
class CodeGenerator implements ASTVisitor { /*...*/ }
```

In each of these examples, the Visitor pattern allows you to separate the operations from the object structure, making it easier to add new operations without modifying the existing classes.

#### 状态 State
The State pattern is a behavioral design pattern that allows an object to change its behavior when its internal state changes. The object will appear to change its class. Here are a few real-world examples:

1. **Order Processing Systems**: The state pattern is quite commonly used in order processing systems where an order can have multiple states like New, Approved, Fulfilled, etc. The behavior of the order changes as its state changes. For example, you can cancel a New order, but you can't cancel a Fulfilled order.

2. **Traffic Light System**: A traffic light system could have states like Red, Yellow, and Green, each with different behaviors: Red would mean stop, Green would mean go, and Yellow would mean caution. The state pattern allows the traffic light to change its behavior when its state changes.

3. **Mobile Phone Ringer Modes**: A mobile phone can have various ringer modes like Silent, Vibrate, and Loud, each with different behaviors. The state pattern allows the mobile phone to change its behavior when its ringer mode changes.

Here's a simple Java code example of a traffic light system:

```java
public interface TrafficLightState {
    void action();
}

public class RedLightState implements TrafficLightState {
    public void action() {
        System.out.println("Stop!");
    }
}

public class YellowLightState implements TrafficLightState {
    public void action() {
        System.out.println("Caution!");
    }
}

public class GreenLightState implements TrafficLightState {
    public void action() {
        System.out.println("Go!");
    }
}

public class TrafficLight {
    private TrafficLightState state;

    public void setState(TrafficLightState state) {
        this.state = state;
    }

    public void change() {
        state.action();
    }
}

public class Client {
    public static void main(String[] args) {
        TrafficLight light = new TrafficLight();
        light.setState(new RedLightState());
        light.change();  // Outputs: Stop!
        light.setState(new GreenLightState());
        light.change();  // Outputs: Go!
    }
}
```

In this example, `TrafficLight` changes its behavior when its state (`TrafficLightState`) changes. Each state implementation defines the `action()` method differently.

#### 责任 Chain
The Chain of Responsibility pattern is a behavioral design pattern that allows an object to send a command down a chain of receiver objects. A request can be sent from one object to another along this chain until it is processed or the chain is exhausted. 

Here are some real-world examples:

1. **Event Handling in Graphical User Interfaces (GUIs)**: In many GUI frameworks, when an event happens (like a mouse click), the event is sent to the component under the mouse pointer. If the component doesn't handle the event, it's passed up to its parent, then to its parent's parent, and so on, up to the top-level component. This is an example of the Chain of Responsibility pattern.

2. **Middleware in Web Server Frameworks**: In web server frameworks like Express.js for Node.js, middleware functions form a chain of responsibility. Each function can process the request and response objects, and either end the chain by sending a response to the client, or pass control to the next middleware function in the chain.

3. **Logging Frameworks**: Logging libraries often allow multiple logging handlers to be configured (for example, to log messages to the console, a file, or over the network). A log message is passed to each handler in turn until it is handled.

4. **Input/Output (I/O) Handling in Java**: Java’s I/O streams are built around the decorator and chain of responsibility patterns. The `java.io.InputStream`, `java.io.OutputStream`, `java.io.Reader`, and `java.io.Writer` are all abstract classes that are part of a chain of responsibility.

Here's a simple Java code example of a logging system:

```java
public abstract class Logger {
    protected Logger next;
    protected int level;

    public void setNext(Logger next) {
        this.next = next;
    }

    public void log(int level, String message) {
        if (this.level <= level) {
            write(message);
        }
        if (next != null) {
            next.log(level, message);
        }
    }

    protected abstract void write(String message);
}

public class ConsoleLogger extends Logger {
    public ConsoleLogger(int level) {
        this.level = level;
    }

    protected void write(String message) {
        System.out.println("Console: " + message);
    }
}

public class FileLogger extends Logger {
    public FileLogger(int level) {
        this.level = level;
    }

    protected void write(String message) {
        // write message to a file
    }
}

public class Client {
    public static void main(String[] args) {
        Logger consoleLogger = new ConsoleLogger(1);
        Logger fileLogger = new FileLogger(2);

        consoleLogger.setNext(fileLogger);
        
        consoleLogger.log(2, "A message");  // Outputs: Console: A message
    }
}
```

In this example, `Logger` forms a chain of responsibility. Each `Logger` either handles a message by writing it (if the message's level is equal to or higher than the logger's level) or passes it to the next logger in the chain.

#### 解释 Interpreter
The Interpreter pattern is a behavioral design pattern that specifies how to evaluate sentences in a language. It's used to interpret a particular grammar or language. This pattern involves implementing an expression interface which tells how to interpret a particular context.

Here are a few real-world examples:

1. **Regular Expressions**: Regular expressions are a prime example of the Interpreter pattern. They define a grammar for simple string patterns, and a regex engine interprets these patterns to perform operations like search and replace.

2. **SQL Parsing**: SQL interpreters convert SQL queries into commands that can be used to perform operations on a database. The SQL language is a consistent set of symbols and structures, making it a perfect fit for an interpreter.

3. **Programming Language Compilers and Interpreters**: Many parts of a compiler are interpreters. For instance, the parser that reads the source code is an interpreter. It reads the language's keywords and operators, interprets the structures, and builds an abstract syntax tree.

Here's a simple Java code example of the Interpreter pattern:

```java
interface Expression {
    boolean interpret(String context);
}

class TerminalExpression implements Expression {
    private String data;

    public TerminalExpression(String data){
        this.data = data; 
    }

    public boolean interpret(String context){
        if(context.contains(data)){
            return true;
        }
        return false;
    }
}

class OrExpression implements Expression {
    private Expression expr1 = null;
    private Expression expr2 = null;

    public OrExpression(Expression expr1, Expression expr2) { 
        this.expr1 = expr1;
        this.expr2 = expr2;
    }

    public boolean interpret(String context) { 
        return expr1.interpret(context) || expr2.interpret(context);
    }
}

public class InterpreterPatternDemo {

   //Rule: Robert and John are male
   public static Expression getMaleExpression(){
      Expression robert = new TerminalExpression("Robert");
      Expression john = new TerminalExpression("John");
      return new OrExpression(robert, john); 
   }

   public static void main(String[] args) {
      Expression isMale = getMaleExpression();
      System.out.println("John is male? " + isMale.interpret("John")); // Outputs: John is male? true
   }
}
```

In this example, `Expression` defines a method `interpret()`. The `TerminalExpression` class implements `Expression` and checks if the data is in the context. The `OrExpression` class also implements `Expression` and checks if either `expr1` or `expr2` is in the context.

#### 遍历 Iterator
The Iterator pattern is a behavioral design pattern that allows sequential traversal through a complex data structure without exposing its internal details. Thanks to the Iterator, clients can go over elements of different collections in a similar fashion using a single iterator interface.

Here are some real-world examples:

1. **Database Cursors**: A database cursor works like an iterator. It allows traversing records in a database. The client code doesn't need to understand the underlying complexity of the database structure.

2. **File System Traversal**: When you list files in a directory, and that directory contains subdirectories, you often want to list files in those subdirectories as well, and their subdirectories, and so on. An iterator can be used to traverse the file system tree structure in a way that's transparent to the client code.

3. **Java's Iterable and Iterator Interfaces**: In Java, the `Iterable` and `Iterator` interfaces provide a way to iterate over any collection, list, set, or map. The client code doesn't need to understand the underlying data structure.

Here's a simple Java code example of the Iterator pattern:

```java
import java.util.Iterator;
import java.util.NoSuchElementException;

public class ArrayIterator<T> implements Iterator<T> {
    private T[] array;
    private int position = 0;

    public ArrayIterator(T[] array) {
        this.array = array;
    }

    @Override
    public boolean hasNext() {
        return position < array.length;
    }

    @Override
    public T next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        return array[position++];
    }
}

public class Client {
    public static void main(String[] args) {
        Integer[] array = new Integer[] {1, 2, 3, 4, 5};
        ArrayIterator<Integer> iterator = new ArrayIterator<>(array);
        while (iterator.hasNext()) {
            System.out.println(iterator.next());  // Outputs: 1, 2, 3, 4, 5
        }
    }
}
```

In this example, `ArrayIterator` is an iterator for arrays. The client code doesn't need to understand how arrays work; it can just use the iterator to go through the elements.

#### 记忆 Memento
The Memento pattern is a behavioral design pattern that allows making snapshots of an object’s state and restoring it in future. The Memento pattern is used when we want to save the state of an object and restore it later, while encapsulating the details of how the state is saved.

Here are a few real-world examples:

1. **Undo Mechanism in Software Tools**: The undo feature in software applications like text editors, graphics editors, database transaction management etc., where the previous state of the object (text, image, database records) is stored in a memento, so it can be restored if necessary.

2. **Snapshots in Virtual Systems**: Virtual machine software or game emulators often provide a snapshot feature. They save the current state of a machine or game, so you can go back to that state later if you need to.

3. **Serialization**: Serialization mechanism provided by many programming languages can be considered as an example of Memento pattern where the object state is saved into a file or a database and it can be restored at a later point of time.

Here's a simple Java code example of the Memento pattern:

```java
public class Originator {
    private String state;

    public void setState(String state) {
        this.state = state;
    }

    public Memento saveStateToMemento() {
        return new Memento(state);
    }

    public void getStateFromMemento(Memento memento) {
        state = memento.getState();
    }
}

public class Memento {
    private String state;

    public Memento(String state) {
        this.state = state;
    }

    public String getState() {
        return state;
    }
}

public class CareTaker {
    private List<Memento> mementoList = new ArrayList<Memento>();

    public void add(Memento state) {
        mementoList.add(state);
    }

    public Memento get(int index) {
        return mementoList.get(index);
    }
}

public class MementoPatternDemo {
    public static void main(String[] args) {
        Originator originator = new Originator();
        CareTaker careTaker = new CareTaker();

        originator.setState("State #1");
        careTaker.add(originator.saveStateToMemento());

        originator.setState("State #2");
        careTaker.add(originator.saveStateToMemento());

        originator.getStateFromMemento(careTaker.get(0));
        System.out.println("Current State: " + originator.getState()); // Outputs: Current State: State #1
    }
}
```

In this example, `Originator` creates a `Memento` object to save its state. The `CareTaker` object keeps track of multiple memento objects and can restore the state of the Originator to a previous state using a memento object.

#### 观察 Observer
The Observer pattern is a behavioral design pattern that defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.

Here are a few real-world examples:

1. **News Subscriptions**: When you subscribe to a news site or a blog, you are essentially adding yourself as an observer of that resource. Whenever a new article or post is added, all subscribers are notified.

2. **Event Management Systems**: In event-driven systems, events or messages are sent to observers that have registered to listen to these events. 

3. **Model-View-Controller (MVC) Architecture**: In MVC, the model notifies its associated views and controllers when there has been a change in its state. This allows the views to update and show the current state.

4. **Stock Market**: Investors can subscribe to certain stocks. Whenever the price changes, the investors are notified.

5. **Social Media Notifications**: In social media platforms, users can follow or subscribe to other users' profiles. When the followed user posts new content, all the followers get notified.

Here's a simple Java code example of the Observer pattern:

```java
import java.util.ArrayList;
import java.util.List;

interface Observer {
    void update(String message);
}

class ConcreteObserver implements Observer {
    private String observerName;

    public ConcreteObserver(String observerName) {
        this.observerName = observerName;
    }

    @Override
    public void update(String message) {
        System.out.println(observerName + " received: " + message);
    }
}

interface Subject {
    void register(Observer observer);
    void unregister(Observer observer);
    void notifyObservers(String message);
}

class ConcreteSubject implements Subject {
    private List<Observer> observers = new ArrayList<>();

    @Override
    public void register(Observer observer) {
        observers.add(observer);
    }

    @Override
    public void unregister(Observer observer) {
        observers.remove(observer);
    }

    @Override
    public void notifyObservers(String message) {
        for (Observer observer : observers) {
            observer.update(message);
        }
    }
}

public class ObserverPatternDemo {
    public static void main(String[] args) {
        ConcreteSubject subject = new ConcreteSubject();

        Observer observer1 = new ConcreteObserver("Observer 1");
        Observer observer2 = new ConcreteObserver("Observer 2");

        subject.register(observer1);
        subject.register(observer2);

        subject.notifyObservers("Hello, World!");  // Both observers receive this message
    }
}
```

In this example, `ConcreteSubject` is an observable object. `Observer1` and `Observer2` are observers. When `ConcreteSubject` calls `notifyObservers()`, all registered observers are notified.

#### 状态 State
The State pattern is a behavioral design pattern that allows an object to change the behavior when its internal state changes. 

Here are a few real-world examples:

1. **Vending Machines**: Vending machines have states based on the inventory, amount of currency inserted, the item selected, etc. Depending on these states, the behavior of the vending machine changes. For example, if no currency is inserted, the machine may not allow any selections.

2. **Traffic Lights**: A traffic light has different states (red, yellow, green) and changes its behavior based on its current state. For example, when it's red, cars should stop; when it's green, cars can go.

3. **User Account States**: In a system that manages user accounts, an account can have various states: active, inactive, suspended, closed, etc. The actions that can be performed on the account depend on the state it is in.

4. **Online Order Processing**: In an online shopping application, an order may have several states: new, paid, shipped, delivered, cancelled. The actions that can be performed on the order, as well as the order's behavior, depend on its current state.

Here's a simple Java code example of the State pattern:

```java
interface State {
    void handleRequest();
}

class ConcreteStateA implements State {
    @Override
    public void handleRequest() {
        System.out.println("Handling request by state A");
    }
}

class ConcreteStateB implements State {
    @Override
    public void handleRequest() {
        System.out.println("Handling request by state B");
    }
}

class Context {
    private State state;

    public Context(State state) {
        this.state = state;
    }

    public void setState(State state) {
        this.state = state;
    }

    public void request() {
        state.handleRequest();
    }
}

public class StatePatternDemo {
    public static void main(String[] args) {
        Context context = new Context(new ConcreteStateA());
        context.request();  // Outputs: Handling request by state A

        context.setState(new ConcreteStateB());
        context.request();  // Outputs: Handling request by state B
    }
}
```

In this example, `Context` is an object whose behavior changes when its state changes. `State` is an interface that defines a common interface for all concrete states. `ConcreteStateA` and `ConcreteStateB` are concrete state classes that implement the `State` interface and provide the actual behavior for the state.

#### 策略 Strategy
The Strategy pattern is a behavioral design pattern that lets you define a family of algorithms, put each of them into a separate class, and make their objects interchangeable. It allows the algorithm to be selected at runtime.

Here are a few real-world examples:

1. **Travel Planning**: Depending on factors such as distance, cost, and time, you may choose different modes of transportation - car, train, airplane, bicycle, etc. These are different strategies for reaching your destination.

2. **Compression Algorithms**: Applications like WinRAR or 7-Zip support different compression algorithms (ZIP, RAR, TAR, GZ, etc.). The user can choose which algorithm to use when compressing files.

3. **Payment Methods**: In an e-commerce application, a customer can choose different payment strategies - credit card, PayPal, bank transfer, cash on delivery, etc.

4. **Image Rendering**: Graphics software often allows rendering images with different algorithms. Each algorithm can be represented as a strategy.

Here's a simple Java code example of the Strategy pattern:

```java
interface Strategy {
    void execute();
}

class ConcreteStrategyA implements Strategy {
    @Override
    public void execute() {
        System.out.println("Strategy A");
    }
}

class ConcreteStrategyB implements Strategy {
    @Override
    public void execute() {
        System.out.println("Strategy B");
    }
}

class Context {
    private Strategy strategy;

    public Context(Strategy strategy) {
        this.strategy = strategy;
    }

    public void setStrategy(Strategy strategy) {
        this.strategy = strategy;
    }

    public void executeStrategy() {
        strategy.execute();
    }
}

public class StrategyPatternDemo {
    public static void main(String[] args) {
        Context context = new Context(new ConcreteStrategyA());
        context.executeStrategy();  // Outputs: Strategy A

        context.setStrategy(new ConcreteStrategyB());
        context.executeStrategy();  // Outputs: Strategy B
    }
}
```

In this example, `Strategy` is an interface that defines a method for executing an algorithm. `ConcreteStrategyA` and `ConcreteStrategyB` implement this interface with specific algorithms. `Context` uses a `Strategy` to execute a selected algorithm.

#### 模板 Template
The Template Method pattern is a behavioral design pattern that defines the skeleton of an algorithm in a base class but lets subclasses override specific steps of the algorithm without changing its structure.

Here are a few real-world examples:

1. **Data Mining Tasks**: Different data mining algorithms can follow the same process - data collection, data cleaning, data analysis, and result generation. However, the specifics of each step can vary. This can be handled using the Template Method pattern.

2. **Cooking Recipes**: A recipe for cooking an item could be viewed as a template. The steps are the same - gather ingredients, prepare ingredients, combine ingredients, cook, and serve - but the specifics can be different for each recipe.

3. **Software Development Process**: The steps to develop software - requirements gathering, design, implementation, testing, deployment - are the same, but the specifics of each step can change depending on the project.

4. **Web Page Generation**: In web development, web pages often follow the same structure - header, body, and footer. The specifics of what goes into the header, body, and footer can vary from one page to another.

Here's a simple Java code example of the Template Method pattern:

```java
abstract class AbstractClass {
    final void templateMethod() {
        primitiveOperation1();
        primitiveOperation2();
        // ...
    }

    abstract void primitiveOperation1();
    abstract void primitiveOperation2();
}

class ConcreteClassA extends AbstractClass {
    void primitiveOperation1() {
        System.out.println("ConcreteClassA.primitiveOperation1");
    }

    void primitiveOperation2() {
        System.out.println("ConcreteClassA.primitiveOperation2");
    }
}

class ConcreteClassB extends AbstractClass {
    void primitiveOperation1() {
        System.out.println("ConcreteClassB.primitiveOperation1");
    }

    void primitiveOperation2() {
        System.out.println("ConcreteClassB.primitiveOperation2");
    }
}

public class TemplateMethodPatternDemo {
    public static void main(String[] args) {
        AbstractClass instance = new ConcreteClassA();
        instance.templateMethod();  // Outputs: ConcreteClassA.primitiveOperation1
                                   //           ConcreteClassA.primitiveOperation2

        instance = new ConcreteClassB();
        instance.templateMethod();  // Outputs: ConcreteClassB.primitiveOperation1
                                   //           ConcreteClassB.primitiveOperation2
    }
}
```

In this example, `AbstractClass` defines a template method `templateMethod()` that defines the skeleton of an algorithm. The steps of the algorithm are implemented in methods `primitiveOperation1()` and `primitiveOperation2()`. `ConcreteClassA` and `ConcreteClassB` provide their own implementations of these methods.


### 结构 Structure
These patterns deal with the composition of classes or objects. They help ensure that when parts of a system change, the entire structure does not need to change. This leads to a system that is easier to manage and also promotes flexibility. Examples include Adapter, Bridge, and Composite. These patterns explain how to assemble objects and classes into larger structures, while keeping these structures flexible and efficient.

#### 适配 Adapter
The Adapter pattern allows classes with incompatible interfaces to work together by wrapping its own interface around that of an already existing class. Here are some real-world examples of the Adapter pattern:

1. **Legacy System Integration**: One common scenario is integrating new systems with legacy systems. The legacy systems often have different interfaces from what the new system expects. In such cases, you can use the Adapter pattern to create a new interface for the legacy system that matches the expected interface in the new system.

2. **Middleware and Drivers**: Middleware or drivers in software can be seen as adapters. For example, JDBC drivers act as an adapter between a Java application and a database. The Java application uses the standard JDBC interface, and the driver adapts these standard calls to database-specific calls.

3. **Wrapper Libraries**: Sometimes, a library or a framework you're using might not be well-suited to your needs, maybe because it's overly complex, or the method signatures aren't what you prefer. In such cases, you can create an adapter that wraps the library or framework, exposing a new interface that is easier for your application code to interact with.

4. **Different APIs**: APIs from different vendors for the same kind of service often differ. Let's say you're using a cloud storage service and you decide to switch providers. The new provider's API won't be the same as the old one's. You could write an adapter that translates the new provider's API into the same interface as the old provider's API. This way, you won't have to change your application code that interacts with the cloud storage.

Here's a simple example in code using Java:

```java
// Assume we have a MediaPlayer interface in our system
public interface MediaPlayer {
    void play(String audioType, String fileName);
}

// And we have an advanced media player, but it's interface is different
public interface AdvancedMediaPlayer { 
    void playVlc(String fileName);
    void playMp4(String fileName);
}

// We can create an adapter to make AdvancedMediaPlayer compatible with MediaPlayer
public class MediaAdapter implements MediaPlayer {

    AdvancedMediaPlayer advancedMusicPlayer;

    public MediaAdapter(String audioType){
        if(audioType.equalsIgnoreCase("vlc")){
            advancedMusicPlayer = new VlcPlayer();            
        }
        else if (audioType.equalsIgnoreCase("mp4")){
            advancedMusicPlayer = new Mp4Player();
        }   
    }

    @Override
    public void play(String audioType, String fileName) {
        if(audioType.equalsIgnoreCase("vlc")){
            advancedMusicPlayer.playVlc(fileName);
        }
        else if(audioType.equalsIgnoreCase("mp4")){
            advancedMusicPlayer.playMp4(fileName);
        }
    }
}
```
The key point in these examples is that the Adapter pattern allows two incompatible interfaces to work together. It does this by converting the interface of one class into an interface expected by the clients. This lets classes work together that otherwise couldn't due to incompatible interfaces.



#### 门面 Facsade
The Facade pattern provides a simplified interface to a complex subsystem. It's like a "front-facing" interface that makes a complex system easier to use by reducing complexity and hiding the internal workings. Here are a few real-world examples of the Facade pattern:

1. **Home Automation Systems**: A home automation system can involve complex interactions between various devices like lights, thermostats, home security systems, etc. A facade could provide a simple method like `leaveHome()` that turns off the lights, lowers the thermostat, and activates the security system.

2. **Computer Operating Systems**: When you want to read or write a file in a computer, you don't deal with the underlying complex operations related to the file system, memory allocation, and disk storage. You simply use a simplified API provided by the operating system that deals with all these complexities for you.

3. **Software Libraries/Frameworks**: Libraries and frameworks often use the Facade pattern to provide a simpler, more user-friendly interface to a more complex underlying system. For example, jQuery, a popular JavaScript library, provides a simple interface for manipulating the DOM, handling events, and making AJAX requests, which simplifies the interaction with underlying native JavaScript APIs.

4. **E-commerce Platforms**: An e-commerce platform may have a lot of complex subsystems like inventory management, payment processing, user authentication, etc. A facade can provide a simple interface to these subsystems, making it easier to place an order or handle returns.

Here is a simple code example in Java:

```java
public class ComputerFacade {
    private CPU processor;
    private Memory ram;
    private HardDrive hd;

    public ComputerFacade() {
        this.processor = new CPU();
        this.ram = new Memory();
        this.hd = new HardDrive();
    }

    public void start() {
        processor.freeze();
        ram.load(BOOT_ADDRESS, hd.read(BOOT_SECTOR, SECTOR_SIZE));
        processor.jump(BOOT_ADDRESS);
        processor.execute();
    }
}

public class Client {
    public static void main(String[] args) {
        ComputerFacade computer = new ComputerFacade();
        computer.start();
    }
}
```

In this example, the `ComputerFacade` class provides a simplified `start()` method for starting a computer. This method uses various subsystems (`CPU`, `Memory`, `HardDrive`), but the client code doesn't need to know about these subsystems or how they work together to start the computer.


#### 装饰 Decorator
The Decorator pattern provides a way to attach additional responsibilities to an object dynamically. Decorators provide a flexible alternative to subclassing for extending functionality. Here are a few real-world examples of the Decorator pattern:

1. **Java I/O Classes**: The Java I/O classes provide a classic example of the Decorator pattern. `InputStream`, `OutputStream`, `Reader`, and `Writer` are abstract base classes that define the read/write operations. There are concrete implementations like `FileInputStream`, `FileOutputStream`, `StringReader`, and `StringWriter` for reading/writing from/to files and strings. There are also decorator classes like `BufferedInputStream`, `BufferedOutputStream`, `BufferedReader`, and `BufferedWriter` that add buffering to the read/write operations, and `DataInputStream`, `DataOutputStream`, `PrintWriter` that add methods for reading/writing primitive types, strings, and lines.

2. **Java GUI Components**: The Java GUI component classes use Decorators as well. For example, a `ScrollPane` is a decorator that adds scroll bars to another component. A `Border` can be used to add a border to a component.

3. **Web Page Design**: In web development, decorators can be used to add features to web page elements without changing their implementation. For example, a base component class could represent a simple HTML element, and decorator classes could add features like borders, colors, or animations.

4. **Coffee Shop**: A real-life example of the decorator pattern might be running a coffee shop. The base component is a plain coffee, and you can decorate it by adding extra features like milk, sugar, chocolate, whipped cream, etc. Each of these "decorations" adds to the price of the coffee.

Here's a simple code example in Java:

```java
public abstract class Beverage {
    public abstract double cost();
}

public class Coffee extends Beverage {
    public double cost() {
        return 1.00;
    }
}

public abstract class BeverageDecorator extends Beverage {
    protected Beverage beverage;

    public BeverageDecorator(Beverage beverage) {
        this.beverage = beverage;
    }
}

public class MilkDecorator extends BeverageDecorator {
    public MilkDecorator(Beverage beverage) {
        super(beverage);
    }

    public double cost() {
        return 0.20 + beverage.cost();
    }
}

public class SugarDecorator extends BeverageDecorator {
    public SugarDecorator(Beverage beverage) {
        super(beverage);
    }

    public double cost() {
        return 0.10 + beverage.cost();
    }
}

public class Client {
    public static void main(String[] args) {
        Beverage beverage = new Coffee();
        beverage = new MilkDecorator(beverage);
        beverage = new SugarDecorator(beverage);
        System.out.println(beverage.cost());  // Outputs 1.30
    }
}
```

In this example, `MilkDecorator` and `SugarDecorator` are decorators that add extra cost to a `Beverage`. The client code can dynamically decorate a `Beverage` with any combination of decorators.

#### 组合 Composite
The Composite pattern is a design pattern that allows treating individual objects and compositions of objects uniformly. It's especially useful when you have to implement tree-like structures. Here are some real-world examples of the Composite pattern:

1. **Graphics Drawing Applications**: In graphical editors, shapes can be grouped together and manipulated as one object using the Composite pattern. For example, a `Shape` interface defines operations like `draw()`, `move()`, and `rotate()`. A `Circle` or a `Rectangle` class implements this interface. A `Group` class also implements this interface and contains a collection of `Shape` objects.

2. **File System Directories**: File systems use the Composite pattern to represent and manipulate directories and files. Both directories and files can be treated as a `FileSystemElement`, which can have operations like `getSize()` or `delete()`. A `File` is a leaf element, while a `Directory` is a composite element that can contain other `File` and `Directory` objects.

3. **Menus**: The Composite pattern is often used for building menu systems. A `MenuComponent` might have methods like `display()`. A `MenuItem` is a leaf node that represents a single menu item, while a `Menu` is a composite node that contains other `MenuComponent` objects (either `MenuItem` or `Menu`).

4. **Organization Structures**: The Composite pattern is also useful for representing organization structures. An `Employee` interface could have methods like `getSalary()`. A `Developer` or `Manager` class implements this interface. A `Department` class also implements this interface and contains a collection of `Employee` objects.

Here's a simple code example in Java:

```java
public interface Employee {
    int getSalary();
}

public class Developer implements Employee {
    private int salary;

    public Developer(int salary) {
        this.salary = salary;
    }

    public int getSalary() {
        return salary;
    }
}

public class Manager implements Employee {
    private int salary;

    public Manager(int salary) {
        this.salary = salary;
    }

    public int getSalary() {
        return salary;
    }
}

public class Department implements Employee {
    private List<Employee> employees = new ArrayList<>();

    public void addEmployee(Employee employee) {
        employees.add(employee);
    }

    public int getSalary() {
        int totalSalary = 0;
        for (Employee employee : employees) {
            totalSalary += employee.getSalary();
        }
        return totalSalary;
    }
}

public class Client {
    public static void main(String[] args) {
        Employee john = new Developer(1000);
        Employee jane = new Manager(2000);
        Department department = new Department();
        department.addEmployee(john);
        department.addEmployee(jane);
        System.out.println(department.getSalary());  // Outputs 3000
    }
}
```

In this example, both `Developer`, `Manager`, and `Department` are `Employee`s. A `Department` is a composite object that can contain other `Employee` objects, and you can calculate the total salary of a department by summing up the salaries of its employees.

#### 代理 Proxy
The Proxy pattern provides a surrogate or placeholder for another object to control access to it. This pattern is applicable whenever there's a need for a more versatile or sophisticated reference to an object than a simple pointer. Here are some real-world examples:

1. **Remote Proxy**: This type of proxy represents an object that resides in a different address space on the same or different machine. For example, a web service may use a proxy server to forward requests from a client to a server.

2. **Virtual Proxy**: A virtual proxy is used when an object requires a lot of resources and you want to delay its loading or initialization until it is actually needed. For example, in a text document editor, the images in the document could be represented by virtual proxy objects that load the actual images only when they are scrolled into view.

3. **Protection Proxy**: A protection proxy controls access to an object based on access rights. For example, in a system where different users have different access rights to a file, a proxy object can be used to control access to the file.

4. **Smart Reference Proxy**: A smart reference is a replacement for a bare pointer that performs additional actions when an object is accessed, like counting the number of references to an object. 

Here's a simple Java code example of a Protection Proxy:

```java
public interface FileAccessor {
    void readFile();
}

public class RealFileAccessor implements FileAccessor {
    private String fileName;

    public RealFileAccessor(String fileName) {
        this.fileName = fileName;
        loadFile();
    }

    private void loadFile() {
        System.out.println("Loading " + fileName);
    }

    public void readFile() {
        System.out.println("Reading " + fileName);
    }
}

public class FileAccessorProxy implements FileAccessor {
    private RealFileAccessor realFileAccessor;
    private String fileName;
    private String role;

    public FileAccessorProxy(String fileName, String role) {
        this.fileName = fileName;
        this.role = role;
    }

    public void readFile() {
        if (role.equals("admin")) {
            if (realFileAccessor == null) {
                realFileAccessor = new RealFileAccessor(fileName);
            }
            realFileAccessor.readFile();
        } else {
            System.out.println("Access denied. Only admin can read files.");
        }
    }
}

public class Client {
    public static void main(String[] args) {
        FileAccessor fileAccessor = new FileAccessorProxy("test.txt", "user");
        fileAccessor.readFile();  // Outputs: Access denied. Only admin can read files.
    }
}
```

In this example, `FileAccessorProxy` acts as a protection proxy that controls access to `RealFileAccessor` based on the user's role. Only an "admin" can read the file, while other roles get an "Access denied" message.

#### 享元 Flyweight
The Flyweight pattern is a structural design pattern that allows programs to support vast quantities of objects by keeping their memory consumption low. It achieves it by sharing parts of an object state between multiple objects instead of keeping all of the data in each object.

Here are some real-world examples:

1. **Text Formatting in Word Processors**: Text editors often utilize the flyweight pattern to reduce the memory footprint of text. Each character in the document could be a flyweight object with a character code, position, and style. The character code and style (a reference to a style object) could be shared between many objects.

2. **Game Programming**: In game programming, the flyweight pattern is often used for managing large numbers of objects that have some shared state. For example, in a war game, there might be thousands of soldier objects. Each soldier might have properties like color, position, and health. The color property, which can be the same for a group of soldiers, can be extrinsic and shared, thereby saving memory.

3. **Rendering Forests in 3D Graphics**: If you have a 3D graphics application that needs to render a large forest, each tree could be a flyweight object. The geometrical data of the tree (which could be quite large) could be shared between many tree objects. Each tree object would have its own position and orientation, which are small and inexpensive to store.

Here's a simple Java code example of the flyweight pattern used in a game:

```java
public interface Soldier {
    void move(Position from, Position to);
}

public class Private implements Soldier {
    private Object graphicalRepresentation;

    public Private() {
        // Load graphicalRepresentation from a file
        // This is a costly operation we only want to do it once
    }

    public void move(Position from, Position to) {
        System.out.println("Move from " + from + " to " + to);
    }
}

public class SoldierFactory {
    private Map<String, Soldier> soldiers = new HashMap<>();

    public Soldier getSoldier(String type) {
        Soldier soldier = soldiers.get(type);
        if (soldier == null) {
            switch (type) {
                case "private":
                    soldier = new Private();
                    soldiers.put(type, soldier);
                    break;
                // other soldier types could go here
            }
        }
        return soldier;
    }
}

public class Position {
    // this class could contain position data
}

public class Client {
    public static void main(String[] args) {
        SoldierFactory factory = new SoldierFactory();
        Soldier soldier = factory.getSoldier("private");
        soldier.move(new Position(), new Position());
    }
}
```

In this example, `SoldierFactory` creates and manages soldier objects. Each soldier type is only created once. If a client requests a soldier of a certain type that has already been created, the existing object is returned. This can save a significant amount of memory when there are many soldiers of the same type.

#### 桥 Bridge
The Bridge design pattern is a structural design pattern that aims to decouple an abstraction from its implementation so that the two can evolve independently. It helps to reduce complexity, improve code organization, and enable better separation of concerns. This pattern is particularly useful when both the abstraction and the implementation have to be extended or modified frequently.

The Bridge pattern involves the following four components:

1. Abstraction: This is the interface that defines the high-level abstraction and maintains a reference to the Implementor. It is typically responsible for defining the abstract operations and delegating them to the Implementor.

2. RefinedAbstraction: This class extends the Abstraction and provides a more specific implementation of the abstraction. It adds or overrides methods from the Abstraction as needed for the refined functionality.

3. Implementor: This is an interface that defines the low-level implementation details for the Abstraction. It defines the methods that the concrete Implementor classes must implement.

4. ConcreteImplementor: This class implements the Implementor interface and provides a concrete implementation for the low-level operations. There can be multiple ConcreteImplementor classes, each providing a different implementation.

The Bridge pattern can be applied when:

1. You want to avoid a permanent binding between an abstraction and its implementation.
2. Both the abstractions and their implementations should be extensible independently.
3. Changes in the implementation of an abstraction should have no impact on clients.
4. You want to hide the implementation details of an abstraction from the client.

Here's a simple example in Python:

```python
from abc import ABC, abstractmethod

# Implementor
class Color(ABC):
    @abstractmethod
    def apply_color(self):
        pass

# ConcreteImplementor
class RedColor(Color):
    def apply_color(self):
        return "Red"

class GreenColor(Color):
    def apply_color(self):
        return "Green"

# Abstraction
class Shape(ABC):
    def __init__(self, color: Color):
        self.color = color

    @abstractmethod
    def draw(self):
        pass

# RefinedAbstraction
class Circle(Shape):
    def draw(self):
        return f"Drawing a circle in {self.color.apply_color()} color"

class Square(Shape):
    def draw(self):
        return f"Drawing a square in {self.color.apply_color()} color"

# Client
def main():
    red_color = RedColor()
    green_color = GreenColor()

    circle = Circle(red_color)
    square = Square(green_color)

    print(circle.draw())  # Output: Drawing a circle in Red color
    print(square.draw())  # Output: Drawing a square in Green color

if __name__ == "__main__":
    main()
```

In this example, the Shape class (Abstraction) and the Color class (Implementor) are decoupled, allowing them to evolve independently.

##### Real Project 0
I have message to communicate with other part at fixed time: once per month or once per day.  
After I send my message through some channel, it may reply me through this channel.  
The message format differ from time to time.  
the channel can be FTP(grouping messages into a file according to some format pre-defined).  
the channel may be some Kafka topic.  
the channel may be some database. (insert message into a pre defined table)  
How to design?


##### Real World Examples
The Bridge pattern is used in real-world projects to decouple abstractions from their implementations, allowing them to evolve independently. Here are some real-world use cases where the Bridge pattern can be applied:

1. Cross-platform UI libraries: When designing a UI library that works across multiple platforms (e.g., Windows, macOS, Linux), the Bridge pattern can be employed to separate the high-level UI abstractions (like Button, TextBox, etc.) from their platform-specific implementations. This allows the library to support new platforms or change existing platform implementations without affecting the overall structure.

2. Remote Procedure Call (RPC) systems: In RPC systems, the Bridge pattern can be used to decouple the high-level API used by clients from the low-level network protocols and data serialization formats. This enables the RPC system to support different protocols (e.g., HTTP, gRPC, WebSockets) and serialization formats (e.g., JSON, XML, Protocol Buffers) without changing the client code.

3. Database drivers and ORMs: Database drivers and Object-Relational Mapping (ORM) libraries often employ the Bridge pattern to separate the high-level database operations (e.g., query, insert, update, delete) from the specific database management systems (DBMS) implementations (e.g., MySQL, PostgreSQL, SQLite). This allows the library to support multiple DBMSs and easily extend to new ones without changing the client code.

4. Rendering engines: In the context of rendering engines, the Bridge pattern can be used to separate the high-level rendering operations (e.g., drawing shapes, applying textures) from the specific rendering API implementations (e.g., OpenGL, DirectX, Vulkan). This enables the rendering engine to support multiple APIs and switch between them at runtime without modifying the high-level code.

5. Payment gateways: When integrating multiple payment gateways (e.g., Stripe, PayPal, Braintree) into an application, the Bridge pattern can be employed to decouple the high-level payment processing logic from the specific gateway implementations. This allows the application to support new payment gateways or change existing ones without affecting the core payment processing code.

In each of these real-world examples, the Bridge pattern provides flexibility and extensibility by enabling the independent evolution of abstractions and their implementations. This makes it easier to maintain the codebase and adapt to new requirements or technologies.

#### RPC example
Here's an example of how the Bridge pattern can be applied to an RPC system using Java. In this example, we will create an abstraction for an RPC client that communicates with a remote server using different network protocols and serialization formats.

```java
// Implementor: Serialization Format
interface SerializationFormat {
    String serialize(Object object);
    Object deserialize(String data, Class<?> clazz);
}

class JSONSerializationFormat implements SerializationFormat {
    // Implement serialization and deserialization using a JSON library
}

class XMLSerializationFormat implements SerializationFormat {
    // Implement serialization and deserialization using an XML library
}

// Implementor: Network Protocol
interface NetworkProtocol {
    String sendRequest(String url, String data);
    void setSerializationFormat(SerializationFormat format);
}

class HttpProtocol implements NetworkProtocol {
    private SerializationFormat serializationFormat;

    public void setSerializationFormat(SerializationFormat format) {
        this.serializationFormat = format;
    }

    // Implement sendRequest using HTTP
}

class WebSocketProtocol implements NetworkProtocol {
    private SerializationFormat serializationFormat;

    public void setSerializationFormat(SerializationFormat format) {
        this.serializationFormat = format;
    }

    // Implement sendRequest using WebSockets
}

// Abstraction: RPC Client
abstract class RpcClient {
    protected NetworkProtocol protocol;

    public RpcClient(NetworkProtocol protocol) {
        this.protocol = protocol;
    }

    public abstract Object call(String url, Object request, Class<?> responseType);
}

// Refined Abstraction: RPC Client Implementation
class RpcClientImpl extends RpcClient {
    public RpcClientImpl(NetworkProtocol protocol) {
        super(protocol);
    }

    public Object call(String url, Object request, Class<?> responseType) {
        String requestData = protocol.serialize(request);
        String responseData = protocol.sendRequest(url, requestData);
        return protocol.deserialize(responseData, responseType);
    }
}
```

In this example, the Bridge pattern is applied to separate the RPC client abstraction (`RpcClient`) from the network protocol (`NetworkProtocol`) and serialization format (`SerializationFormat`) implementations. This allows the RPC client to support multiple protocols and serialization formats without changing its code. The client code can now easily switch between different implementations at runtime, providing flexibility and extensibility.


### 创建

### 使用
#### 需求1
