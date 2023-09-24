#ESAME DATASCIENCE FORMULA UNO

library(ggplot2)
library(dplyr)
library(tidyr)

#Creazione database
#------------------------------------------------------------------------------------------------------------------------------------------
anno  = c(1950:2023)
vincitore_campionato = c("Nino Farina","Juan Manuel Fangio"," Alberto Ascari","Alberto Ascari","Juan Manuel Fangio","Juan Manuel Fangio","Juan Manuel Fangio","Juan Manuel Fangio"," Mike Hawthorn"," Jack Brabham"," Jack Brabham"," Phil Hill"," Graham Hill","Jim Clark","John Surtees"," Jim Clark","Jack Brabham","Denny Hulme","Graham Hill","Jackie Stewart","Jochen Rindt","Jackie Stewart","Emerson Fittipaldi","Jackie Stewart","Emerson Fittipaldi","Niki Lauda","James Hunt","Niki Lauda","Mario Andretti","Jody Scheckter","Alan Jones"," Nelson Piquet","Keke Rosberg","Nelson Piquet","Niki Lauda","Alain Prost","Alain Prost","Nelson Piquet","Ayrton Senna","Alain Prost","Ayrton Senna","Ayrton Senna","Nigel Mansell","Alain Prost","Michael Schumacher","Michael Schumacher","Damon Hill","Jacques Villeneuve","Mika Häkkinen","Mika Häkkinen","Michael Schumacher","Michael Schumacher","Michael Schumacher","Michael Schumacher","Michael Schumacher","Fernando Alonso","Fernando Alonso","Kimi Raikkonen","Lewis Hamilton","Jenson Button","Sebastian Vettel","Sebastian Vettel","Sebastian Vettel","Sebastian Vettel","Lewis Hamilton","Lewis Hamilton","Nico Rosberg"," Lewis Hamilton"," Lewis Hamilton"," Lewis Hamilton"," Lewis Hamilton","Max Verstappen","Max Verstappen","Max Verstappen")
vincitore_gara_Monza = c("Nino Farina","Alberto Ascari","Alberto Ascari","Juan Manuel Fangio","Juan Manuel Fangio","Juan Manuel Fangio","Stirling Moss","Stirling Moss","Tony Brooks","Stirling Moss","Phil Hill","Phil Hill"," Graham Hill","Jim Clark ","John Surtees","Jackie Stewart","Ludovico Scarfiotti","John Surtees","Denny Hulme","Jackie Stewart","Clay Regazzoni","Peter Gethin","Emerson Fittipaldi","Ronnie Peterson","Ronnie Peterson","Clay Regazzoni","Ronnie Peterson","Mario Andretti","Niki Lauda","Jody Scheckter","Ren? Arn","Alain Prost","Ren? Arnoux","Nelson Piquet","Niki Lauda","Alain Prost","Nelson Piquet","Nelson Piquet","Gerhard Berger","Alain Prost","Ayrton Senna","Nigel Mansell","Ayrton Senna","Damon Hill","Damon Hill","Johnn Herbert","Michael Schumacher","David Coulthard","Michael Schumacher","Heinz-Harald Frentzen","Michael Schumacher","Juan Pablo Montoya","Rubens Barrichello","Michael Schumacher","Rubens Barrichello","Juan Pablo Montoya","Michael Schumacher"," Fernando Alonso","Sebastian Vettel","Rubens Barrichello","Fernando Alonso","Sebastian Vettel","Lewis Hamilton"," Sebastian Vettel","Lewis Hamilton","Lewis Hamilton","Nico Rosberg","Lewis Hamilton","Lewis Hamilton","Charles Leclerc","Pierre Gasly","Daniel Ricciardo", "Max Verstappen", "Max Verstappen")
eta = c(44,33,34,42,43,44,27,28,26,30,33,34,33,27,30,26,33,33,32,30,31,31,26,29,30,36,37,32,29,39,32,26,34,31,35,30,34,35,29,34,30,38,32,33,34,29,27,26,29,32,31,27,30,34,32,30,37,26,21,37,29,24,27,26,28,29,31,31,32,22,24,32,24,25)
scuderia = c("Alfa Romeo","Ferrari","Ferrari","Maserati","Mercedes","Mercedes","Maserati","Vanwall","Vanwall","Cooper Climax","Ferrari","Ferrari","B R M","Lotus","Ferrari","B R M","Ferrari","Honda","McLaren","Matra Ford","Ferrari","B R M","Lotus","Lotus","Lotus","Ferrari","March","Lotus","Brabham","Ferrari","Renault","Renault","Renault","Brabham","McLaren","McLaren","Williams","Williams","Ferrari","McLaren","McLaren","Williams","McLaren","Williams","Williams","Benetton","Ferrari","McLaren","Ferrari","Jordan","Ferrari","Williams","Ferrari","Ferrari","Ferrari","McLaren","Ferrari","McLaren","Toro Rosso","Brawn","Ferrari","Red Bull Racing","McLaren","Red Bull Racing","Mercedes","Mercedes","Mercedes","Mercedes","Mercedes","Ferrari","AlphaTauri","McLaren","Red Bull", "Red Bull")
tempo_piu_veloce_gara = c(1.59,1.54,2.06,2.03,1.59,2.46,2.44,1.43,1.41,1.40,2.42,2.48,1.42,1.38,1.38,1.36,1.32,1.28,1.26,1.25,1.25,1.23,1.36,1.35,1.34,1.33,1.41,1.39,1.38,1.35,1.36,1.37,1.33,1.34,1.31,1.28,1.28,1.26,1.29,1.28,1.26,1.26,1.26,1.23,1.25,1.26,1.26,1.24,1.25,1.25,1.25,1.25,1.23,1.22,1.20,1.21,1.22,1.23,1.29,1.24,1.25,1.26,1.27,1.25,1.28,1.26,1.25,1.23,1.22,1.21,1.22,1.24,1.24,1.25)
pilota_piu_veloce_gara = c("Juan Manuel Fangio","Nino Farina","Alberto Ascari","Juan Manuel Fangio","Jose Froilan Gonzalez","Stirling Moss","Stirling Moss","Tony Brooks","Phil Hill","	Phil Hill","Phil Hill","Giancarlo Baghetti","	Graham Hill","	Jim Clark","John Surtees","	Jim Clark","	Ludovico Scarfiotti","Jim Clark","Jackie Oliver","Jean-Pierre Beltoise","Clay Regazzoni","Henri Pescarolo","Jacky Ickx","Jackie Stewart","	Carlos Pace","Clay Regazzoni","	Ronnie Peterson","	Mario Andretti","	Mario Andretti","Clay Regazzoni","	Alan Jones","Carlos Reutemann","Rene Arnoux","Nelson Piquet","Niki Lauda","	Nigel Mansell","Teo Fabi","Ayrton Senna","Michele Alboreto","Alain Prost","Ayrton Senna","Ayrton Senna","Nigel Mansell","Damon Hill","Damon Hill","Gerhard Berger","Michael Schumacher","Mika Hakkinen","Mika Hakkinen","Ralf Schumacher","Mika Hakkinen","Ralf Schumacher","Rubens Barrichello","Michael Schumacher","Rubens Barrichello","Kimi Räikkönen","Kimi Räikkönen","Fernando Alonso","Kimi Räikkönen","Adrian Sutil","Fernando Alonso","Lewis Hamilton","Nico Rosberg","Lewis Hamilton","Lewis Hamilton","Lewis Hamilton","Fernando Alonso","Daniel Ricciardo","Lewis Hamilton","Lewis Hamilton","Lewis Hamilton","Daniel Ricciardo","Sergio Perez","Oscar Piastri")
velocita_media_NA = c()
for (x in 1:48) {
  velocita_media_NA[x] <- NA
}
velocita_media_VAL = c(243.977,242.723,243.645,245.140,249.289,254.848,258.320,255.874,252.604,251.653,236.859,246.106,247.861,241.971,239.053,242.924,236.975,240.617,244.373,250.174,252.794,255.014,252.033,245.894,248.182,245.142)
velocita_media_FL = c(velocita_media_NA,velocita_media_VAL)
tempo_piu_veloce_qualifica = c(1.58,1.53,2.05,2.02,1.59,2.46,2.42,1.42,1.40,1.39,2.41,2.46,1.40,1.37,1.37,1.36,1.31,1.28,1.26,1.25,1.24,1.22,1.35,1.35,1.33,1.32,1.41,1.38,1.40,1.34,1.34,1.33,1.28,1.29,1.26,1.25,1.24,1.23,1.25,1.23,1.22,1.24,1.22,1.21,1.24,1.24,1.24,1.24,1.25,1.22,1.23,1.22,1.20,1.21,1.20,1.21,1.21,1.21,1.35,1.23,1.22,1.22,1.24,1.23,1.24,1.23,1.21,1.34,1.19,1.19,1.18,1.19,1.20,1.20)
pilota_piu_veloce_qualifica = c("Juan Manuel Fangio","Juan Manuel Fangio","Alberto Ascari","Alberto Ascari","Juan Manuel Fangio","Juan Manuel Fangio","Juan Manuel Fangio","Stuart Lewis-Evans","Stirling Moss","Stirling Moss","Phil Hill","Wolfgang von Trips","Jim Clark","John Surtees","	John Surtees","Jim Clark","Mike Parkes","Jim Clark","	John Surtees","	Jochen Rindt","Jacky Ickx","	Chris Amon","	Jacky Ickx","Ronnie Peterson","	Niki Lauda","Niki Lauda","Jacques Laffite","James Hunt","Mario Andretti","	Jean-Pierre Jabouille","	Rene Arnoux","	Rene Arnoux","Mario Andretti","Riccardo Patrese","Nelson Piquet","Ayrton Senna","Teo Fabi","Nelson Piquet","Ayrton Senna","Ayrton Senna","Ayrton Senna","Ayrton Senna","Nigel Mansell","Alain Prost","Jean Alesi","David Coulthard","Damon Hill","Jean Alesi","Michael Schumacher","Mika Hakkinen","Michael Schumacher","	Juan Pablo Montoya","Juan Pablo Montoya","Michael Schumacher","Rubens Barrichello","Kimi Räikkönen","Kimi Räikkönen","Fernando Alonso","Sebastian Vettel","Lewis Hamilton","Fernando Alonso","Sebastian Vettel","Lewis Hamilton","Sebastian Vettel","Lewis Hamilton","Lewis Hamilton","Lewis Hamilton","	Lewis Hamilton","Kimi Räikkönen","Charles Leclerc","Lewis Hamilton","Valtteri Bottas","Charles Leclerc","Carlos Sainz")
peso_vettura = c(710,850,560,590,600,590,610,560,560,560,500,470,450,460,468,450,500,500,523,523,530,534,550,575,575,575,575,557,542,590,575,585,585,540,540,540,540,540,540,505,500,505,505,500,520,595,595,530,550,600,600,600,500,600,600,605,600,600,605,605,620,640,640,642,691,798,728,728,733,798,748,752,798,798)
cavalli_vettura =  c(350,450,250,250,250,280,260,290,295,295,190,190,300,230,250,250,360,390,415,440,430,430,450,480,495,495,495,580,580,580,580,580,580,750,800,800,800,850,880,610,620,680,700,745,750,800,750,750,750,780,750,810,840,880,845,915,720,800,820,820,745,740,750,750,745,960,960,1000,1000,1000,1010,970,1040,1050)

