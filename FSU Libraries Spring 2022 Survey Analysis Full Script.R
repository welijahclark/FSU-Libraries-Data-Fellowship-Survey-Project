###############################################################################
#-----------------------------------------------------------------------------#
#Master Script for FSU Libraries Spring 2022 Student Engagement Survey Project#
#-----------------------------------------------------------------------------#
###############################################################################


#---------------------#
#Data Importation Step#
#---------------------#

#FYI; you will need your own copy of this survey data. Please contact rjulian@fsu.edu or nruhs@fsu.edu if you would like to request access to this data for your own research-- the original data entails confidential student data from Florida State University and may be subject to additional stipulations.
#You may contact me at either weclark@fsu.edu, wec19b@fsu.edu, or welijahclark@gmail.com for questions related to the structure of this code or the survey design I made for this project.

X2022FSULibSurveyDataFinalVersion <- read.csv("C:/Users/welij/OneDrive/Documents/FSU Libraries Data Fellowship Files/Spring22 Survey Project/Datasets/2022FSULibSurveyDataFinalVersion.csv")

#---------------------#
#List of All Variables#
#---------------------#

##For an explanation of the variables in context, please read the variable code book

#Numerically coded variables#
Q1N <- X2022FSULibSurveyDataFinalVersion$Q1_Num
Q2NV1 <- X2022FSULibSurveyDataFinalVersion$Q2_NumV1
Q2NV2 <- X2022FSULibSurveyDataFinalVersion$Q2_NumV2
Q3N <- X2022FSULibSurveyDataFinalVersion$Q3_YN_Num
Q3AN <- X2022FSULibSurveyDataFinalVersion$Q3A
Q3BN <- X2022FSULibSurveyDataFinalVersion$Q3B
Q3CN <- X2022FSULibSurveyDataFinalVersion$Q3C
Q3DN <- X2022FSULibSurveyDataFinalVersion$Q3D
Q3EN <- X2022FSULibSurveyDataFinalVersion$Q3E
Q4N <- X2022FSULibSurveyDataFinalVersion$Q4_Num
Q4AN <- X2022FSULibSurveyDataFinalVersion$Q4A
Q4BN <- X2022FSULibSurveyDataFinalVersion$Q4B
Q4CN <- X2022FSULibSurveyDataFinalVersion$Q4C
Q4DN <- X2022FSULibSurveyDataFinalVersion$Q4D
Q4EN <- X2022FSULibSurveyDataFinalVersion$Q4E
Q7.1N <- X2022FSULibSurveyDataFinalVersion$Q7_1_Num
Q7.2N <- X2022FSULibSurveyDataFinalVersion$Q7_2_Num
Q7.3N <- X2022FSULibSurveyDataFinalVersion$Q7_3_Num
Libstaff <- X2022FSULibSurveyDataFinalVersion$LibStaff

#Categorically coded variables#
RankedQ1N <- factor(Q1N)
RankedQ2NV1 <- factor(Q2NV1)
RankedQ2NV2 <- factor(Q2NV2)
RankedQ3N <- factor(Q3N)
RankedQ4N <- factor(Q4N) 
RankedQ7.1N <- factor(Q7.1N)
RankedQ7.2N <- factor(Q7.2N)
RankedQ7.3N <- factor(Q7.3N)
RankedLibStaff <- factor(Libstaff)

#----------------------------------------#
#All required R libraries for this script#
#----------------------------------------#

library(ggplot2)
library(tidyr)
library(lmtest)
library(car)
library(data.table)

#------------------#
#Summary Statistics#
#------------------#

#Question 1
mean(Q1N)
median(Q1N)

#Question 7.1 (w/ na.omit variable)
na.rmQ7.1N <- na.omit(Q7.1N)
mean(na.rmQ7.1N)
median(na.rmQ7.1N)

#Question 7.2 (w/ na.omit variable)
na.rmQ7.2N <- na.omit(Q7.2N)
mean(na.rmQ7.2N)
median(na.rmQ7.2N)

#Question 7.3 (w/ na.omit variable)
na.rmQ7.3N <- na.omit(Q7.3N)
mean(na.rmQ7.3N)
median(na.rmQ7.3N)


#-------------------------#
#Raw Univariate Bar Graphs#
#-------------------------#

