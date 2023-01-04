echo "criando as imagens.............."

docker build -t diegojaques/projeto-backend:1.0 backend/.
docker build -t diegojaques/projeto-bancodedados:1.0 database/.

echo "realizando o push das imagens"
docker push diegojaques/projeto-backend:1.0
docker push diegojaques/projeto-bancodedados:1.0


echo "criando os serviços no Cluster kubernets"

kubectl apply -f ./services.yml

echo "criando os deplyments"

kubectl apply -f ./deployments.yml


