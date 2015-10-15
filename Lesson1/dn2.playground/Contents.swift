//: Playground - noun: a place where people can play
// DN2

// ne skrbi za velike stevilke kot input

// ############################################
// Fibonaccijevo zaporedje iterativno

func fibonacci_iter_print(n:Int) {
    if let num = fibonacci_iteration(n) {
        print(num)
    }
    else {
        print("Bad input.")
    }
}

func fibonacci_iteration(var n:Int) -> Int? {
    if n < 0 { return nil }
    else if n == 0 { return 0 }
    else {
        var x = 0, y = 1
        while n > 1 {
            let c = x + y
            x = y
            y = c
            n -= 1
        }
        //print(y)
        return y
    }
}

// Fibonacci iterativno: primeri uporabe
fibonacci_iter_print(0)
fibonacci_iter_print(1)
fibonacci_iter_print(2)
fibonacci_iter_print(12)

fibonacci_iter_print(-3)

//ali
print(fibonacci_iteration(0)!)



// ############################################
// Fibonaccijevo zaporedje rekurzivno

func fibonacci_rec_print(n:Int) {
    if let num = fibonacci_recursion(n) {
        print(num)
    }
    else {
        print("Bad input.")
    }
}

func fibonacci_recursion(n:Int) -> Int? {
    if n < 0 { return nil }
    else if n == 0 { return 0 }
    else if n == 1 || n == 2 { return 1 }
    else { return fibonacci_recursion(n-1)! + fibonacci_recursion(n-2)! }
}

// Fibonacci rekurzivno: primeri uporabe
fibonacci_rec_print(0)
fibonacci_rec_print(1)
fibonacci_rec_print(2)
fibonacci_rec_print(12)

fibonacci_rec_print(-3)

//ali
print(fibonacci_recursion(5)!)