###Note 1: This section requires the ggplot2 package###
###Note 2: Graphs were exported as SVGs and polished in Adobe Illustrator for presentations###

##Unscaled Bar Graphs##

#Question 1#
ggplot(X2022FSULibSurveyDataFinalVersion, aes(x=Q1N))+geom_bar(stat="count", fill="#782F40", colour="black")+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())

#Question 2 version 1#
#(This version does NOT separate social science majors from business-related majors)
ggplot(X2022FSULibSurveyDataFinalVersion, aes(x=Q2NV1))+geom_bar(stat="count", fill="#782F40", colour="black")+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())

#Question 2 version 2#
#(This version separates social science majors from business-related majors)
ggplot(X2022FSULibSurveyDataFinalVersion, aes(x=Q2NV2))+geom_bar(stat="count", fill="#782F40", colour="black")+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())

#Question 3#
ggplot(X2022FSULibSurveyDataFinalVersion, aes(x=Q3N))+geom_bar(stat="count", fill="#782F40", colour="black")+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())

#Question 4#
ggplot(X2022FSULibSurveyDataFinalVersion, aes(x=Q4N))+geom_bar(stat="count", fill="#782F40", colour="black")+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())

#Question 7.1#
ggplot(X2022FSULibSurveyDataFinalVersion, aes(x=Q7.1N))+geom_bar(stat="count", fill="#782F40", colour="black")+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())

#Question 7.2#
ggplot(X2022FSULibSurveyDataFinalVersion, aes(x=Q7.2N))+geom_bar(stat="count", fill="#782F40", colour="black")+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())

#Question 7.3#
ggplot(X2022FSULibSurveyDataFinalVersion, aes(x=Q7.3N))+geom_bar(stat="count", fill="#782F40", colour="black")+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())



##Rescaled Bar Graphs##
#Cautionary Note: If you run this with a larger or different sample, you will most likely need to change the ylim coordinates to the size of your largest bin

#Question 1#
ggplot(X2022FSULibSurveyDataFinalVersion, aes(x=Q1N))+geom_bar(stat="count", fill="#782F40", colour="black")+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())+ylim(0,20)

#Question 2 Version 1#
#(This version does NOT separate social science majors from business-related majors)
ggplot(X2022FSULibSurveyDataFinalVersion, aes(x=Q2NV1))+geom_bar(stat="count", fill="#782F40", colour="black")+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())+ylim(0,35)

#Question 2 Version 2#
#(This version separates social science majors from business-related majors)
ggplot(X2022FSULibSurveyDataFinalVersion, aes(x=Q2NV2))+geom_bar(stat="count", fill="#782F40", colour="black")+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank()) + ylim(0,20)

#Question 3#
ggplot(X2022FSULibSurveyDataFinalVersion, aes(x=Q3N))+geom_bar(stat="count", fill="#782F40", colour="black")+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())+ylim(0,50)

#Question 4#
ggplot(X2022FSULibSurveyDataFinalVersion, aes(x=Q4N))+geom_bar(stat="count", fill="#782F40", colour="black")+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())+ylim(0,50)

#Question 7.1#
ggplot(X2022FSULibSurveyDataFinalVersion, aes(x=Q7.1N))+geom_bar(stat="count", fill="#782F40", colour="black")+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())+ylim(0,25)

#Question 7.2#
ggplot(X2022FSULibSurveyDataFinalVersion, aes(x=Q7.2N))+geom_bar(stat="count", fill="#782F40", colour="black")+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())+ylim(0,30)

#Question 7.3#
ggplot(X2022FSULibSurveyDataFinalVersion, aes(x=Q7.3N))+geom_bar(stat="count", fill="#782F40", colour="black")+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())+ylim(0,25)


#------------------------------------------------#
#Raw Grouped Bar Graphs for Questions 3, 4, and 5#
#------------------------------------------------#

###Note 1: This section requires the ggplot2 and tidyr packages###
###Note 2: Graphs were exported as SVGs and polished in Adobe Illustrator for presentations###


###Question 3 Only###

