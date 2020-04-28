###  Ch05.그래프그리기

###  2020/04/28 keonwoo park

## 08.다변량 수치형 자료

# 그룹간 연속변수 특성 비교
boxplot(weight ~ sex, #종속변수 ~ 성별에
        data=wgt,
        main = "성별에 따른 몸무게 분포",
        xlab="성별",
        ylab ="kg")

# 여러 연속자료 비교
load("game.RData")
game

attach(game)

o1 <-mean(o1)
o2 <-mean(o2)
fb1 <- mean(fb1)
fb2 <- mean(fb2)
fb3 <- mean(fb3)

game.t <- cbind(o1,o2,fb1,fb2,fb3)
game.t

barplot( game.t,
         col = c("darkblue"),
         main = "연속변수 평균",
         names.arg= c(colnames(game.t)),
         ylim=c(0,4)
)

detach(game)
