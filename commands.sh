#testing
git clone git@github.com:mkeresty/ud-cloud-devops-p2.git
cd ud-cloud-devops-p2
python3 -m venv ~/.myvenv
source ~/.myvenv/bin/activate
make all
az webapp up --name udp2 --resource-group Azuredevops --sku B1 --logs --runtime "PYTHON:3.10"
chmod +x make_predict_azure_app.sh
./make_predict_azure_app.sh 


#agent setup
az vm create --resource-group Azuredevops --name myLinuxVM --image Ubuntu2204 --generate-ssh-keys --admin-username azureuser --public-ip-sku Standard
sudo groupadd docker
sudo usermod -aG docker $USER
# go to dev portal then click new agent in the pool settings
curl -O https://vstsagentpackage.azureedge.net/agent/4.254.0/vsts-agent-linux-x64-4.254.0.tar.gz
mkdir myagent && cd myagent
tar -xzvf ../vsts-agent-linux-x64-4.254.0.tar.gz
./config.sh
# enter dev portal url
# enter access token
# enter myPool name
# use default vm myLinuxVM
# use default work folder

sudo ./svc.sh install
sudo ./svc.sh start



sudo apt-get update
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa

python --version # Python 3.10.12
sudo apt-get install python3.10-venv
sudo apt-get install python3-pip
sudo apt-get install python3.10-distutils
sudo apt-get -y install zip
pip install pylint==3.2.6
export PATH=$HOME/.local/bin:$PATH

# in web app set startup command to
python3 -m pip install -r requirements.txt && python app.py

