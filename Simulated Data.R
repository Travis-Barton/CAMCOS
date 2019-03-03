


data = GMV_DC(num_clusters = 5, 
              mu = list(c(0, 0), c(5, 5), c(-5, -5), c(10, 2), c(-10, 0)),
              sigma = list(
                matrix(c(1, .2, .2, 5), 2, 2), 
                matrix(c(1, -.4, -.4, 1), 2, 2),
                matrix(c(4, .9, .9, 5), 2, 2),
                matrix(c(3, .1, .1, 5), 2, 2),
                matrix(c(1, .4, .4, 1), 2, 2)),
              points = 1000)
plot(rbind(data[[1]], 
           data[[2]], 
           data[[3]], 
           data[[4]], 
           data[[5]]
           ), 
     col = c(rep(1, 1000),
             rep(2, 1000), 
             rep(3, 1000),
             rep(4, 1000),
             rep(5, 1000)
             )
     )

data = as.data.frame(rbind(data[[1]], 
      data[[2]], 
      data[[3]], 
      data[[4]], 
      data[[5]]))
write_csv(data, "Hard_Normal.csv")


data = GMV_DC(num_clusters = 5, 
              mu = list(c(0, 0), c(9, 9), c(-9, -9), c(18, 4), c(-18, 0)),
              sigma = list(
                matrix(c(1, .2, .2, 5), 2, 2), 
                matrix(c(1, -.4, -.4, 1), 2, 2),
                matrix(c(4, .9, .9, 5), 2, 2),
                matrix(c(3, .1, .1, 5), 2, 2),
                matrix(c(1, .4, .4, 1), 2, 2)),
              points = 1000)
plot(rbind(data[[1]], 
           data[[2]], 
           data[[3]], 
           data[[4]], 
           data[[5]]
), 
col = c(rep(1, 1000),
        rep(2, 1000), 
        rep(3, 1000),
        rep(4, 1000),
        rep(5, 1000)
)
)

data = as.data.frame(rbind(data[[1]], 
                           data[[2]], 
                           data[[3]], 
                           data[[4]], 
                           data[[5]]))
write_csv(data, "Easy_Normal.csv")