#inserimento dati all'interno di un database
formula_frames <- data.frame( anno, vincitore_campionato, vincitore_gara_Monza, scuderia, eta, tempo_piu_veloce_gara, pilota_piu_veloce_gara, tempo_piu_veloce_qualifica, pilota_piu_veloce_qualifica, velocita_media_FL, peso_vettura, cavalli_vettura)
formula_frames
#------------------------------------------------------------------------------------------------------------------------------------------
#grafico eta ed evoluzione nel corso degli anni
#------------------------------------------------------------------------------------------------------------------------------------------
#grafico che mostra l'evoluzione dell'eta con gli anni (PLOT)
par(mar=rep(2,4))
plot (anno,eta, xlab = "anni", ylab = "eta", pch = 19, cex = 1)
lines(lowess(anno,eta,f=1/5),lwd = 5, col = "red", type = "l")

#grafico a torta eta che mi mostra l'eta dei vincitori del gran premio di monza
valoriG <- c(1,1,2,7,5,2,7,8,6,8,6,7,2,1,3,1,1,1,1,2)
labelG <- c(21,22,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,42,43,44)
perc<- round(valoriG/sum(valoriG)*100)
labelG <- paste(labelG, perc)
labelG <- paste(labelG,"%",sep="")
pie(valoriG, labels = labelG,col=rainbow(length(labelG)), main="Grafico a torta dell'eta")

