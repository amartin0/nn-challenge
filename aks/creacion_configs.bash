NAMESPACE=prod
SA_NAME=deployer
SECRET_NAME=deployer-token

TOKEN=$(kubectl get secret $SECRET_NAME -n $NAMESPACE -o jsonpath='{.data.token}' | base64 --decode)
CA_CERT=$(kubectl get secret $SECRET_NAME -n $NAMESPACE -o jsonpath='{.data.ca\.crt}' | base64 --decode)
CLUSTER_NAME=$(kubectl config view --minify -o jsonpath='{.clusters[0].name}')
CLUSTER_SERVER=$(kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}')

kubectl config set-cluster $CLUSTER_NAME \
  --server=$CLUSTER_SERVER \
  --certificate-authority=<(echo "$CA_CERT") \
  --embed-certs=true \
  --kubeconfig=sa.kubeconfig

kubectl config set-credentials $SA_NAME --token=$TOKEN --kubeconfig=sa.kubeconfig
kubectl config set-context $SA_NAME-context --cluster=$CLUSTER_NAME --user=$SA_NAME --namespace=$NAMESPACE --kubeconfig=sa.kubeconfig
kubectl config use-context $SA_NAME-context --kubeconfig=sa.kubeconfig
