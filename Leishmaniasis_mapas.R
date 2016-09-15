#Leishmaniasis Mapas 
#install.packages("devtools")
#devtools::install_github("diegovalle/mxmaps")
#devtools::install_github("sjmgarnier/viridis")

library("mxmaps")
library("viridis")
library("scales")

data("df_mxmunicipio")

data(mxstate.map, package = "mxmaps")
data(mxmunicipio.map, package = "mxmaps")


mx_municipio<-function(df_mxmunicipio,title){
	df_mxmunicipio$value[df_mxmunicipio$value==0]<-NA
user.df<-data.frame(region=df_mxmunicipio$region,
	value=df_mxmunicipio$value)

final.plot<-left_join(mxmunicipio.map,user.df,by="region")

gg<-ggplot(final.plot, aes(long, lat, group = group)) + 
        geom_polygon(aes(fill = value), color = "dark grey", 
            size = 0.1) +
        #scale_fill_viridis(na.value = "gray96")
  coord_map()+
  scale_fill_distiller(name="Casos", palette = "Spectral",na.value = "gray96" )+
  theme_nothing(legend = TRUE)+
  labs(title=title)  +
    geom_polygon(data = mxstate.map, fill = "transparent", color = "black", 
            size = 0.15)+theme_nothing(legend = TRUE)
return(gg)
}


#Leishmaniasis in Mexico, 2000

leish.2000<-read.csv("Data/LEIHSMANIASIS-2000.csv")

df_mxmunicipio$leishmaniasis2000<-0

indx.2000<-match(str_mxmunicipio(leish.2000$Num.Entidad,
	leish.2000$Num.Municipio),df_mxmunicipio$region)

df_mxmunicipio$leishmaniasis2000[indx.2000]<-leish.2000$A2000

#Leishmaniasis in Mexico, 2001

leish.2001<-read.csv("Data/LEIHSMANIASIS-2001.csv")
df_mxmunicipio$leishmaniasis2001<-0

indx.2001<-match(str_mxmunicipio(leish.2001$Num.Entidad,
	leish.2001$Num.Municipio),df_mxmunicipio$region)

df_mxmunicipio$leishmaniasis2001[indx.2001]<-leish.2001$A2001

#Leishmaniasis in Mexico, 2002

leish.2002<-read.csv("Data/LEIHSMANIASIS-2002.csv")
df_mxmunicipio$leishmaniasis2002<-0

indx.2002<-match(str_mxmunicipio(leish.2002$Num.Entidad,
	leish.2002$Num.Municipio),df_mxmunicipio$region)

df_mxmunicipio$leishmaniasis2002[indx.2002]<-leish.2002$A2002

#Leishmaniasis in Mexico, 2003-2016

leish.2003_2016<-read.csv("Data/LEIHSMANIASIS-2003-2016.csv")


df_mxmunicipio$leishmaniasis2003<-0
df_mxmunicipio$leishmaniasis2004<-0
df_mxmunicipio$leishmaniasis2005<-0
df_mxmunicipio$leishmaniasis2006<-0
df_mxmunicipio$leishmaniasis2007<-0
df_mxmunicipio$leishmaniasis2008<-0
df_mxmunicipio$leishmaniasis2009<-0
df_mxmunicipio$leishmaniasis2010<-0
df_mxmunicipio$leishmaniasis2011<-0
df_mxmunicipio$leishmaniasis2012<-0
df_mxmunicipio$leishmaniasis2013<-0
df_mxmunicipio$leishmaniasis2014<-0
df_mxmunicipio$leishmaniasis2015<-0
df_mxmunicipio$leishmaniasis2016<-0

indx.2003_2016<-match(
	str_mxmunicipio(leish.2003_2016$Num.Entidad,
		leish.2003_2016$Num.Municipio),df_mxmunicipio$region)

df_mxmunicipio[indx.2003_2016,
	paste("leishmaniasis",2003:2016,sep="")] <- leish.2003_2016[,5:18]



#Plots

pdf("Data/Leishmaniasis-V2_2000_2016.pdf")

df_mxmunicipio$value<-df_mxmunicipio$Total
mx_municipio(df_mxmunicipio,"Cutaneous Leishmaniasis in Mexico")


df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2000
mx_municipio(df_mxmunicipio, 
                       title = "Cutaneous Leishmaniasis in Mexico")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2001
mx_municipio(df_mxmunicipio, 
                       title = "Cutaneous Leishmaniasis in Mexico")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2002
mx_municipio(df_mxmunicipio, 
                       title = "Cutaneous Leishmaniasis in Mexico")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2003
mx_municipio(df_mxmunicipio, 
                       title = "Cutaneous Leishmaniasis in Mexico")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2004
mx_municipio(df_mxmunicipio, 
                       title = "Cutaneous Leishmaniasis in Mexico")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2005
mx_municipio(df_mxmunicipio, 
                       title = "Cutaneous Leishmaniasis in Mexico")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2006
mx_municipio(df_mxmunicipio, 
                       title = "Cutaneous Leishmaniasis in Mexico")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2007
mx_municipio_choropleth(df_mxmunicipio, 
                       title = "Cutaneous Leishmaniasis in Mexico")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2008
mx_municipio(df_mxmunicipio, 
                       title = "Cutaneous Leishmaniasis in Mexico")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2009
mx_municipio(df_mxmunicipio, 
                       title = "Cutaneous Leishmaniasis in Mexico")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2010
mx_municipio(df_mxmunicipio, 
                       title = "Cutaneous Leishmaniasis in Mexico")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2011
mx_municipio(df_mxmunicipio, 
                       title = "Cutaneous Leishmaniasis in Mexico")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2012
mx_municipio(df_mxmunicipio, 
                       title = "Cutaneous Leishmaniasis in Mexico")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2013
mx_municipio(df_mxmunicipio, 
                       title = "Cutaneous Leishmaniasis in Mexico")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2014
mx_municipio(df_mxmunicipio,  
                       title = "Cutaneous Leishmaniasis in Mexico")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2015
mx_municipio(df_mxmunicipio, 
                       title = "Cutaneous Leishmaniasis in Mexico")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2016
mx_municipio(df_mxmunicipio, 
                       title = "Cutaneous Leishmaniasis in Mexico")


dev.off()



#FUENTE : SUIVE/DGE/Secretaría de Salud/Estados Unidos Mexicanos, 2016.
#Nota: esta información proviene de la notificación convencional, la cuál es el diagnóstico clínico del médico.
#información preliminar al corte de la semana epidenmiológica núm. 29 de 2016.