#boxplot per l'età dei vincitori nel gran premio per identificare mediana e valori outlier
median_value <- median(formula_frames$eta)

ggplot(formula_frames, aes(x = "", y = eta)) +
  geom_boxplot(outlier.color = "red", fill = "grey") +
  labs(title = "boxplot dell'eta per rappresentare i valori di outlier", y = "eta")+
  theme(panel.grid.major = element_line(colour = "gray", linetype = "dashed"))+
  geom_text(aes(label = paste("Mediana =", median_value)),x = 1, y = median_value, vjust = -0.5, hjust = 0.5, color = "red", size = 4)+
  theme_bw()
#------------------------------------------------------------------------------------------------------------------------------------------
#grafici lineari e con conseguente boxplot per rappresentare nel corso degli anni l'evoluzione dei tempi in qualifica sul circuito
#------------------------------------------------------------------------------------------------------------------------------------------

#grafico che mi fa vedere i tempi in base agli anni e la loro seguente evoluzione(GGPLOT)
ggplot(formula_frames, aes(x = anno, y = tempo_piu_veloce_qualifica)) +
  geom_point(col = "blue", size = 2.2) +
  geom_line(col = "black", size = 0.63) +
  labs(title = "andamento dei tempi nel corso degli anni", x = "Anni", y = "Tempo piu veloce in qualifica" ) +
  theme_bw()

