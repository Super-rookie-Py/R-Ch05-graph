###  Ch05.그래프그리기

###  2020/04/28 keonwoo park

## 06.일변량 수치형 자료

wgt <- read.csv("0401.wgt.csv",
                header = TRUE,
                na.strings = ".")
str(wgt)

wgt$sex <- factor(wgt$sex,
                  levels = c(1, 2),
                  labels = c("남자","여자")
)
str(wgt)

attach(wgt)

# 몸무게 히스토그램 및 분포 -> 연속적일떄 사용(수치형자료) 
hist(weight)
boxplot(weight)
stem(weight)

#연속형자료를 범주형자료로 변환 cut이용

wgt<- transform(wgt,
                wgt.cut = cut(weight,
                              breaks = c(0,45,50,55,60,65,70,100),
                              right = FALSE,
                              labels = c("~45미만",
                                         "45~50미만",
                                         "50~55미만",
                                         "55~60미만",
                                         "60~65미만",
                                         "65~70미만",
                                         "70이상~")))
wgt

# 범주형 자료로 변환 ifelse 이용
wgt <- transform(wgt,
                 wgt.if = ifelse(weight < 45, "~45미만",
                                 ifelse(weight >=45 & weight<50,"45~50미만",
                                        ifelse(weight >=50 & weight<55, "50~55미만",
                                               ifelse(weight >=55 & weight<60, "55~60미만",
                                                      ifelse(weight >=60 & weight<65, "60~65미만",
                                                             ifelse(weight >=65 & weight<70,"65~70미만","70이상~"
                                                                    )
                                                             )
                                                      )
                                               )
                                        )
                                 )
                 )
wgt
detach(wgt)
attach(wgt)
# 데이터프레임을 새롭게 수정했을 경우에는 detach한후에 attach
table(wgt.if)
barplot(table(wgt.if))

# 히스토그램 bin 설정
hist(weight,
     breaks =7,
     col ="red",
     min(weight),
     max(weight))

detach(wgt)
