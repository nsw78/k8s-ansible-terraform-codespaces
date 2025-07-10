
---

# 🌍 k8s-terraform-ansible-gke

Projeto para criar e controlar um cluster Kubernetes no Google Kubernetes Engine (GKE), usando Terraform e Ansible.
(Agora com 100% menos apocalipse! 🔥💥)

---

## 🗂️ Estrutura do projeto

```
k8s-terraform-ansible-gke/
├── .devcontainer/           # Configuração do Codespaces (tipo a cabine da nave)
│   ├── devcontainer.json
│   └── Dockerfile
├── terraform/               # Código Terraform para criar o cluster (a mágica)
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform-gke.json   # Chave secreta (não manda pro Git, ok? 🚫)
├── ansible/                 # Playbook Ansible pra mandar deploy no cluster
│   ├── inventory
│   └── deploy.yml
├── k8s/                     # Manifestos K8s (Deploy + Serviço)
│   └── app.yaml
├── README.md                # O que você tá lendo agora 📖
└── .gitignore               # Coisas que o Git não quer saber 🙈
```

---

## ⚙️ O que você vai precisar

* Conta Google Cloud com projeto criado (sem bomba relógio 💣)
* Service Account com permissão de administrador no GKE e pra usar service accounts
* JSON da chave da service account (guarde como ouro 🏆)
* Ambiente com Terraform, Ansible, kubectl e gcloud (seja local ou Codespaces)
* Paciência pra não surtar no processo 😅

---

## 🚀 Bora rodar?

### 1. Configura as credenciais

* Coloque o JSON dentro da pasta `terraform/`
* Configura essa variável ambiente aqui:

```bash
export GOOGLE_APPLICATION_CREDENTIALS=$(pwd)/terraform/terraform-gke.json
```

* Ativa a conta:

```bash
gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS
```

* Ajusta o projeto:

```bash
gcloud config set project <SEU_PROJECT_ID>
```

---

### 2. Terraform na veia

```bash
cd terraform/
terraform init
terraform apply
```

Quando pedir o `project_id`, manda o nome do seu projeto e dá um `yes` pra confirmar.

---

### 3. Configura o kubectl pra falar com seu cluster

```bash
gcloud container clusters get-credentials microkube-demo-cluster --zone us-central1-a --project <SEU_PROJECT_ID>
kubectl get nodes
```

Se aparecer nó(s), tá na boa!

---

### 4. Deploy com Ansible (a cereja do bolo 🍒)

```bash
cd ..
ansible-playbook ansible/deploy.yml
kubectl get deployments
kubectl get services
```

---

### 5. Apaga o cluster quando não precisar (pra não pagar boleto 😱)

```bash
gcloud container clusters delete microkube-demo-cluster --zone us-central1-a --quiet
```

---

## ⚠️ Dicas do mestre Jedi

* JSON da service account é sagrado, não manda pro GitHub!
* Use VMs pequenas pra não detonar seu cartão de crédito 💳
* Configure alertas de orçamento no Console Google Cloud (pra não passar perrengue)

---

## 📫 Fala comigo!

Nelson Walcow — aquele cara que já quase pirou com Kubernetes, mas conseguiu sair vivo 😎