#boxplot per identificare i valori outlier dei tempi veloci in qualifica
median_value <- median(formula_frames$tempo_piu_veloce_qualifica)

ggplot(formula_frames, aes(x = "", y = tempo_piu_veloce_qualifica)) +
  geom_boxplot(outlier.color = "red", fill = "grey") +
  labs(title = "boxplot dei tempi veloci in qualifica per rappresentare i valori di outlier", y = "tempi veloci in qualifica")+
  theme(panel.grid.major = element_line(colour = "gray", linetype = "dashed"))+
  geom_text(aes(label = paste("Mediana =", median_value)),x = 1, y = median_value, vjust = -0.5, hjust = 0.5, color = "red", size = 4)+
  theme_bw()
#------------------------------------------------------------------------------------------------------------------------------------------
#grafici lineari e con conseguente boxplot per rappresentare nel corso degli anni l'evoluzione dei tempi in gara sul circuito
#------------------------------------------------------------------------------------------------------------------------------------------
#grafico che mi fa vedere i tempi in base agli anni e la loro seguente evoluzione(GGPLOT)
ggplot(formula_frames, aes(x = anno, y = tempo_piu_veloce_gara)) +
  geom_point(col = "blue", size = 2.2) +
  geom_line(col = "black", size = 0.63) +
  labs(title = "andamento dei tempi nel corso degli anni", x = "Anni", y = "Tempo piu veloce in gara" ) +
  theme_bw()