#New Dataframes for Question 3
Q3NewDataFrame <- structure(list(Q3A = c(X2022FSULibSurveyDataFinalVersion$Q3A), Q3B = c(X2022FSULibSurveyDataFinalVersion$Q3B),Q3C = c(X2022FSULibSurveyDataFinalVersion$Q3C), Q3D = c(X2022FSULibSurveyDataFinalVersion$Q3D), Q3E = c(X2022FSULibSurveyDataFinalVersion$Q3E), Q3YN = c(X2022FSULibSurveyDataFinalVersion$Q3_YN_Num) ), row.names = c(NA,56L), class = "data.frame")
#Note: 56L in the row.names statement allows us to have all 56 observations from our dataset present. 
Q3_Long <- Q3NewDataFrame |> pivot_longer(-Q3YN, names_to = "item", values_to = "response")

##Unscaled Question 3 Grouped Bar Graph##
ggplot(Q3_Long, aes(item, fill = factor(response))) + geom_bar(position = position_dodge(preserve = "single")) + scale_fill_manual(labels = c("0" = "Did not hear of", "1" = "Heard of"), values = c("0" = "#782F40", "1" = "#CEB888"))

##Rescaled Question 3 Grouped Bar Graph##
#Cautionary Note: If you run this with a larger or different sample, you will most likely need to change the ylim coordinates to the size of your largest bin
ggplot(Q3_Long, aes(item, fill = factor(response))) + geom_bar(position = position_dodge(preserve = "single")) + scale_fill_manual(labels = c("0" = "Did not hear of", "1" = "Heard of"), values = c("0" = "#782F40", "1" = "#CEB888")) + theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())+ylim(0,45)


###Question 4 Only###

#New Dataframes for Question 4
Q4NewDataFrame <- structure(list(Q4A = c(X2022FSULibSurveyDataFinalVersion$Q4A), Q4B = c(X2022FSULibSurveyDataFinalVersion$Q4B),Q4C = c(X2022FSULibSurveyDataFinalVersion$Q4C), Q4D = c(X2022FSULibSurveyDataFinalVersion$Q4D), Q4E = c(X2022FSULibSurveyDataFinalVersion$Q4E), Q4YN = c(X2022FSULibSurveyDataFinalVersion$Q4_Num) ), row.names = c(NA,56L), class = "data.frame")
#Note: 56L in the row.names statement allows us to have all 56 observations from our dataset present. 
Q4_Long <- Q4NewDataFrame |> pivot_longer(-Q4YN, names_to = "item", values_to = "response")

##Unscaled Question 4 Grouped Bar Graph##
ggplot(Q4_Long, aes(item, fill = factor(response))) + geom_bar(position = position_dodge(preserve = "single")) + scale_fill_manual(labels = c("0" = "Did not use", "1" = "Did use"), values = c("0" = "#782F40", "1" = "#CEB888"))

##Rescaled Question 3 Grouped Bar Graph##
#Cautionary Note: If you run this with a larger or different sample, you will most likely need to change the ylim coordinates to the size of your largest bin
ggplot(Q4_Long, aes(item, fill = factor(response))) + geom_bar(position = position_dodge(preserve = "single")) + scale_fill_manual(labels = c("0" = "Did not use", "1" = "Did use"), values = c("0" = "#782F40", "1" = "#CEB888")) + theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())+ylim(0,60)


###Combined Question 3+4+5 Grouped Bar Graph###

