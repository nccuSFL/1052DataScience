
#####################
# homework2 104971001
# Rscript hw2_yourID.R --target male/female --files meth1 meth2 … methx --out result.csv
# Code should able to read in multiple files.(~10 files)
# Find out which method contains the max.
# method,sensitivity,specificity,F1,AUC
# Sensitivity: TP/(TP+FN)
# Specificity: TN/(TN+FP)
# F1 = F1 = 2 * (precision * recall) / (precision + recall)
# AUC: Area under the Curve of ROC, 0-1
#####################
pkgTest <- function(x)
{
  if (!require(x,character.only = TRUE))
  {
    install.packages(x,dep=TRUE)
    if(!require(x,character.only = TRUE)) stop("Package not found")
  }
}

pkgTest("pROC")

# query_func<-function(query_m, i)
# {
#   if(query_m == "male"){
#     which.min(i)
#   }
#   else if (query_m == "female") {
#     which.max(i)
#   } else {
#     stop(paste("ERROR: unknown target", query_m))
#   }
# }

# read parameters
args = commandArgs(trailingOnly=TRUE)
if (length(args)==0) {
  stop("USAGE: Rscript hw2_yourID.R --target male/female --files meth1 meth2 … methx --out result.csv", call.=FALSE)
}

# parse parameters
i<-1 
while(i < length(args))
{
  if(args[i] == "--target"){
    target<-args[i+1]
    i<-i+1
  }else if(args[i] == "--files"){
    j<-grep("-", c(args[(i+1):length(args)], "-"))[1]
    files<-args[(i+1):(i+j-1)]
    i<-i+j-1
  }else if(args[i] == "--out"){
    out_f<-args[i+1]
    i<-i+1
  }else{
    stop(paste("Unknown flag", args[i]), call.=FALSE)
  }
  i<-i+1
}

print("PROCESS")
print(paste("target:", target))
print(paste("output file:", out_f))
print(paste("files:", files))

# read files, calculate TP, TN, FP, FN
for(file in files)
{
  tp = 0
  tn = 0
  fp = 0
  fn = 0
  name<-gsub(".csv", "", basename(file))
  d<-read.table(file, header=T,sep=",")
  print(name)
  for(i in 1:dim(d)[1])
  {
    if(target == d[i,2]){
      if(d[i,2] == d[i,3]){
        tp <- tp+1
      }else{
        fp <- fp+1
      }
    }else{
      if(d[i,2] == d[i,3]){
        tn <- tn+1
      }else{
        fn <- fn+1
      }
    }
    i <- i+1
  }
  # print(tp)
  # print(fp)
  # print(tn)
  # print(fn)
  sensitivity = tp / (tp+fn)
  specificity = tn / (tn+fp)
  f1 = (2*tp) / (2*tp + fp + fn)
  refer <- c('a','a','b') 
  prediction <- c('a','b','b')
  rocObj <- roc(category, prediction) 
  r = auc(rocObj)
  print(r)
}


# read files
# names<-c()
# weis<-c()
# heis<-c()
# for(file in files)
# {
#   name<-gsub(".csv", "", basename(file))
#   d<-read.table(file, header=T,sep=",")
#   weis<-c(weis, d$weight[query_func(query_m, d$weight)])
#   heis<-c(heis, d$height[query_func(query_m, d$height)])
#   names<-c(names,name)
# }
# out_data<-data.frame(set=names, wei=weis, hei=heis, stringsAsFactors = F)
# index<-sapply(out_data[,c("wei","hei")], query_func, query_m=query_m)
# 
# # output file
# out_data<-rbind(out_data,c(query_m,names[index]))
# write.table(out_data, file=out_f, row.names = F, quote = F)



