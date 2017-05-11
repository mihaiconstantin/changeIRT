#include <Rcpp.h>
using namespace Rcpp;



// Function for computing the probability of
// 2PLM and GRM models. It is called from
// the loops of irf_2plm and isrf_grm.
DoubleVector ComputeProbability(DoubleVector theta, 
                                double a, 
                                double b) 
{
	DoubleVector pr;
	
	pr = exp(a * (theta - b));
	pr = pr / (1 + pr);
	
	return pr;
}


// [[Rcpp::export]]
NumericMatrix irf_2plm(DoubleVector theta, 
                       DoubleVector a,
                       DoubleVector b) 
{
	// Determine how many items we have.
	int item_nr = a.nrow();
	
	// Build the matrix that will store the probabilities.
	NumericMatrix irf(theta.size(), item_nr);
	
	for(int i = 0; i < item_nr; i++)
	{
		irf(_, i) = ComputeProbability(theta, a(i), b(i));
	}
	
	return irf;
}



// [[Rcpp::export]]
NumericMatrix isrf_grm(DoubleVector theta
                       DoubleVector a,
                       NumericMatrix b)
{
	// TODO: continue here.
}
