
git clone git@github.com:mkeresty/ud-cloud-devops-p2.git
cd ud-cloud-devops-p2
python3 -m venv ~/.myvenv
source ~/.myvenv/bin/activate
make install
az webapp up --name udp2 --resource-group Azuredevops --sku B1 --logs --runtime "PYTHON:3.10"
chmod +x make_predict_azure_app.sh
./make_predict_azure_app.sh 