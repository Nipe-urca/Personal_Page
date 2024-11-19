#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(OSUICode)
#library(dplyr)
#library(tidyr)

# Define UI for application that draws a histogram
ui <- function(){
  # tags$head(
  #   HTML(
  #     "
  #     <title> NIPE </title>
  #     <p><font size = 20, color = gray>
  #     <center>
  #     Núcleo Integrado de Pesquisa Econômica
  #     </center>
  #     </p>
  #     <center><img src = logo.png width = 100, height = 100></>
  #     "
  #   )
  # )
  div(style = "width: 100%; height: 100%;") # com isso a pagina se ajusta a largura da janela quando minimiza a tela
  tags$head(
    tags$title(HTML(
      "
      <title> NIPE-Urca</title>
      "
    )),
    tags$p("Núcleo Integrado de Pesquisa Econômica", style = "font-size: 40px; color: #4d3a7d; text-align: center; font-famyly: Georgia"),
    HTML(
      "
      <center>
      <img src = logo.png , width = 150, height = 150>
      </center>
      "
    ),
    column(width = 1),
    column(width = 10, align = "center",
           navbarPage(
             title = "  ", id="main", position = "static-top", 
             tabPanel(# Sobre nós na barra de navegação
               title = "Sobre nós", 
               span(htmlOutput("texto_inicial", style = "color:black; font-size: 18px; font-family:times; text-align: left")),
               hr(),
               span(htmlOutput("titulo_equipe"), style = "color:black; font-size:3; font-family:times; text-align: center; background-color: red; width:300px;"),
               hr(),
               column(width = 2),
               column(width = 2,
                      span(htmlOutput("membro1"), style = "color:black; font-size:3; font-family:times; text-align: center; background-color: red;"),
                      imageOutput("foto1")
                      ),
               column(width = 2,
                      span(htmlOutput("membro2"), style = "color:black; font-size:3; font-family:times; text-align: center; background-color: red;"),
                      imageOutput("foto2")
               ),
               column(width = 2,
                      span(htmlOutput("membro3"), style = "color:black; font-size:3; font-family:times; text-align: center; background-color: red;"),
                      imageOutput("foto3")
               ),
               column(width = 2,
                      span(htmlOutput("membro4", style = "color:black; font-size:3; font-family:times; text-align: center")),
                      imageOutput("foto4")
               )
             ), 
             tabPanel(# Painel de publicações
               title = "Publicações",
               column(width = 1),
               column(width = 3,
                      selectInput(inputId =  "ano_publicacao", choices = c(2024), label = "Período")
                      ),
               column(width = 3,
                      selectInput(inputId =  "tipo_publicacao", choices = c("Publicação em periódico", "Anais de encontro", "Pré-Prints", "Em construção"), label = "Tipo de publicação")
                      ),
               column(width = 3,
                      selectInput(inputId =  "tipo_docente", choices = c("Áydano Ribeiro", "Diogo Sobreira", "Helson Gomes", "Valdeir Soares"), label = "Pesquisador")
               ),
               column(width = 12, style = "text-align:left",
                      htmlOutput("titulos") # Titulos dos trabalhos
                      )
             ),
             tabPanel(# Projetos de pesquisa em andamento
               title = "Projetos",
               column(width = 12, style = "text-align:center",
                      htmlOutput("projetos") # Titulos dos trabalhos
               )
             ),
             tabPanel(# Materiais úteis
               title = "Materiais",
               htmlOutput("materiais")
             ),
             tabPanel(# Postagens do grupo de pesquisa
               title = "Postagens",
               htmlOutput("posts")
             )
           ),
           
           
           hr(),
           
           # Rodapé da página
           column(1),
           column(width = 12,style = "background-color:#282d32; width:100%; margin-bottom:50px; margin-top:5px",
                  column(1),
                  column(4,
                         tags$div(
                                   htmlOutput("rodape", style = "color:white; text-align:left"))
                         ),
                  column(1),
                  column(2,
                         tags$div(
                           htmlOutput("rodape2", style = "color:white; text-align:left"))
                  ),
                  column(1),
                  column(3,
                         tags$div(
                           htmlOutput("rodape3", style = "color:white; text-align:left"))
                  )
                  )
           
           )
    
  )
  
  
  
  
  
  
  
}

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$texto_inicial = renderText(
    "<p>O NIPE é um grupo de pesquisa criado junto à Universidade Regional do Cariri (URCA) com o objetivo de desenvolver pesquisas 
    nos mais variados temas envolvendo a teoria econômica e a economia aplicada. O NIPE é composto por Professores Doutores da URCA
    que desenvolvem pesquisas em três áreas mãe de atuação, sendo, microeconometria, finanças e teoria econômica. 
    </p>
    <p>
    Dentre as principais atribuições do grupo de pesquisa, destaca-se a busca por atender a demanda local por pesquisas de alto padrão no âmbito da ciência
    econômica. Além disso, o NIPE possui amplo foco na inserção dos discentes no campo da pesquisa e da extensão, expondo os alunos de graduação e pós-graduação 
    da URCA às técnicas de pesquisa que situam-se na fronteira do conhecimento da teoria econômica e da economia aplicada.
    </p>
    "
  )
  
  # Titulo da composicao da equipe
  output$titulo_equipe = renderText(
    "
    <p></p>
    <h1> Composição da equipe</h1>
    "
  )
  
  output$membro1 = renderText(HTML(
    "
    <a href=http://lattes.cnpq.br/8846897044541237> Valdeir Soares Monteiro</a>
    <p> Doutor em Economia (UFC) </p>
    <p> Área mãe:  <br>Finanças</br></p> 
    "
  ))
  
  output$foto1 = renderImage({
    list(src = "www/valdeirCircular.png", width = "80%", height = "110")
  }, deleteFile = FALSE)
  
  output$membro2 = renderText(HTML(
    "
    <a href=http://lattes.cnpq.br/3280720633645199>Diogo Brito Sobreira</a>
    <p> Doutor em Economia (UFV) </p>
    <p> Área mãe: Microeconometria </p>
    "
  ))
  
  output$foto2 = renderImage({
    list(src = "www/diogoCircular.png", width = "80%", height = "110")
  }, deleteFile = FALSE)
  
  output$membro3 = renderText(HTML(
    "
    <a href= http://lattes.cnpq.br/6906677347926569> Helson Gomes de Souza</a>
    <p> Doutor em Economia (UFPB) </p>
    <p> Área mãe: Teoria Econômica </p>
    "
  ))
  
  output$foto3 = renderImage({
    list(src = "www/helsonCircular.png", width = "80%", height = "110")
  }, deleteFile = FALSE)
  
  output$membro4 = renderText(HTML(
    "
    <a href = http://lattes.cnpq.br/0092907266715994> Áydano Ribeiro Leite</a>
    <p> Doutor em Economia (UFBA) </p>
    <p> Área mãe: Teoria Econômica </p>
    "
  ))
  
  output$foto4 = renderImage({
    list(src = "www/aydanoCircular.png", width = "80%", height = "110")
  }, deleteFile = FALSE)
  
  
  
  
  
  output$rodape = renderText(HTML(
    "
    <h3 > <a href = https://maps.app.goo.gl/XKKDVxHB6SAYKSBU7>  <img src = place.png width = 30, height = 30 ></a> Localização</h3>
    <!--headin5_amrc-->
    <p> Universidade Regional do Cariri (URCA) </p>
    <p> Centro de Ciências Sociais Aplicadas </p>
    <p> Departamento de Economia </p>
    <p class=mb10> Rua Coronel Antônio Luiz, 1161, Bairro Pimenta, Crato-Ce </p>
    "
  ))
  
  output$rodape2 = renderText(HTML(
    "
    <h3 ><img src = img_icon.png width = 30, height = 30 >Contatos</h3>
    <!--headin5_amrc-->
    <p class=mb10> <img src = phone_icon1.png width = 30, height = 30 > (88) 3102-1204 </p>
    <p class=mb10> <img src = mail_icon.png width = 30, height = 30 > nipe.urca@gmail.com </p>
    "
  ))
  
  output$rodape3 = renderText(HTML(
    "
    <h3>Mídias sociais</h3>
    <!--headin5_amrc-->
    <p class=mb10> <img src = instagram_icon.png width = 30, height = 30 > <a href = https://www.instagram.com/nipe_urca/?igsh=MWFmaGticnJ3ejVnZg%3D%3D> Instagram </a></p>
    "
  ))
  
  output$titulos = renderText({
        if(input$ano_publicacao == 2024){
          if(input$tipo_publicacao == "Pré-Prints"){
            if(input$tipo_docente == "Helson Gomes"){
              HTML("
              <br></br>
                   <a href = https://rgdoi.net/10.13140/RG.2.2.16165.51687 > (i) Curvas de Laffer Setoriais Para o Brasil: Uma Abordagem Estática Usando Otimização Condicionada</a>
                   "
                   )
            }else if(input$tipo_docente %in% c("Diogo Sobreira", "Valdeir Soares", "Áydano Ribeiro")){
              HTML(
                "
                <h1> Não existem publicações para as opções selecionadas</h1>
                "
              )
            }
          }else if(input$tipo_publicacao == "Anais de encontro"){
            if(input$tipo_docente == "Helson Gomes"){
              HTML(
                "
                <br></br><br></br>
              <p><a href = https://anpec.org.br/nordeste/2024/submissao/arquivos_identificados/047-f5025d3d152b6106179721f646cdc017.pdf> (i) Mudanças na Política de Acesso ao Capital Público no Estado do Ceará: Efeitos Sobre o Crescimento Econômico e o Bem-Estar Social. </a>Em Anais do XXIX Encontro Regional de Economia.</p>
              <p><a href = https://anpec.org.br/nordeste/2024/submissao/arquivos_identificados/031-7ec509291211cee98d5634d76dde3822.pdf > (ii) Como as Mudanças nos Padrões Climáticos Incidem Sobre a Produtividade Agrícola? Uma Análise Para o Estado do Ceará.  </a> Em Anais do XXIX Encontro Regional de Economia.</p>
              <p><a href = https://www.anpec.org.br/encontro/2024/submissao/files_I/i5-87c99924bcd49b597b686727ba80c19d.pdf > (iii) Does The Education of Leaders Affect Municipal Fiscal Conditions? Evidences From Brazil.  </a> Em Anais do LII Encontro Nacional de Economia, em coautoria com Dr. Rafael Barros Barbosa (CAEN/UFC) e Dr. Ivan Cesar Ribeiro (UNIFESP).</p>
              <p><a href = https://www.anpec.org.br/encontro/2024/submissao/files_I/i10-1016a51b22a67704a00965d038d5eb4b.pdf > (iv) Measuring the Relative Cost of Staying in Brazilian Municipalities. </a> Em Anais do LII Encontro Nacional de Economia, em coautoria com <a href = http://lattes.cnpq.br/5003943888311481> Me. Cassio dos Anjos</a> (UFPB).</p>
              <p> <a href = https://www.anpec.org.br/encontro/2024/submissao/files_I/i12-357c3c82c6b5d0e369062ec4a5798996.pdf > (v) Violência e Homicídios no Campo: Uma Análise doDiferencial de Homicídios em Municípios Rurais e Urbanos no Brasil. </a> Em Anais do LII Encontro Nacional de Economia, em coautoria com Nathanael Andray Rebouças de Souza (UERN), Lauro César Bezerra Nogueira (UERN) e Fábio Lúcio Rodrigues (UERN). </p>
              "
              )
            }else if(input$tipo_docente == "Diogo Sobreira"){
              HTML(
                "
                <br></br><br></br>
              <p><a href = https://anpec.org.br/nordeste/2024/submissao/arquivos_identificados/135-07bc6c5b90274587e3cb46082a1e135c.pdf> (i) Eficiência Técnica na Produção de Lavouras Temporárias: Uma Abordagem de Metafronteira Estocástica. </a>Em Anais do XXIX Encontro Regional de Economia. Em coautoria com Francisco Ronaldo Pereira Nascimento Júnior (UFC), Edward Martins Costa (UFC) e Soraia Araujo Madeira (URCA).</p>
               <p> <a href = https://www.anpec.org.br/encontro/2024/submissao/files_I/i11-f13c823864ba1240ae9d502929a2edba.docx > (ii) GapTecnológico e Eficiência Técnica na Produção de Lavouras Temporárias no Brasil. </a> Em Anais do LII Encontro Nacional de Economia. Em coautoria com Francisco Ronaldo Pereira Nascimento Júnior (UFC), Edward Martins Costa (UFC) e Soraia Araujo Madeira (URCA). </p>
               <p> <a href = https://www.anpec.org.br/encontro/2024/submissao/files_I/i11-49da61ee8b726a3869bc226ea8754c89.docx > (iii) Rural Credit and Family Farming in the Northeast Region of Brazil. </a> Em Anais do LII Encontro Nacional de Economia. Em coautoria com Rafael de Freitas Barros (UFC), Edward Martins Costa (UFC) e Pablo Urano de Carvalho Castelar (UFC). </p>

                "
              )
            }else if(input$tipo_docente == "Valdeir Soares"){
              HTML(
                "
                <br></br><br></br>
               <p> <a href = https://www.anpec.org.br/encontro/2024/submissao/files_I/i7-1be317e2274093f6416a3008716a58b9.pdf > (i) Transmissão de Risco Entre os Mercados de Commodities: Uma Análise TVP-VAR e QVAR. </a> Em Anais do LII Encontro Nacional de Economia. Em parceria com Rodrigo Rego Medeiros (UFC), Cristiano da Silva (UFPE) e Paulo Matos (UFC). </p>
                
                "
              )
            }else if(input$tipo_docente == "Áydano Ribeiro"){
              HTML(
                "
                <br></br><br></br>
               <p> (i) Análise da Potência da Política Monetária no Brasil Pós-Pandemia da COVID-19. </a> Em Anais do IV ECONAPE. Em parceria com Eduardo Carvalho (URCA) e Anderson Oliveira (URCA). </p>
                
                "
              )
            }
          }else if (input$tipo_publicacao == "Publicação em periódico"){
            if(input$tipo_docente %in% c("Helson Gomes", "Diogo Sobreira", "Valdeir Soares", "Áydano Ribeiro")){
              HTML(
                "
                <h1> Não existem publicações para as opções selecionadas</h1>
                "
              )
            }
          }else if (input$tipo_publicacao == "Em construção"){
            if(input$tipo_docente == "Helson Gomes"){
              HTML(
                "
                <br></br><br></br>
                <p> (i) Cost-Benefit Analysis of Patient Transportation in the State of Ceará - Brazil. </p>
                <p> O objetivo do trabalho é avaliar até que ponto o custo de transportar pacientes entre os municípios do estado do Ceará vale a pena em termos financeiros. 
                O trabalho usa modelagem matemática e otimização condicionada com a calibração de parâmetros realizada com os dados do DATASUS e dos órgãos locais de Saúde
                para atingir o objetivo proposto. Espera-se que para enfermidades de baixa gravidade o benefício do transporte seja inferior às enfermidades de alta gravidade.
                "
              )
            }else if(input$tipo_docente == "Diogo Sobreira"){
              HTML(
                "
                <br></br><br></br>
                <p> (i) Efeitos distributivos da escola privada sobre o desempenho dos estudantes: evidências do Pisa para o Brasil. </p>
                <p> Em parceria com Ana Cléssia (UFC) e Jair Andrade (UFC)</p>
                <p> Em média, os estudantes de escolas privadas no Brasil desempenham melhor em exames externos quando comparado ao desempenho 
                de estudantes da rede pública de ensino. Esse gap persistente, tem motivado pesquisadores a estimarem o efeito causal da escola 
                privada sobre o desempenho em pontuações de avaliações externas. Contudo, essa não é uma tarefa relativamente simples, 
                em função do viés de seleção comumente observado em dados educacionais, dada a natureza não aleatória da atribuição dos 
                estudantes entre os dois tipos de escola. A partir de dados do PISA e utilizando diferentes abordagens de efeito tratamento 
                quantílico, condicionais e incondicionais, nós buscamos estimar efeitos da escola privada no Brasil para além da média dos dados, 
                considerando a localização da escola como variável instrumental a fim de controlar potenciais problemas de endogeneidade na 
                estimação dos efeitos causais. 
                "
              )
            }else if(input$tipo_docente == "Áydano Ribeiro"){
              HTML(
                "
                <h1> Não existem publicações para as opções selecionadas</h1>
                "
              )
            }else if(input$tipo_docente == "Valdeir Soares"){
              HTML(
                "
                <br></br><br></br>
                <p> (i) Modelando as Decisões de Localização do Trabalho: Uma Abordagem Usando Programação Linear. </p>
                <p> Em parceria com o <a href= helsongsouza.netlify.app> Prof. Dr Helson Gomes de Souza. </a> </p>
                <p> O objetivo do trabalho é  elaborar uma abordagem metodológica que possibilite medir a distância máxima
                pela qual o movimento pendular é factível considerando as restrições enfrentadas pelos trabalhadores
                durante o processo de decisão do deslocamento. O trabalho usa programação linear para modelar as restrições de
                deslocamento dos trabalhadores em uma aplicação para as regiões metropolitanas do estado de São Paulo.
                "
              )
            }
          }
        }
  })

  
  output$projetos = renderText(HTML(
    "
    <h1> Em construção </h1>
    "
  ))
  
  output$materiais = renderText(HTML(
    "
    <h1> Em construção </h1>
    "
  ))
  
  output$posts = renderText(HTML(
    "
    <h1> Temporariamente sem postagens </h1>
    "
  ))

  

  

}

# Run the application 
shinyApp(ui = ui, server = server)