#boxplot per identificare i valori outlier dei tempi veloci in gara
median_value <- median(formula_frames$tempo_piu_veloce_gara)

ggplot(formula_frames, aes(x = "", y = tempo_piu_veloce_gara)) +
  geom_boxplot(outlier.color = "red", fill = "grey") +
  labs(title = "boxplot dei tempi veloci in gara per rappresentare i valori di outlier", y = "tempi veloci in qualifica")+
  theme(panel.grid.major = element_line(colour = "gray", linetype = "dashed"))+
  geom_text(aes(label = paste("Mediana =", median_value)),x = 1, y = median_value, vjust = -0.5, hjust = 0.5, color = "red", size = 4)+
  theme_bw()
#------------------------------------------------------------------------------------------------------------------------------------------
#Differenza tra tempo in qualifica e tempo in gara
#------------------------------------------------------------------------------------------------------------------------------------------
#tempo qualifica gara messi a confronto sullo stesso grafico

ggplot(formula_frames)+
  geom_line(aes(x = anno, y = tempo_piu_veloce_gara, color = "tempo veloce in gara"), size = 0.8) +
  geom_line(aes(x = anno, y = tempo_piu_veloce_qualifica, color = "tempo veloce in qualifica"), size = 0.8) +
  labs(title = "Confronto tra tempo veloce in gara e in qualifica",
       x = "Anni",
       y = "tempo") +
  scale_color_manual(values = c("tempo veloce in gara" = "blue", "tempo veloce in qualifica" = "red")) +
  theme_bw()

#differenza del tempo nel corso degli anni
differenza <- formula_frames$tempo_piu_veloce_gara - formula_frames$tempo_piu_veloce_qualifica
data_diff <- data.frame(anni = 1950:2023, Differenza =  differenza)

ggplot(data_diff, aes(x = anni, y = Differenza)) +
  geom_bar(stat = "identity", fill = "black", width = 0.5) +
  labs(title = "Differenza tra tempo in qualifica e in gara",
       x = "Anni",
       y = "Differenza") +
  geom_smooth(method = lm, se = FALSE)+
  theme_bw()
#------------------------------------------------------------------------------------------------------------------------------------------
#grafico velocità in confronto ai tempi 
#------------------------------------------------------------------------------------------------------------------------------------------
subset_velocita<- formula_frames[49:nrow(formula_frames), ]
ggplot(formula_frames, aes(x = velocita_media_FL, tempo_piu_veloce_gara))+
  geom_point()+
  labs(x = "Velocità", y = "Tempi") +  
  ggtitle("Grafico Velocità vs. Tempi") + 
  geom_smooth(method = "lm", se = FALSE)+
  coord_cartesian(ylim = c(1.15, 1.35))+
  theme_bw() 
#------------------------------------------------------------------------------------------------------------------------------------------
#piloti che hanno vinto monza e che poi hanno vinto il campionato+piloti che hanno fatto il grand chalem+piloti che partivano in pole e non hanno vinto
#------------------------------------------------------------------------------------------------------------------------------------------
monza_campionato <- formula_frames %>%
  filter(vincitore_campionato == vincitore_gara_Monza) %>% #conto quante volte il pilota che ha vinto monza poi ha vinto il campionato
  summarise(conteggio = n())

grand_chalem <- formula_frames  %>%
  filter(pilota_piu_veloce_gara == vincitore_gara_Monza & vincitore_gara_Monza == pilota_piu_veloce_qualifica) %>% #conto quante volte il pilota che ha vinto monza ha fatto pole e giro veloce


