###  Ch05.그래프그리기

###  2020/04/28 keonwoo park

## 01. 일변량 범주형자료

freq <- read.csv("0301.frequency.csv",
                 header = TRUE,
                 na.strings = ".")

freq$grade <- factor(freq$grade,
                     levels= c(1:5),
                     labels = c("F","D","C","B","A"))
str(freq)



attach(freq)

barplot(grade)
# 그래프 에러(table로 정리한 후에 연결해야 사용할 수 있다. 원자료 사용 못함.)
# 기본 막대그래프
grade <- table(grade) # 테이블로 데이터 개수를 파악해야함.
barplot(grade)

# 막대그래프 옵션
barplot(grade,
        main = "학점별 분포",
        xlab = "학점",
        ylab = "명",
        ylim = c(0,30),
        legend = rownames(grade))

# 수평 막대 그래프 + 컬러
barplot(grade,
        main = "학점별 분포",
        horiz = TRUE,    #그래프를 수평으로
        xlab = "학점",
        ylab = "명",
        col = heat.colors(5)) #그라데이션


## 02. 원그래프
pie(grade,
    main="학점별 분포",
    init.angle = 90,
    col = rainbow(length(grade)))
legend(1, 1,
       rownames(grade),
       cex = 1,
       fill = rainbow(length(grade)))

# 3D 원그래프 옵션
# install.packages('plotrix')
library(plotrix)

pie3D(grade,
      main="학점별 분포",
      labels = grade,
      explode = 0.1, #원간격
      col = rainbow(length(grade))
      ) 

legend(0.5, 1,
       rownames(grade),
       cex = 0.5,
       fill = rainbow(length(grade)))

detach(freq)
