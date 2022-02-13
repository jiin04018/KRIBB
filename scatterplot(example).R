library(ggplot2)
theme_set(theme_bw())
data("midwest", package = "ggplot2")
gg <- ggplot(midwest, aes(x = area, y=poptotal))+
  geom_point(aes(col = state, size = popdensity))+
  geom_smooth(method = "loess", se = F)+
  xlim(c(0,0.1))+
  ylim(c(0,500000))+
  labs(subtitle = "Area VS popuation",
       y = "population",
       x = "Area",
       title = "Scatterplot",
       caption = "source: midwest")

plot(gg)
