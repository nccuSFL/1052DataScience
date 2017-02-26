########################
# homework1 example
########################

# -files [input file] -out [output file], exchangable
# find max weight and height in the file
args = commandArgs(trailingOnly=TRUE)
if (length(args)==0) {
  stop("USAGE: Rscript hw1_exam.R input", call.=FALSE)
} else if (length(args)==1) {
  i_f <- args[1] 
}
print(i_f)

d <- read.csv(i_f)
# head(d)

# find max height and weight
max_height = max(d$height)
max_weight = max(d$weight)

# write dataframe to file
df = data.frame(set=i_f, weight = max_weight, height = max_height)
write.table(df, file = 'r.csv', sep = ',', row.names= F)