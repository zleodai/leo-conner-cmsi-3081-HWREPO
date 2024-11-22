pub struct Stack<T> {
    // stack items are private by default
    items: Vec<T>,
}

impl<T> Stack<T> {
    fn new() -> Stack::<T> {
        return Stack::<T> { items: Vec::<T>::new() };
    }

    fn push(&mut self, value: T) {
        self.items.push(value);
    }

    fn pop(&mut self) -> Option<T> {
        if self.items.len() < 1 {
            return None;
        }
        return self.items.pop();
    }
    
    fn peek(&self) -> Option<&T> {
        if self.items.len() < 1 {
            return None;
        }        
        return Some(&self.items[self.items.len() -1]);
    }

    fn is_empty(&self) -> bool {
        return self.items.is_empty();
    }

    fn len(&self) -> i32 {
        return self.items.len() as i32;
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_push_and_pop() {
        let mut stack: Stack<i32> = Stack::new();
        assert!(stack.is_empty());
        stack.push(1);
        stack.push(2);
        assert_eq!(stack.len(), 2);
        assert_eq!(stack.pop(), Some(2));
        assert_eq!(stack.pop(), Some(1));
        assert_eq!(stack.pop(), None);
        assert!(stack.is_empty());
    }

    #[test]
    fn test_peek() {
        let mut stack: Stack<i32> = Stack::new();
        assert_eq!(stack.peek(), None);
        stack.push(3);
        assert_eq!(stack.peek(), Some(&3));
        stack.push(5);
        assert_eq!(stack.peek(), Some(&5));
    }

    #[test]
    fn test_is_empty() {
        let mut stack: Stack<String> = Stack::new();
        assert!(stack.is_empty());
        stack.push(String::from("hello"));
        assert!(!stack.is_empty());
        stack.pop();
        assert!(stack.is_empty());
    }

    #[test]
    fn test_stacks_cannot_be_cloned_or_copied() {
        let stack1: Stack<i32> = Stack::new();
        let _stack2: Stack<i32> = stack1;
        // Should get a compile error if next line uncommented
        // let _stack3: Stack<i32> = stack1; // Error: `stack1` has been moved
    }
}
