# Attention
This image is still under development. As a result, it might cause a block at letsencrypt for one week!

# webfrontend
In this repository you'll find the configuration for a docker container thats automatically renews the certs

## Usage 
The image need 3 mounted volumes.
- The nginx configuration dir. In this dir is the full configuration of nginx and all enabled sites. An example is provided in the archive (nginx.tar.gz)[https://github.com/chrros95/webfrontend/blob/master/nginx.tar.gz]
  - In the sub-dir sites-enabled you need to create your configuration file for the enabled site. It is required to name the file by the assigned domain. Based on this filename the image will request the letsencrypt cert.
  - In the sub-dir snippets you'll need to to modify the ssl configuration and add your dhparams. Currently is the file /etc/letsencrypt/dhparam.pem configured. In the demo archive the file is empty!
  - Make sure that for each domain the /.well-known/ dir is accessible. Otherwise the renewal will fail.
- The letsencrpyt configuration dir. In this dir is the full configuration and all certs for the enabled sites. An example is provided in the archive (letsencrpyt.tar.gz)[https://github.com/chrros95/webfrontend/blob/master/letsencrypt.tar.gz]
  - In the archive is only the folder struckture so you need to add the configuration for your letsencrpyt account. The easiest way is to install certbot locally and copy the accounts dir.
- The web-data dir (usually /var/www)
  - In this dir the image will create a sub-dir for each domain. This dir will be used to load the initial cert.

## Known Issues
- The image is currently unable to create a new letsencrypt account
- The image is currently unable to select between multiple available letsencrypt accounts
