###  Ch05.그래프그리기

###  2020/04/28 keonwoo park

## 09.고급 그래프 그리기
# install.packages("ggplot2")

library(ggplot2)

# 막대그래프
ggplot(wgt, aes(x=sex)) + geom_bar()

# 그룹간 상자도표(범주 + 수치형 자료)

ggplot(wgt, aes(x=sex, y=weight)) +
  geom_boxplot(position="dodge") +
  ggtitle("성별 체중 상자도표")
