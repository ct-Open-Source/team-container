# Install and run K3S
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--no-deploy traefik --write-kubeconfig-mode 644" sh -

# Install helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
export HELM_EXPERIMENTAL_OCI=1

echo "KUBECONFIG=/etc/rancher/k3s/k3s.yaml">>/etc/environment
echo "HELM_EXPERIMENTAL_OCI=1">>/etc/environment
echo "Kubernetes is ready for teamcloud. Please reboot your machine."