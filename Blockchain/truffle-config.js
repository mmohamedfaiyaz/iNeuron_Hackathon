module.exports = {
  compilers: {
    solc: {
      version: "^0.4.26", // A version or constraint - Ex. "^0.5.0"
      settings: {
        optimizer: {
          enabled: true,
          runs: 50  // Optimize for how many times you intend to run the code
        }
      }
    }
  }
}
