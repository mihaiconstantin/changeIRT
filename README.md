## An R package for data simulation under the unidimensional IRT framework

**What it included:**

- data simulation under the *Two-Parameter Logistic Model* [(Samejima, 1969)](http://psycnet.apa.org/psycinfo/1972-04809-001) and the *Graded Response Model* [(van der Linden & Hambleton, 2013)](http://www.springer.com/us/book/9780387946610)
- *latent trait estimation* and *standard errors* using the following methods: Weighted Maximum Likelihood, Maximum Likelihood, and Expected A Posteriori 
- *Reliable Change Index* [(Jacobson & Truax, 1991)](http://doi.org/10.1037/0022-006X.59.1.12) computation using the following methods: Wald Test (...)
- *Person-Fit Statistic* `l<sub>z</sub>` [(Drasgow, Levine, & Williams, 1985)](http://doi.org/10.1111/j.2044-8317.1985.tb00817.x) using the corrected versions for both dichotomous [(Snijders, 2001)](http://doi.org/10.1007/BF02294437) and polychotomous [(Sinharay, 2016)](http://doi.org/10.1007/s11336-015-9465-x) items

**Exported functions:**

- `simulateirt(theta, difficulty, slope)`
- `estimateirt(data, theta.method = "WLE")`
- `changeirt()`
- `personfit()`

---

*under development...*