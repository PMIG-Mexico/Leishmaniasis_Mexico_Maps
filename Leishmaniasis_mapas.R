#Leishmaniasis Mapas 
#install.packages("devtools")
#devtools::install_github("diegovalle/mxmaps")

library("mxmaps")

data("df_mxmunicipio")

#Leishmaniasis in Mexico, 2000

leish.2000<-read.csv("LEIHSMANIASIS-2000.csv")

df_mxmunicipio$leishmaniasis2000<-0

indx.2000<-match(str_mxmunicipio(leish.2000$Num.Entidad,
	leish.2000$Num.Municipio),df_mxmunicipio$region)

df_mxmunicipio$leishmaniasis2000[indx.2000]<-leish.2000$A2000

#Leishmaniasis in Mexico, 2001

leish.2001<-read.csv("LEIHSMANIASIS-2001.csv")
df_mxmunicipio$leishmaniasis2001<-0

indx.2001<-match(str_mxmunicipio(leish.2001$Num.Entidad,
	leish.2001$Num.Municipio),df_mxmunicipio$region)

df_mxmunicipio$leishmaniasis2001[indx.2001]<-leish.2001$A2001

#Leishmaniasis in Mexico, 2002

leish.2002<-read.csv("LEIHSMANIASIS-2002.csv")
df_mxmunicipio$leishmaniasis2002<-0

indx.2002<-match(str_mxmunicipio(leish.2002$Num.Entidad,
	leish.2002$Num.Municipio),df_mxmunicipio$region)

df_mxmunicipio$leishmaniasis2002[indx.2002]<-leish.2002$A2002

#Leishmaniasis in Mexico, 2003-2016

leish.2003_2016<-read.csv("LEIHSMANIASIS-2003-2016.csv")


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

pdf("Leishmaniasis_2000_2016.pdf")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2000
mxmunicipio_choropleth(df_mxmunicipio, 
                       num_colors = 2,
                       title = "Leishmaniasis in Mexico, 2000")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2001
mxmunicipio_choropleth(df_mxmunicipio, 
                       num_colors = 2,
                       title = "Leishmaniasis in Mexico, 2001")


df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2002
mxmunicipio_choropleth(df_mxmunicipio, 
                       num_colors = 2,
                       title = "Leishmaniasis in Mexico, 2002")



df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2003
mxmunicipio_choropleth(df_mxmunicipio, 
                       num_colors = 2,
                       title = "Leishmaniasis in Mexico, 2003")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2004
mxmunicipio_choropleth(df_mxmunicipio, 
                       num_colors = 2,
                       title = "Leishmaniasis in Mexico, 2004")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2005
mxmunicipio_choropleth(df_mxmunicipio, 
                       num_colors = 2,
                       title = "Leishmaniasis in Mexico, 2005")


df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2006
mxmunicipio_choropleth(df_mxmunicipio, 
                       num_colors = 2,
                       title = "Leishmaniasis in Mexico, 2006")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2007
mxmunicipio_choropleth(df_mxmunicipio, 
                       num_colors = 2,
                       title = "Leishmaniasis in Mexico, 2007")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2008
mxmunicipio_choropleth(df_mxmunicipio, 
                       num_colors = 2,
                       title = "Leishmaniasis in Mexico, 2008")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2009
mxmunicipio_choropleth(df_mxmunicipio, 
                       num_colors = 2,
                       title = "Leishmaniasis in Mexico, 2009")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2010
mxmunicipio_choropleth(df_mxmunicipio, 
                       num_colors = 2,
                       title = "Leishmaniasis in Mexico, 2010")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2011
mxmunicipio_choropleth(df_mxmunicipio, 
                       num_colors = 2,
                       title = "Leishmaniasis in Mexico, 2011")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2012
mxmunicipio_choropleth(df_mxmunicipio, 
                       num_colors = 2,
                       title = "Leishmaniasis in Mexico, 2012")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2013
mxmunicipio_choropleth(df_mxmunicipio, 
                       num_colors = 2,
                       title = "Leishmaniasis in Mexico, 2013")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2014
mxmunicipio_choropleth(df_mxmunicipio, 
                       num_colors = 2,
                       title = "Leishmaniasis in Mexico, 2014")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2015
mxmunicipio_choropleth(df_mxmunicipio, 
                       num_colors = 2,
                       title = "Leishmaniasis in Mexico, 2015")

df_mxmunicipio$value <-  df_mxmunicipio$leishmaniasis2016
mxmunicipio_choropleth(df_mxmunicipio, 
                       num_colors = 2,
                       title = "Leishmaniasis in Mexico, 2016")


dev.off()

#FUENTE : SUIVE/DGE/Secretaría de Salud/Estados Unidos Mexicanos, 2016.
#Nota: esta información proviene de la notificación convencional, la cuál es el diagnóstico clínico del médico.
#información preliminar al corte de la semana epidenmiológica núm. 29 de 2016.


