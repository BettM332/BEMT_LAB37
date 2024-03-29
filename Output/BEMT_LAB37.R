#CARACTERISTICAS DE LOS AUTOS 

?mtcars

mtcars

class(mtcars)

mtcars_matrix <- data.matrix(mtcars)
class(mtcars_matrix)

heatmap(mtcars_matrix)

#¿Se parece a lo que esperabas?
# Mire la página de ayuda de la función y lea la descripción del scale argumento en particular

?heatmap


#La escala es importante: los valores deben centrarse y escalarse en filas o columnas. 
#En nuestro caso, queremos visualizar altibajos en cada variable, que están en columnas.

heatmap(mtcars_matrix, scale = "colum")


# hAcer nuestra propia paleta de colores
colores_blue <- colorRampPalette(c("lightblue", "cornflowerblue", "navyblue" ))(256)


# con AMBOS denogramas por default, se ordenan las variables por cluster de pertenencia
heatmap(mtcars_matrix,
        scale = "colum",
        col = colores_blue)


#Eliminar dendrogramas
#El dendrograma de columna realmente no tiene sentido para este conjunto de datos. Rowv
#y Colvse puede configurar para NAeliminar dendrogramas, lo que también significa que los datos 
#no se reorganizarán de acuerdo con el método de agrupación.

# se respeta el orden de las columnas, porque se borró el dendrograma de las columnas, ya no se ordena por cluster
# no se respeta el orden de los renglones, porque estos si tienen clusteo

heatmap(mtcars_matrix,
        scale = "colum",
        col = colores_blue, 
        Colv = NA,
        margins = c(5,10),
        xlab = "especificación de caracteristicas", 
        ylab = "modelos de autos", 
        main = "mapa de calor")


colnames(mtcars_matrix)

#install.package("viridis") 

#paletas por defecto
# rainbow, heat.colors, terrain.colors, topo.colors, cm.colors

library(viridis)
viridis_pal()
#col = viridis_pal(option = "viridis") (6))
# viridis, magma, plasma, cividis, inferno

heatmap(mtcars_matrix,
        scale = "colum",
        col = viridis_pal(option = "viridis")(6), 
        Colv = NA,
        margins = c(5,10),
        xlab = "especificación de caracteristicas", 
        ylab = "modelos de autos", 
        main = "mapa de calor")

heatmap(mtcars_matrix,
        scale = "colum",
        col = viridis_pal(option = "magma")(6), 
        Colv = NA,
        margins = c(5,10),
        xlab = "especificación de caracteristicas", 
        ylab = "modelos de autos", 
        main = "mapa de calor")

heatmap(mtcars_matrix,
        scale = "colum",
        col = rainbow (6), 
        Colv = NA,
        margins = c(5,10),
        xlab = "especificación de caracteristicas", 
        ylab = "modelos de autos", 
        main = "mapa de calor")

# correr comando para saber valores altos

image(1:6,1,as.matrix(1:6), col = rainbow (6), xlab="Leyenda", ylab="", xaxt="n", yaxt="n", bty="n")

##################################################################################################

datos <- mtcars

# Para que las variables sean comparables bajo un mismo esquema de colores se
# estandarizan.
datos <- scale(datos)

heatmap(x = datos, scale = "none",
        distfun = function(x){dist(x, method = "euclidean")},
        hclustfun = function(x){hclust(x, method = "average")},
        cexRow = 0.7)

colores1 <- colorRampPalette(c("red", "white", "blue"))(256)

heatmap(x = datos, scale = "none", col = colores_blue, cexRow = 0.7)

colores_blue <- colorRampPalette(c("lightblue", "cornflowerblue", "navyblue"))(256)



# Paleta de color viridis
library(viridis)
colores2 <- viridis(256)
heatmap(x = datos, scale = "none", col = colores2,
        distfun = function(x){dist(x, method = "euclidean")},
        hclustfun = function(x){hclust(x, method = "average")},
        cexRow = 0.7)

#Es posible añadir información adicional (annotate) en las filas o columnas con los argumentos RowSideColors y ColSideColors. Por ejemplo, supóngase que los primeros 16 coches proceden de China y los 16 últimos de América.
# Se codifica con color naranja a los coches procedentes de China y con morado a
# los de América
colores2 <- viridis(256)
heatmap(x = datos, scale = "none", col = colores2,
        distfun = function(x){dist(x, method = "euclidean")},
        hclustfun = function(x){hclust(x, method = "average")},
        RowSideColors = rep(c("orange", "purple"), each = 16))
