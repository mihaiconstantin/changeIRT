## An R Package For Change Assessment and Data Simulation Under the Unidimensional IRT Framework

**What is included:**

- data simulation under the *Two-Parameter Logistic Model* [(Samejima, 1969)](http://psycnet.apa.org/psycinfo/1972-04809-001) and the *Graded Response Model* [(van der Linden & Hambleton, 2013)](http://www.springer.com/us/book/9780387946610)
- *latent trait estimation* and *standard errors* using the following methods: Weighted Maximum Likelihood, Maximum Likelihood, and Expected A Posteriori 
- *Reliable Change Index* [(Jacobson & Truax, 1991)](http://doi.org/10.1037/0022-006X.59.1.12) computation using the following methods: Wald Test, ...
- *Person-Fit Statistic* `lz` [(Drasgow, Levine, & Williams, 1985)](http://doi.org/10.1111/j.2044-8317.1985.tb00817.x) using the corrected versions for both dichotomous [(Snijders, 2001)](http://doi.org/10.1007/BF02294437) and polychotomous [(Sinharay, 2016)](http://doi.org/10.1007/s11336-015-9465-x) items

**Exported functions:**

- `simulateirt(theta, difficulty, slope)`
- `estimateirt(data, theta.method = "WLE")`
- `changeirt()`
- `personfit()`

---

**References:**

- Drasgow, F., Levine, M. V., & Williams, E. A. (1985). Appropriateness measurement with polychotomous item response models and standardized indices. *British Journal of Mathematical and Statistical Psychology*, 38(1), 67–86. http://doi.org/10.1111/j.2044-8317.1985.tb00817.x
- Jacobson, N. S., & Truax, P. (1991). Clinical significance: A statistical approach to defining meaningful change in psychotherapy research. *Journal of Consulting and Clinical Psychology*, 59(1), 12–19. http://doi.org/10.1037/0022-006X.59.1.12
- Samejima, F. (1969). Estimation of latent ability using a response pattern of graded scores. *Psychometrika Monograph Supplement*. Retrieved from http://psycnet.apa.org/psycinfo/1972-04809-001
- Sinharay, S. (2016). Asymptotically Correct Standardization of Person-Fit Statistics Beyond Dichotomous Items. *Psychometrika*, 81(4), 992–1013. http://doi.org/10.1007/s11336-015-9465-x
- Snijders, T. A. B. (2001). Asymptotic null distribution of person fit statistics with estimated person parameter. *Psychometrika*, 66(3), 331–342. http://doi.org/10.1007/BF02294437
- van der Linden, W. J., & Hambleton, R. K. (2013). Handbook of modern item response theory. *Springer Science & Business Media*.

---

*under development...*
