* splat operator

* case statements

  * using matching

* format method

* methods that use regexp patterns

  * gsub
  * match?
  * match
  * scan
  * case statements

* recursion

  * Medium 1 problems on recursion
    * https://launchschool.com/exercises/83e16900
  * https://launchschool.com/posts/9f4c03bc#comment-53639
  * https://launchschool.com/posts/8a6f4220
  * https://launchschool.com/posts/587959fd#comment-54748
  * tail recursion

  ```ruby
  def fibonacci_tail(nth, acc1, acc2)
    if nth == 1
      acc1
    elsif nth == 2
      acc2
    else
      fibonacci_tail(nth - 1, acc2, acc2 + acc1)
    end
  end
  
  def fibonacci(nth)
    fibonacci_tail(nth, 1, 1)
  end
  ```

  