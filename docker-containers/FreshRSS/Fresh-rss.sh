
#From FreshRSS directly. Might use in the future, so not removing
#https://github.com/FreshRSS/FreshRSS/blob/edge/Docker/README.md
#sudo docker run -d --restart unless-stopped --log-opt max-size=10m \
#  -p 8020:80 \
#  -e TZ=America/New_York \
#  -e 'CRON_MIN=1,31' \
#  -v freshrss_data:/var/www/FreshRSS/data \
#  -v freshrss_extensions:/var/www/FreshRSS/extensions \
#  --name freshrss \
#  freshrss/freshrss

sudo docker compose down
sudo docker compose pull
sudo docker compose up -d


