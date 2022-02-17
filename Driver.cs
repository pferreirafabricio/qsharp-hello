using System;
using Microsoft.Quantum.Simulation.Simulators;
using Microsoft.Quantum.Simulation.Core;

namespace QuantumHelloWorld
{
    public class Driver
    {
        static void Main(string[] args)  
        { 
            using (var simulator = new QuantumSimulator())  
            {  
                var add = Add.Run(simulator, 20, 10).Result;  
                Console.WriteLine($"The result of the add quantum operation is: {add}");  

                var subtract = Subtract.Run(simulator, 20, 10).Result;  
                Console.WriteLine($"The result of the subtract quantum operation is: {subtract}");  
            }
        } 
    }
}