#New Dataframes for Question 3+4+5
Q3Q4NewDataFrame <- structure(list(Q3A = c(X2022FSULibSurveyDataFinalVersion$Q3A), Q3B = c(X2022FSULibSurveyDataFinalVersion$Q3B),Q3C = c(X2022FSULibSurveyDataFinalVersion$Q3C), Q3D = c(X2022FSULibSurveyDataFinalVersion$Q3D), Q3E = c(X2022FSULibSurveyDataFinalVersion$Q3E), Q3YN = c(X2022FSULibSurveyDataFinalVersion$Q3_YN_Num), Q4A = c(X2022FSULibSurveyDataFinalVersion$Q4A), Q4B = c(X2022FSULibSurveyDataFinalVersion$Q4B), Q4C = c(X2022FSULibSurveyDataFinalVersion$Q4C), Q4D = c(X2022FSULibSurveyDataFinalVersion$Q4D), Q4E = c(X2022FSULibSurveyDataFinalVersion$Q4E), Q4YN = c(X2022FSULibSurveyDataFinalVersion$Q4_Num)), row.names = c(NA,56L), class = "data.frame")
#New variables to construct next dataframe; necessary for linear algebra component
Q3Q4A <- Q3Q4NewDataFrame$Q3A+Q3Q4NewDataFrame$Q4A
Q3Q4B <- Q3Q4NewDataFrame$Q3B+Q3Q4NewDataFrame$Q4B
Q3Q4C <- Q3Q4NewDataFrame$Q3C+Q3Q4NewDataFrame$Q4C
Q3Q4D <- Q3Q4NewDataFrame$Q3D+Q3Q4NewDataFrame$Q4D
Q3Q4E <- Q3Q4NewDataFrame$Q3E+Q3Q4NewDataFrame$Q4E
#Added Dataframes
LinAlgQ3Q4 <- structure(list(Q4YN = c(X2022FSULibSurveyDataFinalVersion$Q4_Num),Q3Q4A=Q3Q4A, Q3Q4B=Q3Q4B, Q3Q4C=Q3Q4C, Q3Q4D=Q3Q4D, Q3Q4E=Q3Q4E), row.names = c(NA,56L), class = "data.frame")
#Note: 56L in the row.names statement allows us to have all 56 observations from our dataset present. 
LinAlgQ3Q4_Long <- LinAlgQ3Q4 |> pivot_longer(-Q4YN, names_to = "item", values_to = "response")

#Unscaled Bar Graph
ggplot(LinAlgQ3Q4_Long, aes(item, fill = factor(response))) + geom_bar(position = position_dodge(preserve = "single")) + scale_fill_manual(labels = c("0" = "Did not hear or use", "1" = "Heard, didn't use", "2" = "Heard and used"), values = c("0" = "#000000", "1" = "#782F40", "2" = "#CEB888"))

#Did not need an rescaled version of the graph for this project, but this could be added with a ylim statement if you need


#-------------#
#One-Way ANOVA#
#-------------#

###One-Way ANOVA to compare Question 7 responses to Academic Standing###

#Question 7.1
onewayANOVA1 <- aov(Q7.1N ~ RankedQ1N)
summary(onewayANOVA1)

#Question 7.2
onewayANOVA2 <- aov(Q7.2N ~ RankedQ1N)
summary(onewayANOVA2)

#Question 7.3
onewayANOVA3 <- aov(Q7.3N ~ RankedQ1N)
summary(onewayANOVA3)

###One-Way ANOVA to compare Q7 responses to Type of Major###

##Version 1#
#(This version does NOT separate social science majors from business-related majors)

#Question 7.1
onewayANOVA4 <- aov(Q7.1N ~ RankedQ2NV1)
summary(onewayANOVA4)

#Question 7.2
onewayANOVA5 <- aov(Q7.2N ~ RankedQ2NV1)
summary(onewayANOVA5)

#Question 7.3
onewayANOVA6 <- aov(Q7.3N ~ RankedQ2NV1)
summary(onewayANOVA6)

##Version 2##
#(This version separates social science majors from business-related majors)

#Question 7.1
BizANOVA1 <- aov(Q7.1N ~ RankedQ2NV2)
summary(BizANOVA1)

#Question 7.2
BizANOVA2 <- aov(Q7.2N ~ RankedQ2NV2)
summary(BizANOVA2)

#Question 7.3
BizANOVA3 <- aov (Q7.3N ~ RankedQ2NV2)
summary(BizANOVA3)


###One-Way ANOVA to compare Q7 responses to whether or not respondents had previously heard about FSU Libraries research data services###

#Question 7.1
AwarenessonewayANOVA1 <- aov(Q7.1N ~ RankedQ3N)
summary(AwarenessonewayANOVA1)

#Question 7.2
AwarenessonewayANOVA2 <- aov(Q7.2N ~ RankedQ3N)
summary(AwarenessonewayANOVA2)

#Question 7.3
AwarenessonewayANOVA3 <- aov(Q7.3N ~ RankedQ3N)
summary(AwarenessonewayANOVA3)


###One-Way ANOVA to compare Q7 responses to people who used/didn't use a FSU Libraries research data service###

#Question 7.1
AwarenessonewayANOVA4 <-aov(Q7.1N ~ RankedQ4N)
summary(AwarenessonewayANOVA4)

