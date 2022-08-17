password=/dev/stin
for i in {1..9};
do
    az ad user create --display-name "Student $i)" --user-principal-name student$i@infozorghuisengelenhof.onmicrosoft.com --password $password
done


  