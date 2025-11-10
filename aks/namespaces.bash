#!/bin/bash
set -e

# Namespace names
NAMESPACES=("dev" "staging" "prod")
SA_NAME="deployer"

for ns in "${NAMESPACES[@]}"; do
  echo "Creando namespace: $ns"
  kubectl create namespace "$ns" --dry-run=client -o yaml | kubectl apply -f -

  echo "Creating ServiceAccount '$SA_NAME' in namespace $ns"
  kubectl create serviceaccount "$SA_NAME" -n "$ns" --dry-run=client -o yaml | kubectl apply -f -

  echo "Creating Role and RoleBinding to deploy Deployments and Services..."
  cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: ${SA_NAME}-role
  namespace: $ns
rules:
  - apiGroups: ["", "apps"]
    resources: ["pods", "services", "deployments", "replicasets","secrets"]
    verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
EOF

  cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: ${SA_NAME}-binding
  namespace: $ns
subjects:
  - kind: ServiceAccount
    name: $SA_NAME
    namespace: $ns
roleRef:
  kind: Role
  name: ${SA_NAME}-role
  apiGroup: rbac.authorization.k8s.io
EOF

  echo "Namespace $ns ready with ServiceAccount and permissions."
done

echo "All namespaces, service accounts, and roles created successfully."

