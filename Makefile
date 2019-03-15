#######################################################
# Author: Juhapekka Piiroinen <jp@1337.fi>
# License: MIT
#
# Copyright 2019 Juhapekka Piiroinen <jp@1337.fi>
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom
# the Software is furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
# DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#######################################################

all:

login:
	@echo '${ACCOUNT_PASSWORD}' | LPASS_DISABLE_PINENTRY=1 lpass login ${ACCOUNT_USERNAME}

logout:
	@lpass logout -f

add:
	@ansible-playbook add-account.yml --extra-vars="server_name=${SERVER_NAME} account_name=${ACCOUNT_NAME} username=${SERVER_USERNAME} password=${SERVER_PASSWORD}"

update:
	@ansible-playbook change-password.yml -i inventory --limit=${SERVER_NAME} --extra-vars="account_name=${ACCOUNT_NAME}"

install-macos:
	pip install -r requirements.txt
	brew install lastpass-cli

install-linux:
	pip install -r requirements.txt
	apt install bash-completion build-essential cmake libcurl4 libcurl4-openssl-dev libssl-dev libxml2 libxml2-dev libssl1.1 pkg-config ca-certificates xclip
	git clone https://github.com/lastpass/lastpass-cli.git
	pushd lastpass-cli && make && popd
	
