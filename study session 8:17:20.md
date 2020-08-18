Today we discussed how to approach problems in preparation for RB129's interview assessment.

- Apprach each problem on interview assessment with a condensed definition of a topic.
- Have a concise code example to demonstrate the topic ready in your head.
- Expect follow up questions.

We also covered the following topics.

* Classes and Objects
  * Classes are blueprints for objects made up of behaviors (what an object should be able to do) and attributes (what an object should be made of or it's state)
  * Make sure to include examples of what an attribute and behavior is in code.
* Getters and Setters
  * Getters and Setters provider an interface to the object's state.
  * Understand the differences between invoking a getter method with `self` prepended in Ruby version 2.65 and 2.7 (the test will be in 2.65)
    * You can't call getter methods in 2.65 with `self` prepended.
    * You must use `self` when invoking setter methods in both versions.
* Encapsulation
  * Allows us to only expose the attributes and behaviors that users of the object need by allowing us to hide the internal representation of an object.
  * Follow up question: What are the difference between private and protected methods?

* Protected methods
  * When a method is protected, only instances of the class (objects) **or a subclass** can call the method from inside the class. This makes sharing sensitive information between instances of the same class very easy. From inside the class, a protected method is accessible just like `public` methods. From outside the class, a `protected` method cannot be called. 
* Polymorphism
  * **When different objects respond differently to the same message.**