for i in {1..9};
do
    id=$(az ad user list --display-name "Student $i" --query '[].id' -o tsv)
    az ad group member add -g students --member-id $id
    az ad group member add -g group$((($i+1)/2)) --member-id $id
done