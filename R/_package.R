#' changeIRT: a package for change assessment
#'
#' changeIRT provides an easy to use set of functions that allow applied researchers
#' to test for change at the individual level and simulate data for under the unidimensional
#' Item Response Theory. We also providre a wrapper around other packages that provides 
#' functionality for fitting IRT models. Finaly we also provide a way to apply person fit statistics.
#'
#' It has four main goals:
#' \itemize{
#' \item Functionality for change assessment: Wald and Score tests.
#' \item Data simulation for the 2PLM and GRM models.
#' \item Fitting 2PLM and GRM models.
#' \item Functionality for person fit statistics: lz and lz*.
#' }
#'
#' To learn more about changeIRT, start with the vignettes.
#'
#' @docType package
#' @name changeIRT
#' @useDynLib changeIRT
#' @importFrom R6 R6Class
#' @importFrom mirt mirt coef fscores
#' @importFrom Rcpp cppFunction Rcpp.plugin.maker
NULL
