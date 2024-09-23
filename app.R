# Shiny 라이브러리 불러오기
library(shiny)

# UI 부분 정의
ui <- fluidPage(
  titlePanel("Iris 데이터셋 Boxplot"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", "Boxplot의 변수를 선택하세요:",
                  choices = names(iris)[1:4])  # Iris 데이터셋의 1-4번 변수 선택
    ),
    
    mainPanel(
      plotOutput("boxPlot")  # Boxplot을 출력할 공간
    )
  )
)

# 서버 부분 정의
server <- function(input, output) {
  output$boxPlot <- renderPlot({
    boxplot(iris[[input$variable]], 
            main = paste("Boxplot of", input$variable),
            ylab = input$variable,
            col = "lightblue")
  })
}

# UI와 서버를 연결하여 앱 실행
shinyApp(ui = ui, server = server)
