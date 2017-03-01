#!/usr/bin/env Rscript
########################
# homework1 104971001
# find max weight and height in the file
########################

# -files [input file] -out [output file], exchangable
args = commandArgs(trailingOnly=TRUE)

# default output file: result.csv
o_f = 'result.csv' 

if (length(args)==0) {
  stop("USAGE: Rscript hw1_exam.R -files input_file_name [-out output_file]", call.=FALSE)
} else if (length(args)==1) {
  i_f <- args[1] 
} else if (length(args)==2 && args[1] == '-files') {
  i_f <- args[2]
} else if (length(args)==4){
  if (args[1] == '-files' && args[3] == '-out'){
    i_f <- args[2]
    o_f <- args[4]
  }else if (args[1] == '-out' && args[3] == '-files'){
    o_f <- args[2]
    i_f <- args[4]
  }
} else {
  stop("USAGE: Rscript hw1_exam.R -files input_file_name [-out output_file]", call.=FALSE)
}

cat('your input file is: ',i_f)
cat('\nyout output file is:', o_f, '\n')

d <- read.csv(i_f)
# head(d)

# find max height and weight
max_height = round(max(d$height), 2)
max_weight = round(max(d$weight), 2)

# write dataframe to file
df = data.frame(set=i_f, weight = max_weight, height = max_height)
write.table(df, file = o_f, sep = ',', row.names= F)