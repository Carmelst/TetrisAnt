# Utiliser Ubuntu comme image de base
FROM ubuntu:latest

# Mettre à jour les paquets et installer les dépendances nécessaires
RUN apt-get update -qq && \
    apt-get install -y -qq \
    openjdk-17-jdk \
    ant \
    curl \
    unzip

# Installer Apache Ivy (version 2.5.0 par exemple)
RUN curl -L https://dlcdn.apache.org//ant/ivy/2.5.2/apache-ivy-2.5.2-bin.zip -o ivy.zip && \
    unzip ivy.zip -d /usr/share/ant/lib && \
    rm ivy.zip

# Définir la variable d'environnement pour Java
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Vérifier les installations d'Ant et d'Ivy
RUN ant -version && \
    java -version && \
    ls /usr/share/ant/lib/ivy-2.5.0.jar

# Définir le répertoire de travail
WORKDIR /app


# Copier le code source dans l'image (ajoutez votre chemin de code ici)
COPY . .

# Commande par défaut (à ajuster selon vos besoins)
CMD ["ant"]