#Question 7.2
AwarenessonewayANOVA5 <-aov(Q7.2N ~ RankedQ4N)
summary(AwarenessonewayANOVA5)

#Question 7.3
AwarenessonewayANOVA6 <-aov(Q7.3N ~ RankedQ4N)
summary(AwarenessonewayANOVA6)


###One-Way ANOVA to compare the use of a service to previously hearing about a service###

Q3Q4oneway <- aov(Q4N ~ Q3N)
summary(Q3Q4oneway)

#-------------#
#Two-Way ANOVA#
#-------------#

###Two-way ANOVA comparing Academic Standing and Major Type to Question 7 Statements###


##Question 2 Version 1 Variable##
#(This version does NOT separate social science majors from business-related majors)

#Version 1 Major Variable, Question 7.1#
twowayANOVA1 <- aov(Q7.1N ~ RankedQ1N + RankedQ2NV1)
summary(twowayANOVA1)

#Version 1 Major Variable, Question 7.2#
twowayANOVA2 <- aov(Q7.2N ~ RankedQ1N + RankedQ2NV1)
summary(twowayANOVA2)

#Version 1 Major Variable, Question 7.3#
twowayANOVA3 <- aov(Q7.3N ~ RankedQ1N + RankedQ2NV1)
summary(twowayANOVA3)


##Question 2 Version 2 Variable##
#(This version separates social science majors from business-related majors)

#Version 2 Major Variable, Question 7.1#
BizANOVATwoWay1 <- aov(Q7.1N ~ RankedQ1N + RankedQ2NV2)
summary(BizANOVATwoWay1)

#Version 2 Major Variable, Question 7.2#
BizANOVATwoWay2 <- aov(Q7.2N ~ RankedQ1N + RankedQ2NV2)
summary(BizANOVATwoWay2)


#Version 2 Major Variable, Question 7.3#
BizANOVATwoWay3 <- aov(Q7.3N ~ RankedQ1N + RankedQ2NV2)
summary(BizANOVATwoWay3)



###Two-way ANOVA comparing Academic Standing and whether a respondent heard about a research data service to Question 7 Statements###

#Question 7.1; Categorical Academic Year, Categorical Awareness#
twoway1 <- aov(Q7.1N ~ RankedQ1N + RankedQ3N)
summary(twoway1)

#Question 7.1; Numeric Academic Year, Categorical Awareness#
twoway2 <- aov(Q7.1N ~ Q1N + RankedQ3N)
summary(twoway2)

#Question 7.1; Numeric Academic Year and Numeric Awareness#
twoway3 <- aov(Q7.1N ~ Q1N + Q3N)
summary(twoway3)


#Question 7.2; Numeric Academic Year, Categorical Awareness#
twoway4 <- aov(Q7.2N ~ Q1N + RankedQ3N)
summary(twoway4)

#Question 7.2; Categorical Academic Year, Categorical Awareness#
twoway4.1 <- aov(Q7.2N ~ RankedQ1N + RankedQ3N)
summary(twoway4.1)

#Question 7.2, Categorical Academic Year, Categorical Awareness#
twoway4.2 <- aov(Q7.2N ~ RankedQ1N + RankedQ3N)
summary(twoway4.2)


#Question 7.3; Numeric Academic Year, Categorical Awareness#
twoway5 <- aov(Q7.3N ~ Q1N + RankedQ3N)
summary(twoway5)

#Question 7.3; Numeric Academic Year, Numeric Awareness
twoway6 <- aov (Q7.3N ~ Q1N + Q3N)
summary(twoway6)


#Question 7.3; Categorical Academic Year, Categorical Awareness#
twoway6.1 <- aov(Q7.3N ~ RankedQ1N + RankedQ3N)
summary(twoway6.1)


###Multivariable ANOVA comparing Academic Standing and Hearing about a Data Service and whether or not someone is also FSU Libraries staff to Question 7 Statements
##Note; I did this to see if there would be a statistically significant difference between the responses of the first survey version taken by FSU Libraries student workers and the second survey with the general student population

#Question 7.1; Numerical Academic Year, Numerical Awareness, Categorical FSULibStaff
twoway7 <- aov(Q7.1N ~ Q1N + Q3N + RankedLibStaff)
summary(twoway7)

