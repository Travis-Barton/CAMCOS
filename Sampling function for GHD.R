#Sampling function for data #2

library(MixGHD)
library(mvtnorm)

G_DC <- function(num_clusters, mu, sigma, points = 100) {
  clusters = matrix(NA, nrow = points, ncol = num_clusters)
    for(i in 1:num_clusters){
      clusters[,i] = rnorm(points, mu[i], sigma[i])
    }
  return(clusters)
}

GMV_DC <- function(num_clusters, mu, sigma, points = 100) {
  clusters = list()
    for(i in 1:num_clusters){
      clusters[[i]] = rmvnorm(points, mu[[i]], sigma[[i]])
    }
  return(clusters)
}

tMV_DC <- function(num_clusters, mu, sigma, df, points = 100) {
  clusters = list()
    for(i in 1:num_clusters){
      clusters[[i]] = rmvt(points, sigma[[i]], df = df[1])
    }
  return(clusters)
}


GHD_DC <- function(num_clusters, mu, p, alpha, sigma, omega, lambda, points = 100) {
  clusters = list()
  for(i in 1:num_clusters){
    clusters[[i]] = rGHD(points, mu[[i]], alpha[[i]], sigma[[i]], omega[[i]], lambda[[i]])
  }
  return(clusters)
}

