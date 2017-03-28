
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

getAUC <- function(refer, scores)
{
  rocObj <- roc(refer, scores) 
  result = auc(rocObj)
  return(result)
}

pkgTest("pROC")


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

print(paste("target:", target))
print(paste("output file:", out_f))
print(paste("files:", files))

# initial vector
fname <- c()
sens <- c()
spes <- c()
f1s <- c()
aucs <- c()

# read files, calculate TP, TN, FP, FN
for(file in files)
{
  tp = 0
  tn = 0
  fp = 0
  fn = 0
  name<-gsub(".csv", "", basename(file))
  fname <- c(fname, name)
  d<-read.table(file, header=T,sep=",")
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
  sensitivity = round(tp/(tp+fn), 2)
  specificity = round(tn/(tn+fp), 2)
  f1 = round(((2*tp)/(2*tp + fp + fn)), 2)
  
  if(target == 'male'){
    auc <- round(getAUC(d$reference, d$pred.score), 2)
    # print(auc)
  }else{
    auc <- round(getAUC(d$reference, 1-d$pred.score), 2)
    # print(auc)
  }
  
  sens <- c(sens, sensitivity)
  spes <- c(spes, specificity)
  f1s <- c(f1s, f1)
  aucs <- c(aucs, auc)
}

# create dataframe, find max item, and write to file
df <- data.frame(method=fname, sensitivity=sens, specificity=spes, F1=f1s, 
                 AUC=aucs, stringsAsFactors=FALSE)
index <- sapply(df[,c("sensitivity","specificity","F1","AUC")], which.max)
df <- rbind(df, c("highest", fname[index]))
print(df)
write.table(df, file=out_f, row.names=F, quote=F, sep=",")






