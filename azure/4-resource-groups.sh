for i in {1..4};
do
  az group create -g group$i -l westeurope

  id=$(az ad group list --display-name  group$i --query '[].id' -o tsv)
  az role assignment create --role Contributor --assignee $id -g group$i
done