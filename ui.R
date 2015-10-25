library(shiny)
library(shinythemes)
shinyUI(
        
        fluidPage(theme = shinytheme("flatly"),
                titlePanel("RMS Titanic"),
                fluidRow(
                        column(10, offset = 1,
                                helpText("This simple application will let you simulate your chances of having survived the 
                                         Titanic tragedy. The prediction is based on the dataset contained in the R 'datasets' library.")
                        )       
                ),
                fluidRow(
                        column(12,
                                column(4,
                                        h4(helpText("Select your gender:")),
                                        wellPanel(
                                                radioButtons("sex", "Your Sex:",
                                                             c("Male" = "Male",
                                                               "Female" = "Female"
                                                             ))
                                        )
                                ),
                                column(4,
                                       helpText("Select your Age:"),
                                       wellPanel(
                                                radioButtons("age", "Your Age:",
                                                             c("Adult" = "Adult",
                                                               "Child" = "Child"
                                                             ))
                                        )
                                ),
                                column(4,
                                       helpText("Select the Class at which you travel:"),
                                       wellPanel(
                                                radioButtons("class", "What Class are you traveling in:",
                                                             c("1st Class" = "1st",
                                                               "2nd Class" = "2nd",
                                                               "3rd Class" = "3rd",
                                                               "I'm part of the crew" = "Crew"
                                                             ))
                                        )
                                )
                        )
                ),
                fluidRow(
                        column(8, offset=2,
                               h3(textOutput("chances_message")),
                               h4(textOutput("chances"))
                        ),
                        column(8, offset=2,
                               h5(textOutput("likeme"))
                        ),
                        column(8, offset=2,
                               h5(textOutput("total"))   
                        ),
                        column(8, offset=2,
                               h5(textOutput("survivors"))
                        )
                )
        )
)


        