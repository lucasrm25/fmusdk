TODO:

- [ ] Implement FMU and test first inside SDK. This might require setting a value for the input, in case not given
- [ ] Check interface with Simpack



Simpack is calling fmi2GetContinuousStates without calling
fmi2EnterContinuousTimeMode
And btw. there is not states in the model.

