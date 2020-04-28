###  Ch05.그래프그리기

###  2020/04/28 keonwoo park

## 04.다변량 범주형 자료

pre <- read.csv("0302.pre.csv",
                head = TRUE,
                na.strings = ".")
pre$treat <- factor(pre$treat,
                    levels = c(1, 2),
                    labels = c("비타민","Placebo"))
pre$cold <- factor(pre$cold,
                   levels = c(1, 2),
                   labels = c("Cold",'noCold'))
attach(pre)

# 누적막대그래프(barplot) - 2개변수
# 데이터 테이블로 변환

pre <- table(treat, cold)
pre
barplot(pre,
        main="비타민 섭취에 따른 감기 유병률",
        xlab = "집단",
        ylab = "%",
        col = c("darkblue","red"),
        legend = rownames(pre))

# 누적막대그래프 barblot -side 배치
barplot(pre,
        main="비타민 섭취에 따른 감기 유병률",
        xlab = "집단",
        ylab = "%",
        ylim = c(0,50),
        col = c("darkblue","red"),
        legend = rownames(pre),
        beside=TRUE) #한줄에 표시하냐 옆에표시하냐(T)

# 05.모자이크 그래프
mosaicplot(pre,
           shade=TRUE,
           xlab = "treat",
           ylab = "감기유무",
           main = "비타민섭취에 따른 감기 유병률")

detach(pre)
