

motivations = function()
{
setwd("c:/Users/cbird/Documents/Projects/codereview/")
a = read.table("dev_motivations.tsv", sep="\t", header=1)
pdf("C:/Users/cbird/Documents/GitHub/code_review_icse13/figs/dev_motivations.pdf", width=8, height=6)
old = par("mar")
par(mar=c(5, 13, 4, 2))
cols = gray.colors(3)
k=barplot(t(as.matrix(a[10:1,2:4])), 
        horiz=T, names.arg=a[10:1,1], xlim=c(0,700),
        main = "Ranked Motivations From Developers",
        col=cols,
        las=2, args.legend=list(horiz=TRUE, bty="n", x=650, y=13.3, cex=1.25),
          legend.text=c("Top", "Second", "Third"), cex.names=1.25, cex.main=1.5)
#legend(x=350, y=13, legend=c("Top", "Second", "Third"), horiz=TRUE, fill=cols)
dev.off();
par(mar=old)
}
motivations = function(dopdf=FALSE)
{
  setwd("c:/Users/cbird/Documents/Projects/codereview/")
  a = read.table("dev_motivations.tsv", sep="\t", header=1)
  if (dopdf)
  {
    pdf("C:/Users/cbird/Documents/GitHub/code_review_icse13/figs/dev_motivations.pdf", width=9, height=6)
  }
  #old = par("mar")
  #par(mar=c(5, 13, 4, 2))
  cols = gray.colors(3)
  f = as.matrix(a[10:1,c(2,3,4)])
  rownames(f) = a$category[10:1]
  plot(barchart(f, col=cols[c(3,2,1)],
                xlab=list("Responses", cex=1.3),
              
                
                main=list("Ranked Motivations From Developers", cex=1.3),
                scales=list(cex=1.3), 
                            #y=list(cex=1.3)),
                key=list(
                  text=list(c("Top", "Second", "Third"), cex=1.3), 
                  rectangles=list(col=cols[c(3, 2, 1)]),
                  columns=3)
  )
  )
  if (dopdf)
  {
    dev.off()
  }
  #par(mar=old)
}



understanding = function(dopdf=FALSE)
{
  setwd("c:/Users/cbird/Documents/Projects/codereview/")
  a = read.table("understanding.tsv", sep="\t", header=1)
  a$NegNone = -a$None
  a$NegLow = -a$Low
  if (dopdf)
  {
    pdf("C:/Users/cbird/Documents/GitHub/code_review_icse13/figs/understanding.pdf", width=9, height=6)
  }
    #old = par("mar")
  #par(mar=c(5, 13, 4, 2))
  cols = gray.colors(4)
  f = as.matrix(a[10:1,c(7,6,4,5)])
  rownames(f) = a$Category[10:1]
  plot(barchart(f, col=cols[c(3,4,2,1)],
          xlab=list("Responses", cex=1.3),
          
          main=list("Level of Understanding Needed", cex=1.3),
          scales=list(cex=1.3, 
                      x=list(at=c(-500, 0, 500), 
                      labels=c(500, 0, 500))),
          key=list(
            text=list(c("None", "Low", "High", "Complete"), cex=1.3), 
            rectangles=list(col=cols[c(4, 3, 2, 1)]),
            columns=4)
          )
       )
  if (dopdf)
  {
    dev.off()
  }
  #par(mar=old)
}

comments = function(dopdf=FALSE)
{
  setwd("c:/Users/cbird/Documents/Projects/codereview/")
  a = read.table("comments.tsv", sep="\t", header=1)
  if (dopdf)
  {
    pdf("C:/Users/cbird/Documents/GitHub/code_review_icse13/figs/comments.pdf", width=9, height=6)
  }

  cols = gray.colors(1)
  print(a)
  f = as.matrix(a[1:9,2]*100)
  rownames(f) = a$category
  plot(barchart(f, 
                col=cols,
                xlab=list("Percentage of Comments", cex=1.3),
                
                main=list("Comments in each Category", cex=1.3),
                scales=list(cex=1.3, 
                            x=list(at=c(0, 10, 20, 30), 
                                   labels=c("0%", "10%", "20%", "30%")))
                #key=list(
                #  text=list(c("None", "Low", "High", "Complete"), cex=1.3), 
                #  rectangles=list(col=cols[c(4, 3, 2, 1)]),
                #  columns=4)
    )
  )
  if (dopdf)
  {
    dev.off()
  }
}

comments()
