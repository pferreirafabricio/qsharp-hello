namespace QuantumHelloWorld {
    // Create an operation that adds two int and returns a total int  
    operation Add (a : Int, b : Int): (Int) 
    { 
        body (...) 
        { 
            return (a + b); 
        } 
    } 

    operation Subtract (a : Int, b : Int): (Int) 
    { 
        body (...) 
        { 
            return (a - b); 
        } 
    } 
}
