for i in {1..4};
do
  az ad group create --display-name group$i --mail-nickname group$i --force false
done

az ad group create --display-name students --mail-nickname students --force false