#Question 7.2; Numerical Academic Year, Numerical Awareness, Categorical FSULibStaff
twoway8 <- aov(Q7.2N ~ Q1N + Q3N + RankedLibStaff)
summary(twoway8)

#Question 7.3; Numerical Academic Year, Numerical Awareness, Categorical FSULibStaff
twoway9 <- aov(Q7.3N ~ Q1N + Q3N + RankedLibStaff)
summary(twoway9)



#---------------------------------------#
#Linear and Logistic Regression Analysis#
#---------------------------------------#


###Comparing answers to Q7 rows to whether or not a respondent actually used a service
LogisticReg1 <- glm(Q4N ~ Q7.1N + Q7.2N + Q7.3N, data= X2022FSULibSurveyDataFinalVersion, family = "binomial")
summary(LogisticReg1)


###Comparing answers to Q7.2, years in college, and major type to whether or not a respondent actually used a service
LogisticReg2 <- glm(formula = Q4N ~ Q7.2N + Q1N + RankedQ2NV1, data=X2022FSULibSurveyDataFinalVersion, family = "binomial")
summary(LogisticReg2)


###Comparing use of research data services to having previously hearing about research data services AND years in college

#Logistic Regression Version
LogisticReg3 <-glm(formula= Q4N ~ Q1N + RankedQ3N, data=X2022FSULibSurveyDataFinalVersion, family = "binomial")
summary(LogisticReg3)

#Linear Regression Version
LinearReg1 <-lm(formula= Q4N ~ Q1N + RankedQ3N)
summary(LinearReg1)


###Comparing use of a data service to previously hearing about a data service ONLY

#Logistic Regression Version
LogisticReg4 <- glm(formula = Q4N ~ Q3N, data=X2022FSULibSurveyDataFinalVersion, family = "binomial")
summary(LogisticReg4)

#Linear Regression Version
LinearReg2 <- lm(formula= Q4N ~ RankedQ3N)
summary(LinearReg2)

###Comparing Q7.X Statements to academic standing in linear regression 

AnotherLinReg1 <- lm(formula= Q7.1N ~ Q1N)
summary(AnotherLinReg1)

AnotherLinReg2 <- lm(formula = Q7.2N ~ Q1N)
summary(AnotherLinReg2)

AnotherLinReg3 <- lm(formula = Q7.3N ~ Q1N)
summary(AnotherLinReg3)



###Comparing Q7.X Statements to major type in linear regression 

MoreLinReg1 <- lm(formula = Q7.1N ~ Q2NV1)
summary(MoreLinReg1)

MoreLinReg2 <- lm(formula = Q7.2N ~ Q2NV1)
summary(MoreLinReg2)

MoreLinReg3 <- lm(formula = Q7.3N ~ Q2NV1)
summary(MoreLinReg3)

MoreLinReg4 <- lm(formula = Q7.1N ~ Q2NV2)
summary(MoreLinReg4)

MoreLinReg5 <- lm(formula = Q7.2N ~ Q2NV2)
summary(MoreLinReg5)

MoreLinReg6 <- lm(formula = Q7.3N ~ Q2NV2)
summary(MoreLinReg6)


###Comparing the use of a data service to years in college ONLY
##Using years as a categorical variable to get specific details on each year

#Logistic Regression Version
LogisticReg5 <- glm(formula= Q4N ~ RankedQ1N, data=X2022FSULibSurveyDataFinalVersion, family ="binomial")
summary(LogisticReg5)

#Linear Regression Version
LinearReg3 <- lm(formula= Q4N ~ RankedQ1N)
summary(LinearReg3)




###Using years as a numerical variable in the same logistic model outlined above

#Logistic Regression Version
LogisticReg6 <- glm(formula= Q4N ~ Q1N, data=X2022FSULibSurveyDataFinalVersion, family="binomial")
summary(LogisticReg6)


#Linear Regression Version
LinearReg4 <- lm(formula = Q4N ~ Q1N)
summary(LinearReg4)


##In conclusion, I think this is the most useful model for predicting whether someone will USE a research data service
LogisticReg7 <- glm(formula = Q4N ~ Q7.2N, data=X2022FSULibSurveyDataFinalVersion, family = "binomial") 
summary(LogisticReg7)