polePosition_vittoria <-formula_frames %>%
  filter(vincitore_gara_Monza == pilota_piu_veloce_qualifica) %>% #conto quante volte il pilota che ha fatto la pole poi ha vinto la gara
  summarise(conteggio = n())

#creazione database per le frequenze
formula_conteggio_frequenze <-data.frame(monza_campionato, grand_chalem, polePosition_vittoria)
formula_conteggio_frequenze
colnames(formula_conteggio_frequenze) <- c("monza e campionato", "Gran Chalem", "Pole Position e vittoria")
rownames(formula_conteggio_frequenze) <- c("frequenza")

formula_conteggio_lungo <- gather(formula_conteggio_frequenze, "Tipologia", "Valore")

#grafico a frequenze
ggplot(formula_conteggio_lungo, aes(x = Tipologia, y = Valore, fill = Tipologia)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = Valore), vjust = -0.5, size = 4)+
  labs(title = "Grafico a Barre per statistiche individuali", x = "Tipologia ", y = "Valore") +
  theme_bw()  # Scegli un tema del grafico

#grafico con le percentuali
percentuali <- (formula_conteggio_frequenze / 74) * 100
percentuali_lunghe <- gather(percentuali, "Tipologia", "Percentuale")
percentuali_lunghe$Percentuale <- round(percentuali_lunghe$Percentuale, 2)

ggplot(percentuali_lunghe, aes(x = Tipologia, y = Percentuale, fill = Tipologia)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = Percentuale), vjust = -0.5, size = 4)+
  labs(title = "Grafico a Barre con Percentuali su statistiche individuali", x = "Tipologia", y = "Percentuale") +
  theme_bw()
  

#------------------------------------------------------------------------------------------------------------------------------------------
#Grafici cavalli,peso e rapport peso/potenza con la velocita
#------------------------------------------------------------------------------------------------------------------------------------------  
  
#grafico andamento del peso delle vetture nel tempo
ggplot(formula_frames, aes(x=anno, y=peso_vettura)) +
  labs(title = "Andamento del Peso nel Tempo",
       x="anno", 
       y="peso [kg]")+
  geom_jitter() +
  geom_smooth(method = loess)+
  theme_bw()

#grafico andamento dei cavalli delle vetture nel tempo
ggplot(formula_frames, aes(x=anno,y=cavalli_vettura)) +
  labs(title = "Andamento dei cavalli nel Tempo",
    x="anno", 
       y="cavalli [CV]")+
  geom_jitter() +
  geom_smooth(method = loess)+
  theme_bw()

#grafico che mi mostra che con l'aumentare del peso aumentano anche i cavalli
ggplot(formula_frames, aes(x=cavalli_vettura,y=peso_vettura)) +
  labs(title = "Andamento dei cavalli rispetto il peso",
    x="cavalli [CV]", 
       y="peso [kg]")+
  geom_jitter() +
  geom_smooth(method = loess)+
  theme_bw()

#grafico peso potenza nel corso degli anni
rapporto_peso_potenze <-formula_frames$peso_vettura / formula_frames$cavalli_vettura
ggplot(formula_frames, aes(x = anno, y = rapporto_peso_potenze))+
  geom_point() +
  labs(title = "Andamento del Rapporto Peso-Potenza nel Tempo", x = "Anno", y = "Rapporto Peso-Potenza") +
  geom_smooth(method = loess)+
  theme_bw()
#------------------------------------------------------------------------------------------------------------------------------------------  
#GRAFICO IN PIU
#grafico rapporto peso potenza con la velocita
rapporto_peso_potenze_2 <- subset_velocita$peso_vettura / subset_velocita$cavalli_vettura
ggplot(subset_velocita, aes(x = rapporto_peso_potenze_2, y = velocita_media_FL))+
  geom_point() +
  labs(title = "Andamento del Rapporto Peso-Potenza nel Tempo", x = "velocita", y = "Rapporto Peso-Potenza") +
  geom_smooth(method = loess)+
  theme_bw()
