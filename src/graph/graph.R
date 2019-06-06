library(ggplot2)
df <- read.csv("../time.csv", stringsAsFactors = FALSE, header = FALSE)
df_np <- read.csv("../time_np.csv", stringsAsFactors = FALSE, header = FALSE)
df <- rbind(data.frame(species='Python', df),
            data.frame(species='numpy', df_np))

g <- ggplot(df, aes(x=df$V1, y = df$V2, color=species))
g <- g + geom_point() + labs(x="N") + labs(y="time[s]") + scale_y_continuous(breaks = seq(0,6,0.5)) + 
   scale_color_hue(name="method")
plot(g)
ggsave(filename = "graph.png")