#-----------------------------------------#
#Some Durbin-Watson Statistics Diagnostics#
#-----------------------------------------#

x1 <- 1:56
x2 <- as.numeric(x1)

#DW Testing of one of the Q7 questions to major type, with the response order vector added
DWANOVA1 <- aov(Q7.2N ~ RankedQ2NV1 + x2)
dwtest(DWANOVA1, alternative = 'less')
dwtest(DWANOVA1, alternative = 'greater')


durbinWatsonTest(DWANOVA1)

#We can also do some Durbin-Watson analysis on the data where business majors and social sciences majors are separated
BizDWANOVA <- aov(Q7.2N ~ RankedQ2NV2 + x2)
dwtest(BizDWANOVA, alternative = 'less')
dwtest(BizDWANOVA, alternative = 'greater')

durbinWatsonTest(BizDWANOVA)


#More Durbin-Watson testing done on Q3 and Q4 specifically

DWANOVA2 <- aov(Q4N ~ Q3N + x2)
dwtest(DWANOVA2, alternative = 'less')
dwtest(DWANOVA2, alternative = 'greater')
durbinWatsonTest(DWANOVA2)


#------------------------------------#
#Information on Survey Response Times#
#------------------------------------#

time <- (X2022FSULibSurveyDataFinalVersion$`Duration (in seconds)`)
minutetime <- time/60
mean(minutetime)

#Note; This secion requires library(data.table)
outlierReplace = function(dataframe, cols, rows, newValue = NA) {if (any(rows)) {set(dataframe, rows, cols, newValue)}}
outlierReplace(X2022FSULibSurveyDataFinalVersion, "Duration (in seconds)", which(X2022FSULibSurveyDataFinalVersion$`Duration (in seconds)` > 1000, NA))
View(X2022FSULibSurveyDataFinalVersion)
mean(na.omit(X2022FSULibSurveyDataFinalVersion$`Duration (in seconds)`))
mean(na.omit(X2022FSULibSurveyDataFinalVersion$`Duration (in seconds)`))/60


#Histogram of the survey data in seconds (with outliers included)
h <-hist(time, breaks = 100, col="#782F40", xlab = "Duration in Seconds", main = "Histogram of Survey Durations")
h2 <- hist(na.omit(X2022FSULibSurveyDataFinalVersion$`Duration (in seconds)`), breaks=10, col="#782F40", xlab = "Duration in Seconds", main = "Histogram with Normal Curve (No Outliers)")

#Density Plot of Survey Duration in Seconds (with outliers included)
d <-density(X2022FSULibSurveyDataFinalVersion$`Duration (in seconds)`)
plot(d, main="Kernel Density of Survey Duration in Seconds")
polygon(d, col="#782F40", border="black")

d2 <-density(na.omit(X2022FSULibSurveyDataFinalVersion$`Duration (in seconds)`))
plot(d2, main="Kernel Density of Survey Duration in Seconds (No Outliers)")
polygon(d2, col="#782F40", border="black")


qqnorm(X2022FSULibSurveyDataFinalVersion$`Duration (in seconds)`, pch=1, frame = FALSE, main = "Q-Q Plot For Survey Duration in Seconds")
qqline(X2022FSULibSurveyDataFinalVersion$`Duration (in seconds)`, col="#782F40", lwd=2)

qqnorm(na.omit(X2022FSULibSurveyDataFinalVersion$`Duration (in seconds)`), pch=1, frame = FALSE, main = "Q-Q Plot For Survey Duration in Seconds (No Outliers)")
qqline(X2022FSULibSurveyDataFinalVersion$`Duration (in seconds)`, col="#782F40", lwd=2)

#Time to scale the above information and graphics into minutes instead of seconds
omittedtime <- na.omit(X2022FSULibSurveyDataFinalVersion$`Duration (in seconds)`)
OmittedMinuteTime <- omittedtime/60

h3 <- hist(OmittedMinuteTime, breaks=10, col="#782F40", xlab = "Duration in Minutes", main = "Histogram with Normal Curve (No Outliers)")

d3 <-density(OmittedMinuteTime)
plot(d3, main="Kernel Density of Survey Duration in Minutes (No Outliers)")
polygon(d3, col="#782F40", border="black")

