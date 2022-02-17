namespace Host

open System.Diagnostics
open Quantum
open Microsoft.Quantum.Simulation.Simulators
open Microsoft.Quantum.Simulation.Core

module Host = 
    [<EntryPoint>]
    let main _ =
        printfn "Hello, from classical world"

        use simulator = new QuantumSimulator();

        let parity = Seq.reduce(<>)

        let sampleBits = new QArray<bool>([| false; true; false |]);
        printfn "Samples bits: %A" sampleBits

        let algorithm = RunAlgorithm.Run(simulator, sampleBits).Result
        printfn "Bits from Quantum Computation: %A" algorithm

        // Process the results: in this case, verify that:
        // - the length of the return array equals the length of the input array
        Debug.Assert(algorithm.Length = sampleBits.Length, "Return array length differs from the input array length")
        // - the parity of the returned array matches the parity of the input one
        Debug.Assert((algorithm |> parity) = (sampleBits |> parity), "Return array should have the same parity as the input one")

        0