#' changeirt: an R package for
#'
#' dplyr provides a flexible grammar of data manipulation. It's the next
#' iteration of plyr, focused on tools for working with data frames (hence the
#' \emph{d} in the name).
#'
#' It has three main goals:
#'
#' \itemize{
#' \item Identify the most important data manipulation verbs and make them
#'   easy to use from R.
#' \item Provide blazing fast performance for in-memory data by writing key
#'   pieces in C++ (using Rcpp)
#' \item Use the same interface to work with data no matter where it's stored,
#'   whether in a data frame, a data table or database.
#' }
#'
#' To learn more about dplyr, start with the vignettes
#'
#' @docType package
#' @name changeirt
#' @useDynLib changeirt
#' @importFrom R6 R6Class
#' @importFrom mirt mirt coef fscores
#' @importFrom Rcpp cppFunction Rcpp.plugin.maker
NULL
