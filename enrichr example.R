library(enrichR)
listEnrichrSites()
setEnrichrSite("Enrichr") # Human genes
websiteLive <- TRUE

# find the list of all available databases from enrichr
dbs <- listEnrichrDbs()
if (is.null(dbs)) websiteLive <- FALSE
if (websiteLive) head(dbs)


if (is.null(dbs)) websiteLive <- FALSE
if (websiteLive) head(dbs)


# example : genes associated with embryonic haematopoiesis
dbs <- c("GO_Molecular_Function_2015", "GO_Cellular_Component_2015", "GO_Biological_Process_2015")
if (websiteLive) {
  enriched <- enrichr(c("Runx1", "Gfi1", "Gfi1b", "Spi1", "Gata1", "Kdr"), dbs)
}
### view the results table
if (websiteLive) enriched[["GO_Biological_Process_2015"]]

#### plot Enrichr GO-BP output
if (websiteLive) plotEnrich(enriched[[3]], showTerms = 20, numChar = 40, y = "Count", orderBy = "P.value")

