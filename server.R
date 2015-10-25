library(shiny)
library(datasets)
library(dplyr)
data = Titanic
data = data.frame(data)

passenger_tot = sum(data$Freq)
passenger_alive = sum(data$Freq[data$Survived=="Yes"])
passenger_dead = sum(data$Freq[data$Survived=="No"])


shinyServer(
        function(input, output){
                
                likeme_tot = reactive({sum(data$Freq[data$Class==input$class & data$Sex==input$sex & data$Age==input$age])})
                likeme_alive = reactive(sum(data$Freq[data$Class==input$class & data$Sex==input$sex & data$Age==input$age & data$Survived=="Yes"]))
                likeme_dead = reactive(sum(data$Freq[data$Class==input$class & data$Sex==input$sex & data$Age==input$age & data$Survived=="No"]))

                output$chances = renderText(
                        {
                                if (likeme_tot()>0) {c("Your chances of survival:",round(likeme_alive()/likeme_tot()*100, digits=2),"%")}
                                else {"There were no passengers like you onboard. Try again."}
                        }
                )
                
                output$chances_message = renderText(
                        {
                                if (likeme_tot()>0) {
                                        likeme_chances = round(likeme_alive()/likeme_tot() * 100, digits=2)
                                        if (likeme_chances  >= 50){likeme_message = "Chances are that you made it out alive in the tragedy!"}
                                        if (likeme_chances  < 50){likeme_message = "Chances are that you went down with the ship!"}
                                }
                                else {likeme_message = ""}
                                likeme_message
                        }
                )
                        
                output$likeme = renderText(
                        {c("There were ",likeme_tot(), " passengers on board the Titanic exactly like you of which ",likeme_alive(), " survived and ", likeme_dead()," died.")}
                )

                output$total = renderText(
                        {c("Total number of passengers (including crewmembers):", passenger_tot)}
                )

                output$survivors = renderText(
                        {c(passenger_alive, " survived and ", passenger_dead, " died.")}
                )
                
        
        }
)