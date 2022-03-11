
#' @title myddt
#'
#' @param df ddt data frame
#' @param SPECIES species of the fish
#'
#' @return plot and filtered data frame
#' @export
#'
#' @importFrom dplyr '%>%' filter
#' @importFrom ggplot2 aes geom_smooth ggplot geom_point ggtitle
#' @importFrom utils write.csv read.csv
#'
#' @examples
#' \dontrun{obj <- myddt(df = ddt, SPECIES = "CCATFISH")}

myddt = function(df,SPECIES){
 WEIGHT <- LENGTH <- RIVER <- NULL

   ddt <- read.csv("DDT.csv")

  newddt <- df %>% filter(SPECIES == {{SPECIES}})


graph <- ggplot(data=newddt,aes(WEIGHT,LENGTH)) + geom_point(alpha = 1,aes(color=RIVER)) + geom_smooth() + ggtitle("Eli Bilgrien")

print(graph)

write.csv(newddt,paste0("C:/Users/ebilg/Desktop/2022 Spring/Math/Project 1/LvsWfor", SPECIES,".csv"),row.names = FALSE)

rftable <- table(ddt$RIVER)/length(ddt$RIVER)
print("ddt, newddt, rftable")
}

