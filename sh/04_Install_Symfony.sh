#!/bin/bash

# Install symfony binary locally
wget https://get.symfony.com/cli/installer -O - | bash

# Move binary globally
sudo mv ~/.symfony/bin/symfony /usr/local/bin/symfony
