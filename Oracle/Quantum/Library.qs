namespace Quantum {
    
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    operation ApplyProductWithNegationFunction (vector : Bool[], controls : Qubit[], target : Qubit) : Unit is Adj {
        for (bit, control) in Zipped(vector, controls) {
            (ControlledOnInt(bit ? 1 | 0, X))([control], target);
        }
    }

    operation ReconstructOracleParameters(N : Int, oracle : ((Qubit[], Qubit) => Unit)) : Bool[] {
        use (x, y) = (Qubit[N], Qubit()) {

            oracle(x, y);

            if (N % 2 == 1) {
                X(y);
            }   

            let m = MResetZ(y);

            ResetAll(x);

            return m == One
                ? ConstantArray(N, false) w/ 0 <- true
                | ConstantArray(N, false);
        }
    }
    
    /// Instantiates the oracle and runs the parameter restoration algorithm.
    operation RunAlgorithm(bits : Bool[]) : Bool[] {
        Message("Hello, quantum world!");
        // construct an oracle using the input array
        let oracle = ApplyProductWithNegationFunction(bits, _, _);
        // run the algorithm on this oracle and return the result
        return ReconstructOracleParameters(Length(bits), oracle);
    }
}
