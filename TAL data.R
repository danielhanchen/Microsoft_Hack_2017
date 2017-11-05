library(data.table)

c <- fread("claims2.csv", header=TRUE)
p <- fread("policy.csv", header=TRUE)
u <- fread("underwriting.csv", header=TRUE)

x <- merge(c,u, all.x = TRUE, by="POLICY_KEY_ANON")
y <- x[complete.cases(x)]

z <- merge(c,p, all=TRUE, by="POLICY_KEY_ANON")
o <- z[complete.cases(z)]
length(z)
ff <- merge(z,u, all=TRUE, by="POLICY_KEY_ANON")
length(ff)
y$POLICY_KEY_ANON
#fwrite(x,"tal.csv")

row.has.na <- apply(x, 1, function(x){any(is.na(x))})
sum(row.has.na)
